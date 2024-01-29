import 'package:clock_app/utils/enums.dart';
import 'package:flutter/foundation.dart';

class MenuInfo extends ChangeNotifier{
  MenuType menuType;
  String title;
  String imageSource;
  MenuInfo(this.menuType,{ required this.title, required this.imageSource});

  updateMenu(MenuInfo menuInfo){
    menuType = menuInfo.menuType;
    title = menuInfo.title;
    imageSource = menuInfo.imageSource;
    // important to call notifyListeners() to update the UI
    notifyListeners();
  }
}