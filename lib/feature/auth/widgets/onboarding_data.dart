import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_app/feature/auth/widgets/custom_text.dart';

class OnboardingData extends StatelessWidget {
  const OnboardingData({
    super.key,
    required this.nameImage,
    required this.text,
    required this.textAlignname,
  });
  final String nameImage;
  final String text;
  final String textAlignname;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 115),
          child: Image.asset(
            nameImage,
            width: 300,
            filterQuality: FilterQuality.high,
          ),
        ),
        Gap(25),
        CustomText(
          text: text,
          clickableText: "Sarah",
          fontSize: 28,
          onTap: () {
            print("Hi sarah -_-");
          },
          fontFamily: 'Luckiest_Guy',
          fontWeight: FontWeight.w600,
        ),
        Gap(13),
        Text(
          textAlign: TextAlign.center,
          textAlignname,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
