import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'alert_component.dart';

class DeleteUsersCart extends StatelessWidget {
  String name;
  String address;
  String mail;
  String role;
  List list;
  int index;
  DeleteUsersCart(
      {Key? key,
      required this.name,
      required this.address,
      required this.mail,
      required this.role,
      required this.list,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150.h,
        width: Get.width * 0.5,
        decoration: BoxDecoration(
            color: Colors.orangeAccent.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text('Name : '),
                        Text(name),
                      ],
                    ),
                    InkWell(
                      child: const Icon(
                        Icons.delete_rounded,
                        color: Colors.red,
                      ),
                      onTap: () {
                        list.removeAt(index);
                        AlertComponent alertComponent = AlertComponent(
                            errorMessage: "User deleted successfully",
                            title: "Delete User");
                        alertComponent.showMyDialog();
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('Mail : '),
                    Text(mail),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('Adress : '),
                    Text(address),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text('Role : '),
                    Text(role),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
