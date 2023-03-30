import 'package:get/get.dart';

enum PageName { HOME, FAVORITE, MYPAGE }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch(page){
      case PageName.HOME:
        //Get.to(()=> const Upload()); new page
      case PageName.FAVORITE:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value,{bool hasGesture = true}){
    pageIndex(value);
    if(!hasGesture) return;
    if(bottomHistory.contains(value)) {
      bottomHistory.remove(value);
    }
    bottomHistory.add(value);
    print(bottomHistory);
  }

  Future<bool> willPopAction() async {
    if(bottomHistory.length == 1){
      print('exit');
      return true;
    }else{
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      print(bottomHistory);
      return false;
    }
  }
}