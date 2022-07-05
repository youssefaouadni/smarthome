import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UsersCart extends StatelessWidget {
  String name;
  String address;
  String mail;
  String role;
  UsersCart(
      {Key? key,
      required this.name,
      required this.address,
      required this.mail,
      required this.role})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150.h,
        width: Get.width * 0.5,
              decoration: BoxDecoration(
            color: Colors.orangeAccent.withOpacity(0.3), borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Name : '),
                    Text(name),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Mail : '),
                    Text(mail),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Adress : '),
                    Text(address),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Role : '),
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
