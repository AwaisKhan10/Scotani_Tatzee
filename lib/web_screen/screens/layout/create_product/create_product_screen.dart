import 'package:flutter/material.dart';
import 'package:skincanvas/web_screen/screens/mobile/create_product/mobile_create_product_screen.dart';
import 'package:skincanvas/web_screen/screens/web/create_product/create_product_screen.dart';
import 'package:skincanvas/web_screen/widgets/responsive_layout.dart';

class CreateProductScreenView extends StatefulWidget {
  const CreateProductScreenView({super.key});

  @override
  State<CreateProductScreenView> createState() =>
      _CreateProductScreenViewViewState();
}

class _CreateProductScreenViewViewState extends State<CreateProductScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8D9AF8),
      body: ResponsiveLayout(
        mobileBody: MobileCreateProductScreen(),
        tabletBody: MobileCreateProductScreen(),
        desktopBody: WebCreateProductScreen(),
      ),
    );
  }
}
