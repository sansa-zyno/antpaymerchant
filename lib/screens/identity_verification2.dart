import 'package:ant_pay_merchant/constants/app_colors.dart';
import 'package:ant_pay_merchant/constants/app_images.dart';
import 'package:ant_pay_merchant/constants/app_strings.dart';
import 'package:ant_pay_merchant/widgets/GradientButton/GradientButton.dart';
import 'package:ant_pay_merchant/widgets/curved_textfield.dart';
import 'package:ant_pay_merchant/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IdentityVerification2 extends StatefulWidget {
  const IdentityVerification2({Key? key}) : super(key: key);

  @override
  State<IdentityVerification2> createState() => _IdentityVerification2State();
}

class _IdentityVerification2State extends State<IdentityVerification2> {
  bool expanded = false;
  String issuedDate = "";
  String expiryDate = "";

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
                height: 100,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: titleBarOffset,
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
                          text: "Identity Verification",
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(
                          height: 8,
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
                              "Fill in the requied details as appeared on your valid ID ",
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          CustomText(
                            text: "Document Type",
                            color: appColor,
                            weight: FontWeight.bold,
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
                                title: Text("Select Document Type",
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
                            text: "ID Number",
                            color: appColor,
                            weight: FontWeight.bold,
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
                          Container(
                            width: 283,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Date Issued",
                                      color: appColor,
                                      weight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        DateTime? date = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2020),
                                            lastDate: DateTime.now());
                                        if (date != null) {
                                          issuedDate =
                                              "${date.year}-${date.month}-${date.day}";
                                          setState(() {});
                                        }
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  blurRadius: 10,
                                                  offset: Offset(2, 2))
                                            ]),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(Icons.date_range),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            CustomText(text: issuedDate)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Expiry Date",
                                      color: appColor,
                                      weight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        DateTime? date = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2020),
                                            lastDate: DateTime.now());
                                        if (date != null) {
                                          expiryDate =
                                              "${date.year}-${date.month}-${date.day}";
                                          setState(() {});
                                        }
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  blurRadius: 10,
                                                  offset: Offset(2, 2))
                                            ]),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(Icons.date_range),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            CustomText(text: expiryDate)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomText(
                            text: "BVN",
                            color: appColor,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CurvedTextField(
                            hint: "",
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 200,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.upload,
                                  color: appColor,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                CustomText(
                                  text: "Upload Document",
                                  color: appColor,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          GradientButton(
                            title: "Verify",
                            textClr: gd2,
                            clrs: [appColor, appColor],
                            onpressed: () {},
                          ),
                          /*SizedBox(
                            height: 8,
                          ),
                          Container(
                              width: 283,
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "Step 2 of 2",
                                color: appColor,
                              ))*/
                        ],
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
