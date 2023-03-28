import 'package:get/get.dart';

enum PageName { HOME, FAVORITE, MYPAGE }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changeBottomNav(int value) {
    var page = PageName.values[value];
    switch(page){
      case PageName.HOME:
        //Get.to(()=> const Upload()); new page
      case PageName.FAVORITE:
      case PageName.MYPAGE:
        _changePage(value);
        break;
    }
  }

  void _changePage(int value){
    pageIndex(value);
  }
}