import 'package:gbs/company/controller/company_controller.dart';
import 'package:gbs/company/view/comapny_page.dart';
import 'package:gbs/dashboard/controller/dashboard_controller.dart';
import 'package:gbs/dashboard/view/dashboard_page.dart';
import 'package:gbs/global_export.dart';
import 'package:gbs/login/controller/login_controller.dart';
import 'package:gbs/login/view/login_page.dart';


class AppRoutes {
  static const String company = '/company';
  static const String login = '/login';

  static const String dashboard = '/dashboard';

  static List<GetPage> appRoutes = [
    GetPage(
        name: company,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => CompanyController());
        }),
        page: () => const CompanyPage()),
    GetPage(
        name: login,
        binding: BindingsBuilder(() {
          Get.lazyPut(() => LoginController());
        }),
        page: () => const LoginPage()),
    GetPage(
      name: dashboard,
      binding: BindingsBuilder(() {
        Get.lazyPut(() => DashboardController());
      }),
      page: () => DashboardPage(),
    ),
  ];
}
