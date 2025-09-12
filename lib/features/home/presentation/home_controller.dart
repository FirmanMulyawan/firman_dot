import 'package:get/get.dart';

import '../../../component/config/app_route.dart';

class HomeController extends GetxController {
  HomeController();

  @override
  void onInit() {
    super.onInit();
  }

  void toAddExpense() async {
    final isAddExpense = await Get.toNamed(AppRoute.addExpense);
    // if (isAvatar != null) {
    //   isAvatarChoose = isAvatar;
    //   profileImageType = "avatar";
    //   update();
    //   validate();
    // }
  }
}
