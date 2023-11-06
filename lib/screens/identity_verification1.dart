import 'dart:convert';
import 'dart:developer';
import 'package:ant_pay_merchant/constants/api.dart';
import 'package:ant_pay_merchant/constants/app_colors.dart';
import 'package:ant_pay_merchant/constants/app_images.dart';
import 'package:ant_pay_merchant/constants/app_strings.dart';
import 'package:ant_pay_merchant/helpers/common.dart';
import 'package:ant_pay_merchant/providers/app_provider.dart';
import 'package:ant_pay_merchant/providers/user_controller.dart';
import 'package:ant_pay_merchant/services/http.service.dart';
import 'package:ant_pay_merchant/widgets/GradientButton/GradientButton.dart';
import 'package:ant_pay_merchant/widgets/curved_textfield.dart';
import 'package:ant_pay_merchant/widgets/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cometchat/cometchat_sdk.dart';
import 'package:country_picker/country_picker.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:provider/provider.dart';
import 'package:cometchat/models/user.dart' as ct;

class IdentityVerification1 extends StatefulWidget {
  const IdentityVerification1({Key? key}) : super(key: key);

  @override
  State<IdentityVerification1> createState() => _IdentityVerification1State();
}

class _IdentityVerification1State extends State<IdentityVerification1> {
  late AppProvider appProvider;
  late UserController userController;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  // TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  bool loading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appProvider = Provider.of<AppProvider>(context);
    userController = Provider.of<UserController>(context);
    return Container(
      /*onWillPop: () async {
        bool result = false;
        if (loading) {
          result = false;
        } else {
          result = true;
        }
        return result;
      },*/
      child: Scaffold(
        backgroundColor: appColor,
        body: Stack(
          children: [
            Positioned(
                top: 0, left: 15, child: Image.asset(heart_red_2, width: 70)),
            Column(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: titleBarOffset),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          /*Icon(
                            Icons.arrow_back_ios_new,
                            color: gd2,
                            size: 20,
                          ),*/
                          Spacer(),
                          CustomText(
                            text: "Identity Verification",
                            color: Colors.white,
                            size: 16,
                          ),
                          Spacer(),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text:
                                "Fill in the required information to verify your identity",
                            size: 12,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        //image: DecorationImage(image: AssetImage(stickers)),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [appColor, gd2, gd3, gd4, gd5],
                            stops: [0.02, 0.2, 0.6, 0.8, 1.0]),
                      ),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              CustomText(
                                text: "First Name",
                                color: appColor,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CurvedTextField(
                                hint: "Enter first name",
                                controller: firstname,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              CustomText(
                                text: "Last Name",
                                color: appColor,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CurvedTextField(
                                hint: "Enter last name",
                                controller: lastname,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              CustomText(
                                text: "Email",
                                color: appColor,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CurvedTextField(
                                hint: "Enter email address",
                                controller: email,
                              ),
                              /* SizedBox(
                                height: 15,
                              ),
                              CustomText(
                                text: "Home Address",
                                color: appColor,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CurvedTextField(
                                hint: "Enter Home Address",
                                controller: address,
                              ),*/
                              /* SizedBox(
                                height: 15,
                              ),
                              CustomText(
                                text: "Password",
                                color: appColor,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CurvedTextField(
                                hint: "Enter password",
                                obsecureText: true,
                                controller: password,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              CustomText(
                                text: "Confirm Password",
                                color: appColor,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CurvedTextField(
                                hint: "Confirm password",
                                obsecureText: true,
                                controller: cpassword,
                              ),*/
                              SizedBox(
                                height: 150,
                              ),
                              loading
                                  ? Container(
                                      width: 283,
                                      child: Center(
                                          child: CircularProgressIndicator()))
                                  : GradientButton(
                                      title: "Submit",
                                      textClr: gd2,
                                      clrs: [appColor, appColor],
                                      onpressed: () {
                                        registerOnAntpay();
                                      },
                                    ),
                              SizedBox(
                                height: 50,
                              ),
                              /*Container(
                                  width: 283,
                                  alignment: Alignment.center,
                                  child: CustomText(
                                    text: "Step 1 of 2",
                                    color: appColor,
                                  ))*/
                            ],
                          ),
                        ),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  registerOnAntpay() async {
    loading = true;
    setState(() {});
    Response response = await HttpService.post(Api.register, {
      "first_name": firstname.text.trim(),
      "last_name": lastname.text.trim(),
      "email": email.text.trim(),
      "phone": FirebaseAuth.instance.currentUser!.phoneNumber,
      "country_id": int.parse(appProvider.dialcode.replaceAll("+", "")),
      "password":
          "${firstname.text.capitalizeFirst.toString() + "_${FirebaseAuth.instance.currentUser!.phoneNumber}"}",
      "password_confirmation":
          "${firstname.text.capitalizeFirst.toString() + "_${FirebaseAuth.instance.currentUser!.phoneNumber}"}"
    });
    Map result = response.data;
    log(result.toString());
    if (result["status"]) {
      appProvider.setToken(result["data"]["token"]);
      updateDataOnFB().then((value) {
        userController.getCurrentUserInfo();
      });
    } else {
      Get.defaultDialog(
          title: "Error", middleText: "There was an error registering user");
    }
  }

  Future updateDataOnFB() async {
    log("${firstname.text.capitalizeFirst.toString() + "_${FirebaseAuth.instance.currentUser!.phoneNumber}"}");
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "email": email.text.trim(),
      "firstname": firstname.text.capitalizeFirst.toString(),
      "lastname": lastname.text.capitalizeFirst.toString(),
      "isReadyForTxn": true,
    });
    loading = false;
    setState(() {});
  }
}
