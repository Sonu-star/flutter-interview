import 'package:gbs/global_export.dart';
import 'package:gbs/login/controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          init: controller,
          builder: (contrller) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80),
                    Container(
                      alignment: Alignment.center,
                      width: Get.width,
                      child: Text.rich(TextSpan(children: [
                        const TextSpan(
                            text: 'Company ID: ',
                            style: TextStyle(
                                color: black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: controller.companyId.toUpperCase(),
                            style: const TextStyle(
                                color: primary,
                                fontSize: 18,
                                fontWeight: FontWeight.w500))
                      ])),
                    ),
                    SizedBox(
                        width: Get.width,
                        height: 200,
                        child: Image.asset('assets/images/login.png')),
                    const SizedBox(height: 60),
                    CustomTextField(
                        controller: controller.userNameController,
                        hint: 'Username'),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: controller.passwordController,
                      hint: 'Password',
                      isPassword: true,
                    ),
                    const Text(
                      'Forget Password?',
                      style: TextStyle(
                          color: black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                        buttonName: 'Login',
                        onPressed: () {
                          controller.login();
                        }),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
