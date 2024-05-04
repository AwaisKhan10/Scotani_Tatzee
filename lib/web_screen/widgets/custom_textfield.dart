import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {super.key,
      required this.text,
      required this.keyBoardType,
      this.onChanged,
      this.width = 350,
      this.controller});

  final String text;
  double width;
  final Function(String)? onChanged;

  final TextInputType keyBoardType;

  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 52,
        width: width,
        child: TextFormField(
          keyboardType: keyBoardType,
          controller: controller,
          onChanged: (val) => onChanged!(val),
          decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(
                color: Color(0xff535151),
                fontSize: 16,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ),
    );
  }
}
