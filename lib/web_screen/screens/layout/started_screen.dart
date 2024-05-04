import 'package:flutter/material.dart';
import 'package:skincanvas/web_screen/widgets/responsive_layout.dart';
import '../mobile/mobile_started_screen.dart';
import '../web/web_started_screen.dart';

class StartedScreenView extends StatefulWidget {
  const StartedScreenView({super.key});

  @override
  State<StartedScreenView> createState() => _StartedScreenViewState();
}

class _StartedScreenViewState extends State<StartedScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8D9AF8),
      body: ResponsiveLayout(
        mobileBody: MobileStartedScreen(),
        tabletBody: MobileStartedScreen(),
        desktopBody: WebStartedScreen(),
      ),
    );
  }
}
