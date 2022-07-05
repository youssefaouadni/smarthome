import 'package:get/get.dart';

import '../modules/add_pairings/bindings/add_pairings_binding.dart';
import '../modules/add_pairings/views/add_pairings_view.dart';
import '../modules/add_user/bindings/add_user_binding.dart';
import '../modules/add_user/views/add_user_view.dart';
import '../modules/app_drawer/bindings/app_drawer_binding.dart';
import '../modules/app_drawer/views/app_drawer_view.dart';
import '../modules/delete_user/bindings/delete_user_binding.dart';
import '../modules/delete_user/views/delete_user_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/list_pairings/bindings/list_pairings_binding.dart';
import '../modules/list_pairings/views/list_pairings_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.APP_DRAWER,
      page: () => const AppDrawerView(),
      binding: AppDrawerBinding(),
    ),
    GetPage(
      name: _Paths.ADD_USER,
      page: () => const AddUserView(),
      binding: AddUserBinding(),
    ),
    GetPage(
      name: _Paths.DELETE_USER,
      page: () => const DeleteUserView(),
      binding: DeleteUserBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PAIRINGS,
      page: () => const AddPairingsView(),
      binding: AddPairingsBinding(),
    ),
    GetPage(
      name: _Paths.LIST_PAIRINGS,
      page: () => const ListPairingsView(),
      binding: ListPairingsBinding(),
    ),
  ];
}
