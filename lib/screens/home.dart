import 'package:ant_pay_merchant/constants/app_colors.dart';
import 'package:ant_pay_merchant/constants/app_images.dart';
import 'package:ant_pay_merchant/providers/user_controller.dart';
import 'package:ant_pay_merchant/screens/chat/chats_page.dart';
import 'package:ant_pay_merchant/screens/wallet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int pageIndex;
  late Widget _showPage;
  late ChatsPage _chatsPage;
  late Wallet _wallet;

  //navbar
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _chatsPage;
      case 1:
        return _wallet;

      default:
        return new Container(
            child: new Center(
          child: new Text(
            'No Page found by page thrower',
            style: new TextStyle(fontSize: 30),
          ),
        ));
    }
  }

  /* bg() async {
    await Future.delayed(Duration(seconds: 30), () async {
      await AppbackgroundService().startBg();
    });
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageIndex = 0;
    _chatsPage = ChatsPage();
    _wallet = Wallet();
    _showPage = _pageChooser(pageIndex);
    UserController controller =
        Provider.of<UserController>(context, listen: false);
    if (controller.getCurrentUser.uid != null) {
      /*  CallMethods()
          .callStream(uid: controller.getCurrentUser.uid!)
          .listen((snapshot) {
        if (snapshot.data() != null) {
          Call call = Call.fromMap(snapshot.data() as Map<String, dynamic>);
          if (!call.hasDialled!) {
            if (snapshot["fkey"] != "") {
              CallHistory().updateCall(call: call, fkey: snapshot["fkey"]);
            }
            if (call.type == "video") {
              Get.to(VideoPickupScreen(call: call));
            } else {
              Get.to(VoicePickupScreen(call: call));
            }
          }
        }
      });*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showPage,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image.asset(
                  chat,
                  color: appColor.withOpacity(0.5),
                  width: 30,
                ),
                label: ""),
            // BottomNavigationBarItem(icon: Image.asset(camera), label: ""),
            BottomNavigationBarItem(
                icon: Image.asset(
                  wallet,
                  width: 30,
                ),
                label: ""),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: pageIndex,
          selectedItemColor: appColor,
          unselectedItemColor: appColor.withOpacity(0.5),
          onTap: (int tappedIndex) {
            setState(() {
              pageIndex = tappedIndex;
              _showPage = _pageChooser(pageIndex);
            });
          }),
    );
  }
}
