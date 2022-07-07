import 'package:get/get.dart';

import '../modules/add_devices/bindings/add_devices_binding.dart';
import '../modules/add_devices/views/add_devices_view.dart';
import '../modules/add_home/bindings/add_home_binding.dart';
import '../modules/add_home/views/add_home_view.dart';
import '../modules/add_pairings/bindings/add_pairings_binding.dart';
import '../modules/add_pairings/views/add_pairings_view.dart';
import '../modules/add_user/bindings/add_user_binding.dart';
import '../modules/add_user/views/add_user_view.dart';
import '../modules/add_zones/bindings/add_zones_binding.dart';
import '../modules/add_zones/views/add_zones_view.dart';
import '../modules/app_drawer/bindings/app_drawer_binding.dart';
import '../modules/app_drawer/views/app_drawer_view.dart';
import '../modules/delete_user/bindings/delete_user_binding.dart';
import '../modules/delete_user/views/delete_user_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/list_devices/bindings/list_devices_binding.dart';
import '../modules/list_devices/views/list_devices_view.dart';
import '../modules/list_homes/bindings/list_homes_binding.dart';
import '../modules/list_homes/views/list_homes_view.dart';
import '../modules/list_pairings/bindings/list_pairings_binding.dart';
import '../modules/list_pairings/views/list_pairings_view.dart';
import '../modules/list_zones/bindings/list_zones_binding.dart';
import '../modules/list_zones/views/list_zones_view.dart';
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
    GetPage(
      name: _Paths.ADD_HOME,
      page: () => const AddHomeView(),
      binding: AddHomeBinding(),
    ),
    GetPage(
      name: _Paths.LIST_HOMES,
      page: () => const ListHomesView(),
      binding: ListHomesBinding(),
    ),
    GetPage(
      name: _Paths.LIST_DEVICES,
      page: () => const ListDevicesView(),
      binding: ListDevicesBinding(),
    ),
    GetPage(
      name: _Paths.ADD_DEVICES,
      page: () => const AddDevicesView(),
      binding: AddDevicesBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ZONES,
      page: () => const AddZonesView(),
      binding: AddZonesBinding(),
    ),
    GetPage(
      name: _Paths.LIST_ZONES,
      page: () => const ListZonesView(),
      binding: ListZonesBinding(),
    ),
  ];
}
