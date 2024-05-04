import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skincanvas/Controllers/GeneralProvider.dart';
import 'package:skincanvas/Controllers/HomeProvider.dart';
import 'package:skincanvas/main.dart';

class MobileScreenController with ChangeNotifier {
  var homeWatch =
      Provider.of<HomeController>(navigatorkey.currentContext!, listen: false);

  var generalWatch = Provider.of<GeneralController>(
      navigatorkey.currentContext!,
      listen: false);

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
  bool thirdContainerClicked = false;
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

  ///  *****************************************************************************
  ///
  ///
  ///
  ///  **********************  Men Screen Helper ***********************
  ///
  ///
  ///
  ///
  /// ********************************************************************************

  bool isCreateProduct1 = false;
  bool isCustomizedProduct1 = false;
  bool setting1 = false;

  onClickProduct1() {
    isCreateProduct1 = true;
    isCustomizedProduct1 = false;
    setting1 = false;
    notifyListeners();
  }

  onClickCustomized1() {
    isCreateProduct1 = false;
    isCustomizedProduct1 = true;
    setting1 = false;
    notifyListeners();
  }

  onClickSetting1() {
    isCreateProduct1 = false;
    isCustomizedProduct1 = false;
    setting1 = true;
    notifyListeners();
  }

  TextEditingController searchController1 = TextEditingController();
}
