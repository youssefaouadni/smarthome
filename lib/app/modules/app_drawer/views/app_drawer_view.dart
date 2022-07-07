import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_home/app/modules/add_devices/bindings/add_devices_binding.dart';
import 'package:smart_home/app/modules/add_devices/views/add_devices_view.dart';
import 'package:smart_home/app/modules/add_home/bindings/add_home_binding.dart';
import 'package:smart_home/app/modules/add_home/views/add_home_view.dart';
import 'package:smart_home/app/modules/add_pairings/bindings/add_pairings_binding.dart';
import 'package:smart_home/app/modules/add_pairings/views/add_pairings_view.dart';
import 'package:smart_home/app/modules/add_user/bindings/add_user_binding.dart';
import 'package:smart_home/app/modules/add_user/views/add_user_view.dart';
import 'package:smart_home/app/modules/add_zones/bindings/add_zones_binding.dart';
import 'package:smart_home/app/modules/add_zones/views/add_zones_view.dart';
import 'package:smart_home/app/modules/delete_user/bindings/delete_user_binding.dart';
import 'package:smart_home/app/modules/delete_user/views/delete_user_view.dart';
import 'package:smart_home/app/modules/home/bindings/home_binding.dart';
import 'package:smart_home/app/modules/home/views/home_view.dart';
import 'package:smart_home/app/modules/list_devices/bindings/list_devices_binding.dart';
import 'package:smart_home/app/modules/list_devices/views/list_devices_view.dart';
import 'package:smart_home/app/modules/list_homes/bindings/list_homes_binding.dart';
import 'package:smart_home/app/modules/list_homes/views/list_homes_view.dart';
import 'package:smart_home/app/modules/list_pairings/bindings/list_pairings_binding.dart';
import 'package:smart_home/app/modules/list_pairings/views/list_pairings_view.dart';
import 'package:smart_home/app/modules/list_zones/bindings/list_zones_binding.dart';
import 'package:smart_home/app/modules/list_zones/views/list_zones_view.dart';

import '../controllers/app_drawer_controller.dart';

class AppDrawerView extends GetView<AppDrawerController> {
  const AppDrawerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children:  [
            Container(
              height: 50,
                width: Get.width*0.7,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(15)
            ),
                child: const Center(child: Text('Admin',style: TextStyle(color: Colors.white),))),
             ListTile(
              title:const Text('Home'),
              leading: const Icon(Icons.home),
              onTap: (){
                Get.off(()=>HomeView(),binding: HomeBinding());
              },
            ),
             ListTile(
              title:const Text('Add user'),
              leading: const Icon(Icons.add),
              onTap: (){
                Get.off(()=>const AddUserView(),binding: AddUserBinding());
              },
            ),

             ListTile(
              title:const Text('Delete user'),
               leading: const Icon(Icons.delete_rounded),
              onTap: (){
                Get.off(()=>const DeleteUserView(),binding: DeleteUserBinding());
              },
            ),
            ListTile(
              title:const Text('List Pairings'),
              leading: const Icon(Icons.list),
              onTap: (){
                Get.off(()=>const ListPairingsView(),binding: ListPairingsBinding());
              },
            ),
            ListTile(
              title:const Text('Add Pairings'),
              leading: const Icon(Icons.add_box_rounded),
              onTap: (){
                Get.off(()=>const AddPairingsView(),binding: AddPairingsBinding());
              },
            ),
            ListTile(
              title:const Text('Add Home'),
              leading: const Icon(Icons.add_box_rounded),
              onTap: (){
                Get.off(()=>const AddHomeView(),binding: AddHomeBinding());
              },
            ),
            ListTile(
              title:const Text('List Homes'),
              leading: const Icon(Icons.list),
              onTap: (){
                Get.off(()=>const ListHomesView(),binding: ListHomesBinding());
              },
            ),
            ListTile(
              title:const Text('Add Device'),
              leading: const Icon(Icons.devices),
              onTap: (){
                Get.off(()=>const AddDevicesView(),binding: AddDevicesBinding());
              },
            ),
            ListTile(
              title:const Text('List Devices'),
              leading: const Icon(Icons.list),
              onTap: (){
                Get.off(()=>const ListDevicesView(),binding: ListDevicesBinding());
              },
            ),
            ListTile(
              title:const Text('Add Zone'),
              leading: const Icon(Icons.place_sharp),
              onTap: (){
                Get.off(()=>const AddZonesView(),binding: AddZonesBinding());
              },
            ),
            ListTile(
              title:const Text('List Zone'),
              leading: const Icon(Icons.list),
              onTap: (){
                Get.off(()=>const ListZonesView(),binding: ListZonesBinding());
              },
            ),
          ],
        ),
      ),
    );
  }
}
