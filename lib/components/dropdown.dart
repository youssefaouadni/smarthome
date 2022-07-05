import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoleDropDown extends StatefulWidget {
  List<String> role;
  String dropdownValue;
  RoleDropDown({Key? key,required this.role,required this.dropdownValue}) : super(key: key);

  @override
  State<RoleDropDown> createState() => _RoleDropDownState();
}

class _RoleDropDownState extends State<RoleDropDown> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: Get.width,
        child: DropdownButton<String>(
          value: widget.dropdownValue,
          icon: const Padding(
            padding: EdgeInsets.only(left: 300.0),
            child: Icon(Icons.arrow_downward),
          ),
          elevation: 16,
          style: const TextStyle(color: Colors.black45),
          underline: Container(
            height: 2,
            color: Colors.deepOrangeAccent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              widget.dropdownValue = newValue!;

            });
          },
          items: widget.role
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
