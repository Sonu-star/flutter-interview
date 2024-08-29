import 'package:gbs/company/model/company_model.dart';
import 'package:gbs/global_export.dart';

class CompanyController extends GetxController {
  TextEditingController companyIdController = TextEditingController();
  CompanyModel companyModel = CompanyModel();

  final NetUtil _networkUtil = NetUtil();

  verifyCompany() async {
    if (companyIdController.text == '') {
      errorToast('Company ID field Empty?');
    } else {
      var response = await _networkUtil.get(
        url: "${Endpoints.comapny}${companyIdController.text}",
        isTokenAvailable: false,
      );
      if (response != null) {
        companyModel = CompanyModel.fromJson(response);
        Get.toNamed(AppRoutes.login, arguments: {
          "ipAddress": companyModel.ipAddress,
          "id": companyModel.code
        });
        companyIdController.clear();
      }
    }
  }
}
