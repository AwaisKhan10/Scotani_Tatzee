import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/main.dart';

class WebScreenHomeController with ChangeNotifier {
  var generalWatch = Provider.of<GeneralController>(
      navigatorkey.currentContext!,
      listen: false);

  ///.............. Bottom Navigation Bar....................///

  int _screenIndex = 0;

  int get screenIndex => _screenIndex;

  void updateScreenIndex(int index) {
    _screenIndex = index;
    notifyListeners();
  }
  // int screenIndex = 0;

  int settingScreenIndex = -1;

  // screenIndexUpdate({index = 0}) {
  //   screenIndex = index;
  //   print('The Screen Index is:' + screenIndex.toString());
  //   notifyListeners();
  // }
  settingScreenIndexUpdate({index = -1}) {
    settingScreenIndex = index;
    print('The settingScreenIndexUpdate Index is:' + screenIndex.toString());
    notifyListeners();
  }
}
