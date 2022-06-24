import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:smart_home/app/modules/home/bindings/home_binding.dart';
import 'package:smart_home/app/modules/home/views/home_view.dart';
import 'package:smart_home/utils/SHComman.dart';
import '../../../../utils/SHColors.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            commonSHCachedNetworkImage(
              'https://cdn.pixabay.com/photo/2015/11/04/10/38/hotel-1022297_960_720.jpg',
              fit: BoxFit.fill,
              height: Get.height,
              width: Get.width,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                width: Get.width,
                height: Get.height * 0.7,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Welcome\nBack',
                              style: boldTextStyle(color: Colors.black45, size: 25)),
                          Container(
                            height: 78,
                            width: 75,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: grey),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: commonSHCachedNetworkImage(
                                'https://i.dlpng.com/static/png/6981952_preview.png',
                                fit: BoxFit.cover,
                                height: 45,
                                width: 45),
                          )
                        ],
                      ),
                      16.height,
                      AppTextField(
                        textStyle: primaryTextStyle(color: Colors.black45),
                        cursorColor: white,
                        textFieldType: TextFieldType.EMAIL,
                        decoration: buildSHInputDecoration('Email',
                            textColor: Colors.grey),
                      ),
                      16.height,
                      AppTextField(
                        textStyle: primaryTextStyle(color: Colors.black45),
                        cursorColor: white,
                        textFieldType: TextFieldType.PASSWORD,
                        suffixIconColor: white,
                        suffix: const Icon(Icons.remove_red_eye_rounded,
                            color: Colors.black45),
                        decoration: buildSHInputDecoration('Password',
                            textColor: Colors.grey),
                      ),
                      16.height,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password?',
                                style: boldTextStyle(color: Colors.black45),
                                textAlign: TextAlign.end)
                            .onTap(
                          () {},
                        ),
                      ),
                      80.height,
                      button(
                        context: context,
                        textColor: white,
                        width: Get.width,
                        text: 'Sign In',
                        onTap: () {Get.off(()=>HomeView(),binding: HomeBinding());},
                      ),
                      32.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have account?',
                              style: primaryTextStyle(color: grey)),
                          4.width,
                          Text('Get Started',
                                  style: boldTextStyle(color: Colors.deepOrangeAccent, size: 16))
                              .onTap(
                            () {

                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
