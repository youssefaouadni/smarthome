import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:smart_home/app/modules/app_drawer/views/app_drawer_view.dart';

import '../../../../utils/SHComman.dart';
import '../controllers/add_pairings_controller.dart';

class AddPairingsView extends GetView<AddPairingsController> {
  const AddPairingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawerView(),
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Smart Home"),
      ),
      body: Column(
        children: [
          Obx(()=>Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: Get.width,
              child: DropdownButton<String>(
                value: controller.dropDownValue.value,
                icon:  Padding(
                  padding: EdgeInsets.only(left: 300.0.w),
                  child: Icon(Icons.arrow_downward),
                ),
                elevation: 16,
                style: const TextStyle(color: Colors.black45),
                underline: Container(
                  height: 2,
                  color: Colors.deepOrangeAccent,
                ),
                onChanged: (String? newValue) {
                  controller.dropDownValue.value = newValue!;
                  if(controller.dropDownValue.value=="Installer"){
                    controller.installer=true;
                    controller.owner=false;
                  }
                  else  {
                    controller.installer=false;
                    controller.owner=true;
                  }
                  print( controller.installer.toString());
                },
                items: controller.role
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          )),
          const SizedBox(height: 20,),
          button(
            context: context,
            textColor: white,
            width: Get.width,
            text: 'Add Pairing',
            onTap: () async {
              controller.addPairing();
            },
          ),
          32.height,
        ],
        ),

    );
  }
}
