import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? label;
  final double? height;
  final double? width;
  final double? elevation;
  final Function onTap;
  final Color? bgColor;
  final Color? textColor;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool isLoading;

  AppButton(this.onTap,
      {required this.label,
      this.isLoading = false,
      this.bgColor,
      this.textColor,
      this.height,
      this.prefixIcon,
      this.suffixIcon,
      this.width,
      this.elevation});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: width ?? double.infinity, height: height ?? 55),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0,
          primary: bgColor ?? Color(0xFF6576ff),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(25),
          // ),
        ),
        onPressed: () {
          onTap();
        },
        child: Text(
          label!,
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito',
              fontSize: 16),
        ),
      ),
    );
  }
}
