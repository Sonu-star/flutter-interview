import 'package:gbs/global_export.dart';
import 'package:gbs/login/model/login_model.dart';

class DashboardController extends GetxController {
  LoginModel loginModel = LoginModel();

  @override
  void onInit() async {
    loginModel =LoginModel.fromJson(Get.arguments);
    update();
    super.onInit();
  }
}
