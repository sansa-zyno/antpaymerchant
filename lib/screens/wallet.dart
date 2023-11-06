import 'package:ant_pay_merchant/constants/app_colors.dart';
import 'package:ant_pay_merchant/constants/app_images.dart';
import 'package:ant_pay_merchant/constants/app_strings.dart';
import 'package:ant_pay_merchant/helpers/common.dart';
import 'package:ant_pay_merchant/providers/app_provider.dart';
import 'package:ant_pay_merchant/providers/user_controller.dart';
import 'package:ant_pay_merchant/screens/transactions/fund_account.dart';
import 'package:ant_pay_merchant/screens/transactions/new_card.dart';
import 'package:ant_pay_merchant/screens/transactions/new_virtual_card.dart';
import 'package:ant_pay_merchant/screens/transactions/send_money.dart';
import 'package:ant_pay_merchant/screens/transactions/withdraw.dart';
import 'package:ant_pay_merchant/screens/wallet_settings.dart';
import 'package:ant_pay_merchant/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  late AppProvider appProvider;
  late UserController userController;
  @override
  Widget build(BuildContext context) {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]},';
    appProvider = Provider.of<AppProvider>(context);
    userController = Provider.of<UserController>(context);
    return Scaffold(
      backgroundColor: appColor,
      body: Stack(
        children: [
          Positioned(
              top: 0, left: 15, child: Image.asset(heart_red_2, width: 70)),
          Column(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: titleBarOffset,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        /* InkWell(
                          onTap: () {
                            changeScreenRemoveUntill(context, Home());
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),*/
                        Spacer(),
                        CustomText(
                          text: "Wallet",
                          color: Colors.white,
                          size: 16,
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            changeScreen(context, WalletSettings());
                          },
                          child: Stack(
                            children: [
                              Icon(
                                Icons.settings,
                                color: gd2,
                              ),
                              Positioned(
                                  top: 0,
                                  right: 0,
                                  child: CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Colors.red,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text: "One card multiple currencies",
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 90),
                        width: double.infinity,
                        height: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(image: AssetImage(stickers)),
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
                          child: Column(
                            children: [
                              SizedBox(height: 130),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        userController
                                                .getCurrentUser.isReadyForTxn!
                                            ? changeScreen(
                                                context, NewVirtualCard())
                                            : {};
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.add,
                                            size: 15,
                                          ),
                                          SizedBox(width: 3),
                                          CustomText(
                                            text: "Create Virtual Card",
                                            size: 12,
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        userController
                                                .getCurrentUser.isReadyForTxn!
                                            ? changeScreen(context, NewCard())
                                            : {};
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.add,
                                            size: 15,
                                          ),
                                          SizedBox(width: 3),
                                          CustomText(
                                            text: "Add Card",
                                            size: 12,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 50),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            userController.getCurrentUser
                                                    .isReadyForTxn!
                                                ? changeScreen(
                                                    context, SendMoney())
                                                : {};
                                          },
                                          child: Image.asset(
                                            send,
                                            height: 26,
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        CustomText(
                                          text: "Send",
                                          size: 12,
                                        )
                                      ],
                                    ),
                                    /* Column(
                                      children: [
                                        Image.asset(
                                          request,
                                          height: 26,
                                        ),
                                        SizedBox(height: 15),
                                        CustomText(
                                          text: "Request",
                                          size: 12,
                                        )
                                      ],
                                    ),*/
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            userController.getCurrentUser
                                                    .isReadyForTxn!
                                                ? changeScreen(
                                                    context, Withdraw())
                                                : {};
                                          },
                                          child: Image.asset(
                                            withdraw,
                                            height: 26,
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        CustomText(
                                          text: "Withdraw",
                                          size: 12,
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            userController.getCurrentUser
                                                    .isReadyForTxn!
                                                ? changeScreen(
                                                    context, FundAccount())
                                                : {};
                                          },
                                          child: Image.asset(
                                            fund,
                                            height: 26,
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        CustomText(
                                          text: "Fund",
                                          size: 12,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 50),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 60),
                                decoration: BoxDecoration(
                                    color: appColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  children: [
                                    CustomText(
                                      text: "Check Your Transaction History",
                                      textAlign: TextAlign.center,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 15),
                                    Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: gd2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: CustomText(
                                        text: "View History",
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        )),
                    Container(
                      height: 200,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: gd2, borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                splash_ant,
                                height: 50,
                              ),
                              Row(
                                children: [
                                  CustomText(
                                    text: "View Account",
                                    color: appColor,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    width: 50,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: appColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: CustomText(
                                      text: "USD",
                                      textAlign: TextAlign.center,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Your balance is ",
                                    color: appColor,
                                  ),
                                  SizedBox(height: 15),
                                  CustomText(
                                    text: userController
                                            .getCurrentUser.isReadyForTxn!
                                        ? "3205820"
                                            .replaceAllMapped(reg, mathFunc)
                                        : "Unavailabe",
                                    color: appColor,
                                    size: 16,
                                    weight: FontWeight.bold,
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: appColor),
                                    borderRadius: BorderRadius.circular(8)),
                                child: CustomText(
                                  text: "Today's Rates",
                                  color: appColor,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
