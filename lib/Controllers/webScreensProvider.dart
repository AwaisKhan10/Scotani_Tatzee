import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/main.dart';

class WebScreensController with ChangeNotifier {
  var generalWatch = Provider.of<GeneralController>(
      navigatorkey.currentContext!,
      listen: false);

  ///  *****************************************************************************
  ///
  ///
  ///
  ///  **********************    Creat Product Screen Data   ***********************
  ///
  ///
  ///
  ///
  /// ********************************************************************************

  bool isCreateProduct = false;
  bool isCustomizedProduct = true;
  bool setting = false;

  onClickProduct() {
    isCreateProduct = true;
    isCustomizedProduct = false;
    setting = false;
    notifyListeners();
  }

  onClickCustomized() {
    isCreateProduct = false;
    isCustomizedProduct = true;
    setting = false;
    notifyListeners();
  }

  onClickSetting() {
    isCreateProduct = false;
    isCustomizedProduct = false;
    setting = true;
    notifyListeners();
  }

  TextEditingController searchController = TextEditingController();

  bool firstContainerClicked = false;
  bool secondContainerClicked = false;
  bool thirdContainerClicked = true;
  bool forthContainerClicked = false;
  bool fifthContainerClicked = false;

  handleContainerClick(int containerIndex) {
    firstContainerClicked = containerIndex == 0;
    secondContainerClicked = containerIndex == 1;
    thirdContainerClicked = containerIndex == 2;
    forthContainerClicked = containerIndex == 3;
    fifthContainerClicked = containerIndex == 4;
    notifyListeners();
  }

  ///  *****************************************************************************
  ///
  ///
  ///
  ///  **********************    Creat Product  Detail Screen Data   ***********************
  ///
  ///
  ///
  ///
  /// ********************************************************************************
  ///
  ///
  ///

  // Color primaryColor = mycolors[0];

  int selectedColorIndex = 0;

  bool isCreateProduct1 = true;
  bool isCustomizedProduct1 = false;
  bool setting1 = false;

  onClickProduct1() {
    isCreateProduct = true;
    isCustomizedProduct = false;
    setting = false;
    notifyListeners();
  }

  onClickCustomized1() {
    isCreateProduct = false;
    isCustomizedProduct = true;
    setting = false;
    notifyListeners();
  }

  onClickSetting1() {
    isCreateProduct = false;
    isCustomizedProduct = false;
    setting = true;
    notifyListeners();
  }

  int counter = 0;

  increment() {
    counter++;
    notifyListeners();
  }

  decrement() {
    if (counter > 0) {
      counter--;
    }
    notifyListeners();
  }

  bool isSmall = true;
  bool isMedium = false;
  bool isLarge = false;
  bool isXLarge = false;

  onClickSmall() {
    isSmall = true;
    isMedium = false;
    isLarge = false;
    isXLarge = false;
    notifyListeners();
  }

  onClickMedium() {
    isSmall = false;
    isMedium = true;
    isLarge = false;
    isXLarge = false;
    notifyListeners();
  }

  onClickLarge() {
    isSmall = false;
    isMedium = false;
    isLarge = true;
    isXLarge = false;
    notifyListeners();
  }

  onClickXtraLarge() {
    isSmall = false;
    isMedium = false;
    isLarge = false;
    isXLarge = true;
    notifyListeners();
  }

  TextEditingController searchController1 = TextEditingController();

  bool isBackground = false;
  bool isDesignChnage = false;
  bool isDelete = true;
  bool isChangeProduct = false;

  handleContainerTools(int containerIndex) {
    isBackground = containerIndex == 0;
    isDesignChnage = containerIndex == 1;
    isDelete = containerIndex == 2;
    isChangeProduct = containerIndex == 3;

    notifyListeners();
  }

  bool isSelect = false;

  onClick() {
    isSelect = !isSelect;
    notifyListeners();
  }
}
