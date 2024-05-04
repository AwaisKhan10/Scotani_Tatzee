import 'package:flutter/material.dart';

class DesignMaterialProvider with ChangeNotifier {
  int _selectedFabricIndex = -1;
  int _selectedStyleTypeIndex = -1;
  int _selectedCulturalStyle = -1;

  int get selectedFabricIndex => _selectedFabricIndex;
  int get selectedStyleTypeIndex => _selectedStyleTypeIndex;
  int get selectedCulturalStyle => _selectedCulturalStyle;

  set selectedFabricIndex(int index) {
    _selectedFabricIndex = index;
    notifyListeners();
  }

  set selectedStyleTypeIndex(int index) {
    _selectedStyleTypeIndex = index;
    notifyListeners();
  }

  set selectedCulturalStyleIndex(int index) {
    _selectedCulturalStyle = index;
    notifyListeners();
  }
}
