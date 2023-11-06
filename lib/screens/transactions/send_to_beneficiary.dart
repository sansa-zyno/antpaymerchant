import 'package:ant_pay_merchant/constants/app_colors.dart';
import 'package:ant_pay_merchant/constants/app_images.dart';
import 'package:ant_pay_merchant/helpers/common.dart';
import 'package:ant_pay_merchant/providers/user_controller.dart';
import 'package:ant_pay_merchant/screens/transactions/send_to_account.dart';
import 'package:ant_pay_merchant/utils/call_utilities.dart';
import 'package:ant_pay_merchant/utils/permissions.dart';
import 'package:ant_pay_merchant/widgets/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cometchat/cometchat_sdk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendToBeneficiary extends StatefulWidget {
  const SendToBeneficiary({Key? key}) : super(key: key);

  @override
  State<SendToBeneficiary> createState() => _SendToBeneficiaryState();
}

class _SendToBeneficiaryState extends State<SendToBeneficiary> {
  late UserController userController;
  Stream<QuerySnapshot>? callhistory;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: Stack(
        children: [
          Positioned(
              top: 0, left: 15, child: Image.asset(heart_red_2, width: 70)),
          Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                        Spacer(),
                        CustomText(
                          text: "Send To Bank Account",
                          color: Colors.white,
                        ),
                        Spacer(),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        height: 40,
                        width: 240,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 100,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Color(0xffADFFE1),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: CustomText(
                                  text: "Local",
                                  color: appColor,
                                  size: 14,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(),
                                child: CustomText(
                                  text: "International",
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text:
                              "Choose a beneficiary, or send to a new beneficiary",
                          size: 12,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding: EdgeInsets.all(8),
                            width: 283,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 10,
                                      offset: Offset(2, 2))
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "John Doe",
                                      color: appColor,
                                      weight: FontWeight.bold,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(right: 15),
                                          decoration: BoxDecoration(
                                              border:
                                                  Border(right: BorderSide())),
                                          child: CustomText(
                                            text: "0123456789",
                                            size: 12,
                                          ),
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(left: 15),
                                            child: CustomText(
                                              text: "Bank name",
                                              size: 12,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                )
                              ],
                            )),
                      ],
                    )),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: InkWell(
          onTap: () {
            changeScreen(context, SendToAccount());
          },
          child: Image.asset(
            addItem,
            height: 50,
          )),
    );
  }
}
