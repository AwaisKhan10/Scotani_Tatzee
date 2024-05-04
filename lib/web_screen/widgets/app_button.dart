import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  VoidCallback onPressed;
  String btnLabel;
  double width;
  double height;
  Color? color;
  Color? textColor;
  Color? borderColor;
  bool showIcon;
  double? textSize;
  BorderRadius? borderRadius;

  AppButton(
      {super.key,
      required this.onPressed,
      required this.btnLabel,
      this.showIcon = false,
      this.color,
      this.textSize = 18,
      this.borderColor,
      this.textColor = Colors.white,
      this.width = 350,
      this.borderRadius,
      this.height = 52});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Color(0xffFD3131),
        fixedSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(24),
        ),
      ),
      onPressed: onPressed,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Text(
          btnLabel,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: textSize,
          ),
        ),
      ),
    );
  }
}
