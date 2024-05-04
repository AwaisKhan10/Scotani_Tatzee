import 'package:flutter/material.dart';
import 'package:skincanvas/web_screen/screens/mobile/customization/mobile_customization_screen.dart';
import 'package:skincanvas/web_screen/screens/web/customization_product/web_customization_screen.dart';
import 'package:skincanvas/web_screen/widgets/responsive_layout.dart';

class CustomizaionScreenView extends StatefulWidget {
  const CustomizaionScreenView({super.key});

  @override
  State<CustomizaionScreenView> createState() => _CustomizaionScreenViewState();
}

class _CustomizaionScreenViewState extends State<CustomizaionScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8D9AF8),
      body: ResponsiveLayout(
        mobileBody: MobileCustomoizationScreen(),
        tabletBody: MobileCustomoizationScreen(),
        desktopBody: WebCustomoizationScreen(),
      ),
    );
  }
}
