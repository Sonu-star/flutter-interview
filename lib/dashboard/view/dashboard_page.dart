import 'package:gbs/dashboard/controller/dashboard_controller.dart';
import 'package:gbs/global_export.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          init: controller,
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'TOKEN:- ${controller.loginModel.token}'
                    '\n\nUSER NAME:- ${controller.loginModel.user!.name} '
                    '\n\nUSER AGE:- ${controller.loginModel.user!.age} '
                    '\n\nEXPIRE DATE:- ${DateTime.fromMicrosecondsSinceEpoch(controller.loginModel.expiresIn!) }'),
              )
            ]);
          }),
    );
  }
}
