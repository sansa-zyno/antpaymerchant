import 'package:ant_pay_merchant/constants/app_colors.dart';
import 'package:ant_pay_merchant/constants/app_images.dart';
import 'package:ant_pay_merchant/helpers/common.dart';
import 'package:ant_pay_merchant/providers/user_controller.dart';
import 'package:ant_pay_merchant/screens/transactions/enter_pin_send.dart';
import 'package:ant_pay_merchant/utils/call_utilities.dart';
import 'package:ant_pay_merchant/utils/permissions.dart';
import 'package:ant_pay_merchant/widgets/GradientButton/GradientButton.dart';
import 'package:ant_pay_merchant/widgets/curved_textfield.dart';
import 'package:ant_pay_merchant/widgets/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cometchat/cometchat_sdk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendToAccount extends StatefulWidget {
  const SendToAccount({Key? key}) : super(key: key);

  @override
  State<SendToAccount> createState() => _SendToAccountState();
}

class _SendToAccountState extends State<SendToAccount> {
  late UserController userController;
  Stream<QuerySnapshot>? callhistory;
  bool expanded = false;
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
                    child: SingleChildScrollView(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            CustomText(
                              text: "Sending From",
                              color: appColor,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                height: expanded ? null : 58,
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
                                child: ExpansionTile(
                                  expandedAlignment: Alignment.centerLeft,
                                  expandedCrossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  onExpansionChanged: (x) {
                                    expanded = x;
                                    setState(() {});
                                  },
                                  title: Text("Select account",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14)),
                                  trailing: Icon(Icons.arrow_drop_down,
                                      color: appColor),
                                  children: [],
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            CustomText(
                              text: "Amount",
                              color: appColor,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CurvedTextField(
                              hint: "",
                              //controller: name,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            CustomText(
                              text: "Recipient's Bank",
                              color: appColor,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                height: expanded ? null : 58,
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
                                child: ExpansionTile(
                                  expandedAlignment: Alignment.centerLeft,
                                  expandedCrossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  onExpansionChanged: (x) {
                                    expanded = x;
                                    setState(() {});
                                  },
                                  title: Text("Select bank",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14)),
                                  trailing: Icon(Icons.arrow_drop_down,
                                      color: appColor),
                                  children: [],
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            CustomText(
                              text: "Recipient's Account Number",
                              color: appColor,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CurvedTextField(
                              hint: "",
                              //controller: name,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              text:
                                  "Confirm recipient’s name before tapping proceed",
                              size: 12,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: 283,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomText(text: "Add to beneficiary list"),
                                  Switch(
                                      activeColor: Colors.white,
                                      activeTrackColor: appColor,
                                      value: true,
                                      onChanged: (x) {})
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GradientButton(
                              title: "Proceed",
                              textClr: Colors.white,
                              clrs: [Colors.grey, Colors.white],
                              onpressed: () {
                                changeScreen(context, SendEnterPin());
                              },
                            ),
                          ],
                        ),
                      ),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
