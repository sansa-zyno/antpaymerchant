import 'package:ant_pay_merchant/constants/app_colors.dart';
import 'package:ant_pay_merchant/constants/app_images.dart';
import 'package:ant_pay_merchant/helpers/common.dart';
import 'package:ant_pay_merchant/providers/user_controller.dart';
import 'package:ant_pay_merchant/screens/edit_profile.dart';
import 'package:ant_pay_merchant/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    UserController userController = Provider.of<UserController>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(stickers)),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [appColor, gd2, gd3, gd4, gd5],
            stops: [0.02, 0.2, 0.6, 0.8, 1.0]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(heart_red, width: 50),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                sun,
                width: 100,
              ),
            ),
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
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: appColor,
                        ),
                      ),
                      Spacer(),
                      CustomText(
                        text: "Your Profile",
                        size: 16,
                        weight: FontWeight.bold,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          changeScreen(context, EditProfile());
                        },
                        child: CustomText(
                          text: "Edit",
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          userController.getCurrentUser.avatarUrl!),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: CustomText(
                      text: userController.getCurrentUser.displayName!,
                      textAlign: TextAlign.center,
                      color: appColor,
                      size: 16,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: CustomText(
                      // text: userController.getCurrentUser.status!,
                      text: "",
                      textAlign: TextAlign.center,
                      color: appColor,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 283,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 10,
                              offset: Offset(2, 2))
                        ]),
                    child: ListTile(
                        title: CustomText(
                          text: "Account",
                          color: appColor,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: appColor,
                        ),
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -1)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 283,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: ListTile(
                        title: CustomText(
                          text: "Chats",
                          color: appColor,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: appColor,
                        ),
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -1)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 283,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 10,
                              offset: Offset(2, 2))
                        ]),
                    child: ListTile(
                        title: CustomText(
                          text: "Notifications",
                          color: appColor,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: appColor,
                        ),
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -1)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 283,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 10,
                              offset: Offset(2, 2))
                        ]),
                    child: ListTile(
                        title: CustomText(
                          text: "Help",
                          color: appColor,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: appColor,
                        ),
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -1)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 283,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 10,
                              offset: Offset(2, 2))
                        ]),
                    child: ListTile(
                        title: CustomText(
                          text: "Invite Friends",
                          color: appColor,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: appColor,
                        ),
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -1)),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
            Positioned(
                top: 280,
                left: 0,
                child: Image.asset(
                  cards_on_hand,
                  width: 100,
                )),
          ],
        ),
      ),
    );
  }
}
