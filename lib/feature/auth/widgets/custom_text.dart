import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Core/Const/App_Color.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.textAlign,
    required this.fontSize,
    this.clickableText,
    this.onTap,
    required this.fontFamily,
    required this.fontWeight,
    this.fontSizeclickableText,
  });

  final String text;
  final String? clickableText;
  final VoidCallback? onTap;
  final TextAlign? textAlign;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final double? fontSizeclickableText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      text: TextSpan(
        style: TextStyle(
          fontFamily: fontFamily,
          fontWeight: fontWeight,

          fontSize: fontSize,
          letterSpacing: 0.2,
          color: AppColors.textcolor,
        ),
        children: [
          TextSpan(text: text),
          if (clickableText != null)
            TextSpan(
              text: clickableText,
              style: TextStyle(
                color: AppColors.btmcolor,
                fontSize: fontSizeclickableText,
                fontFamily: "Luckiest_Guy",
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
        ],
      ),
    );
  }
}




//  RichText(
//                 text: TextSpan(
//                   style: TextStyle(
//                     color: Color(0xff6B7280),
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   children: [
//                     TextSpan(text: "Don’t have an Account? "),
//                     TextSpan(
//                       text: "Sign-Up",
//                       style: TextStyle(
//                         color: Color(0xff4D7881),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                         fontFamily: "Luckiest_Guy",
//                       ),
//                       recognizer: TapGestureRecognizer()
//                         ..onTap = () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => Loginscreen(),
//                             ),
//                           );
//                         },
//                     ),
//                   ],
//                 ),
//               ),