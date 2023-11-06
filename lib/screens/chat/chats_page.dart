import 'package:ant_pay_merchant/constants/app_colors.dart';
import 'package:ant_pay_merchant/constants/app_images.dart';
import 'package:ant_pay_merchant/widgets/chat_body_widget.dart';
import 'package:ant_pay_merchant/widgets/chat_header_widget.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  List<Map> users = [
    {"name": "Johnson Thompson okemuteeee", "avatar": male},
    {"name": "Bob Thompson", "avatar": female},
    {"name": "Johnson Marley", "avatar": male},
    {"name": "Monday Thompson", "avatar": female},
    {"name": "Marley Thompson", "avatar": male},
    {"name": "Johnson Marley", "avatar": female},
    {"name": "Monday Thompson", "avatar": male},
    {"name": "Marley Thompson", "avatar": female}
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: appColor,
        body: Stack(
          children: [
            Positioned(
                top: 0, left: 15, child: Image.asset(heart_red_2, width: 70)),
            Column(
              children: [ChatHeaderWidget(users: users), ChatBodyWidget()],
            ),
          ],
        ),
      );

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      );
}
