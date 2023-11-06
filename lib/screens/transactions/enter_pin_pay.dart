import 'package:ant_pay_merchant/constants/app_colors.dart';
import 'package:ant_pay_merchant/constants/app_images.dart';
import 'package:ant_pay_merchant/helpers/common.dart';
import 'package:ant_pay_merchant/providers/app_provider.dart';
import 'package:ant_pay_merchant/screens/transactions/success_alert.dart';
import 'package:ant_pay_merchant/widgets/GradientButton/GradientButton.dart';
import 'package:ant_pay_merchant/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class PayEnterPin extends StatefulWidget {
  String name;
  String amount;
  PayEnterPin(this.name, this.amount);
  @override
  State<PayEnterPin> createState() => _PayEnterPinState();
}

class _PayEnterPinState extends State<PayEnterPin> {
  final FocusNode _pinPutFocusNode = FocusNode();

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
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(stickers04)),
          //color: Color(0xFF1A0130)
          color: appColor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
                top: 0, left: 15, child: Image.asset(heart_red_2, width: 70)),
            Positioned(
                top: 230,
                left: 0,
                child: Image.asset(
                  cards_on_hand,
                  width: 100,
                )),
            Positioned(
                top: 90,
                right: 0,
                child: Image.asset(
                  dollar,
                  width: 50,
                )),
            Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  car,
                  width: 70,
                )),
            Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  money_and_gold,
                  width: 70,
                )),
            Column(
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
                      size: 20,
                      color: Colors.white,
                    ),
                    Spacer(),
                    CustomText(
                      text: "Pay ${widget.name} ${widget.amount}",
                      color: Colors.white,
                    ),
                    Spacer(),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: CustomText(
                      text:
                          "Enter your 5-digit Antpay PIN to approve this transfer ",
                      color: Colors.white,
                      textAlign: TextAlign.center),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Container(
                    width: 283,
                    child: Pinput(
                      length: 5,
                      defaultPinTheme: PinTheme(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8))),
                      onSubmitted: (String pin) => {},
                      focusNode: _pinPutFocusNode,
                      //controller: widget.otp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 100,
                ),
                GradientButton(
                    title: "Proceed",
                    textClr: appColor,
                    clrs: [gd2, gd2],
                    onpressed: () {
                      changeScreen(context, Success("Transfer"));
                    }),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
