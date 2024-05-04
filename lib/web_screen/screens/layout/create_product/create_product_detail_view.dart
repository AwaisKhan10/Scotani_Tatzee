import 'package:flutter/material.dart';
import 'package:skincanvas/web_screen/screens/mobile/create_product/mobile_product_detail_screen.dart';
import 'package:skincanvas/web_screen/screens/web/create_product/product_detail_screen.dart';
import 'package:skincanvas/web_screen/widgets/responsive_layout.dart';

class CreateProductDetailScreenView extends StatefulWidget {
  const CreateProductDetailScreenView({super.key});

  @override
  State<CreateProductDetailScreenView> createState() =>
      _CreateProductDetailScreenViewState();
}

class _CreateProductDetailScreenViewState
    extends State<CreateProductDetailScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8D9AF8),
      body: ResponsiveLayout(
        mobileBody: MobileProductDetailScreen(),
        tabletBody: MobileProductDetailScreen(),
        desktopBody: WebProductDetailScreen(),
      ),
    );
  }
}
