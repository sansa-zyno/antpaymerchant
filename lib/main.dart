import 'dart:developer';

import 'package:ant_pay_merchant/constants/api.dart';
import 'package:ant_pay_merchant/constants/app_images.dart';
import 'package:ant_pay_merchant/constants/app_strings.dart';
import 'package:ant_pay_merchant/helpers/common.dart';
import 'package:ant_pay_merchant/providers/app_provider.dart';
import 'package:ant_pay_merchant/providers/user_controller.dart';
import 'package:ant_pay_merchant/screens/home.dart';
import 'package:ant_pay_merchant/screens/splash.dart';
import 'package:ant_pay_merchant/services/http.service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cometchat/cometchat_sdk.dart';
import 'package:dio/dio.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart' hide Response;
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

AppSettings appSettings = (AppSettingsBuilder()
      ..subscriptionType = CometChatSubscriptionType.allUsers
      ..region = cometchatRegion
      ..autoEstablishSocketConnection = true)
    .build();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: 'recaptcha-v3-site-key',
      // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
      // your preferred provider. Choose from:
      // 1. debug provider
      // 2. safety net provider
      // 3. play integrity provider
      androidDebugProvider: true);
  FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
  CometChat.init(cometchatAppId, appSettings,
      onSuccess: (String successMessage) {
    debugPrint("Initialization completed successfully  $successMessage");
  }, onError: (CometChatException excep) {
    debugPrint("Initialization failed with exception: ${excep.message}");
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserController()),
        ChangeNotifierProvider(create: (context) => AppProvider())
      ],
      child: GetMaterialApp(
          title: 'Ant Pay',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: Splash()),
    );
  }
}

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  late AppProvider appProvider;
  late UserController userController;
  checkConnectionAndLogin() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      loginUser(FirebaseAuth.instance.currentUser!.uid, context);
      loginOnAntpay();
    } else {
      //Get.defaultDialog(title: "Eroor", middleText: "No data connection");
      checkConnectionAndLogin();
    }
  }

  loginOnAntpay() async {
    log("log called");
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("merchants")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (doc["isReadyForTxn"]) {
      Response response = await HttpService.post(Api.login, {
        "email": doc["email"],
        "password":
            "${doc["firstname"] + "_${FirebaseAuth.instance.currentUser!.phoneNumber}"}",
      });
      Map result = response.data;
      log(result.toString());
      if (result["status"]) {
        appProvider.setToken(result["data"]["token"]);
      } else {
        Get.defaultDialog(
            title: "Error", middleText: "There was an error login user");
      }
    }
  }

  //Login User function must pass userid and authkey should be used only while developing
  loginUser(String userId, BuildContext context) async {
    User? _user = await CometChat.getLoggedInUser();
    try {
      if (_user != null) {
        await CometChat.logout(onSuccess: (_) {}, onError: (_) {});
      }
    } catch (_) {}

    await CometChat.login(userId, cometchatAuthKey,
        onSuccess: (User loggedInUser) {
      debugPrint("Login Successful : $loggedInUser");
      _user = loggedInUser;
    }, onError: (CometChatException e) {
      log("Login failed with exception:  ${e.message}");
    });

    //if login is successful
    if (_user != null) {
      appProvider.conversationData();
      userController.getCurrentUserInfo();
      Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
            child: Home()),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appProvider = Provider.of<AppProvider>(context, listen: false);
    userController = Provider.of<UserController>(context, listen: false);
    if (FirebaseAuth.instance.currentUser != null) {
      checkConnectionAndLogin();
    } else {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        changeScreenReplacement(context, Splash());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(stickers)),
          color: Color(0xff3F007B)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Image.asset(
          splash_ant,
          width: 150,
        )),
      ),
    );
  }
}
