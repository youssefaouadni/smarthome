import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_home/app/modules/add_user/bindings/add_user_binding.dart';
import 'package:smart_home/app/modules/add_user/views/add_user_view.dart';
import 'package:smart_home/app/modules/delete_user/bindings/delete_user_binding.dart';
import 'package:smart_home/app/modules/delete_user/views/delete_user_view.dart';
import 'package:smart_home/app/modules/home/bindings/home_binding.dart';
import 'package:smart_home/app/modules/home/views/home_view.dart';

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
          ],
        ),
      ),
    );
  }
}
