import 'dart:convert';
import 'package:gbs/global_export.dart';
import 'package:gbs/login/model/login_model.dart';

class LoginController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final NetUtil _networkUtil = NetUtil();
  String companyId = '';
  String ipAddress = '';

  @override
  void onInit() async {
    companyId = Get.arguments['id'];
    ipAddress = Get.arguments['ipAddress'];
    update();
    super.onInit();
  }

  login() async {
    if (userNameController.text == '') {
      errorToast('User name field empty?');
    } else if (passwordController.text == '') {
      errorToast('Password field empty?');
    } else {
      var body = jsonEncode({
            "username": userNameController.text,
            "password": passwordController.text
          });
      var response = await _networkUtil.post(
          url: "${ipAddress}login",
          isTokenAvailable: false,
          body: body);

      if (response != Null) {
        // LoginModel loginModel = LoginModel.fromJson(response);
        Get.toNamed(AppRoutes.dashboard, arguments: response);
      }
    }
  }
}
