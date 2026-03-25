import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.Imagname, this.padding});
  final String Imagname;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(color: Color.fromARGB(255, 237, 237, 238)),
        child: Padding(
          padding: EdgeInsets.all(padding ?? 12),
          child: Image.asset(Imagname, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
