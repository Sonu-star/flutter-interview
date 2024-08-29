import 'package:gbs/company/controller/company_controller.dart';
import 'package:gbs/global_export.dart';

class CompanyPage extends GetView<CompanyController> {
  const CompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder(
            init: controller,
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 100),
                      SizedBox(
                          width: Get.width,
                          height: 250,
                          child: Image.asset('assets/images/logo.png')),
                      Container(
                        alignment: Alignment.center,
                        width: Get.width,
                        child: const Text(
                          'Company ID',
                          style: TextStyle(
                              fontSize: 24,
                              color: black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                          controller: controller.companyIdController,
                          hint: 'Compnay ID'),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          buttonName: 'Submit',
                          onPressed: () =>
                            controller.verifyCompany()
                          ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'To obtain the Company ID ',
                            style: TextStyle(
                                fontSize: 14,
                                color: black,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: 'Contact Us',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                color: black,
                                fontWeight: FontWeight.bold))
                      ]))
                    ],
                  ),
                ),
              );
            }));
  }
}
