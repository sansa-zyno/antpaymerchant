import 'package:ant_pay_merchant/constants/app_colors.dart';
import 'package:ant_pay_merchant/constants/app_images.dart';
import 'package:ant_pay_merchant/helpers/common.dart';
import 'package:ant_pay_merchant/providers/user_controller.dart';
import 'package:ant_pay_merchant/screens/transactions/enter_pin_withdrawal.dart';
import 'package:ant_pay_merchant/widgets/GradientButton/GradientButton.dart';
import 'package:ant_pay_merchant/widgets/curved_textfield.dart';
import 'package:ant_pay_merchant/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({Key? key}) : super(key: key);

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  bool expanded1 = false;
  bool expanded2 = false;
  late UserController userController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userController = Provider.of<UserController>(context);
    return Scaffold(
      backgroundColor: appColor,
      body: Stack(
        children: [
          Positioned(
              top: 0, left: 15, child: Image.asset(heart_red_2, width: 70)),
          Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: 270,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.arrow_back_ios_new,
                            color: gd2,
                            size: 20,
                          ),
                          Spacer(),
                          CustomText(
                            text: "Withdraw",
                            color: Colors.white,
                            size: 16,
                          ),
                          Spacer(),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                      Spacer()
                    ],
                  ),
                ),
                Positioned(
                  top: 250,
                  left: 0,
                  right: 0,
                  bottom: 0,
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
                            height: 30,
                          ),
                          Container(
                              width: 283,
                              child: CustomText(
                                text: "Withdraw From",
                                color: appColor,
                                weight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                              height: expanded1 ? null : 58,
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
                                  expanded1 = x;
                                  setState(() {});
                                },
                                title: Text("Select Account",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                                trailing: Icon(Icons.arrow_drop_down,
                                    color: appColor),
                                children: [],
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                              width: 283,
                              child: CustomText(
                                text: "Withdraw To",
                                color: appColor,
                                weight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                              height: expanded1 ? null : 58,
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
                                  expanded1 = x;
                                  setState(() {});
                                },
                                title: Text("Select Account",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                                trailing: Icon(Icons.arrow_drop_down,
                                    color: appColor),
                                children: [],
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                              width: 283,
                              child: CustomText(
                                text: "Amount",
                                color: appColor,
                                weight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          CurvedTextField(
                            hint: "",
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          GradientButton(
                            title: "Withdraw",
                            clrs: [Color(0xffDAAFFF), Color(0xffDAAFFF)],
                            onpressed: () {
                              changeScreen(context, WithdrawEnterPin());
                            },
                          )
                        ],
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 30),
                  child: Image.asset(
                    tgn_14,
                    height: 300,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
