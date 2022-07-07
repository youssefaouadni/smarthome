import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeCart extends StatelessWidget {
  String verHard;
  String verSoft;
  String dateFab;
  String dateOeuvre;
  String zones;
  String label;
  String location;
  HomeCart(
      {Key? key,
      required this.verHard,
      required this.dateFab,
      required this.zones,
      required this.dateOeuvre,
      required this.label,
      required this.location,
      required this.verSoft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250.h,
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
                  children: [
                    Text('Version Hard : '),
                    Text(verHard),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Version Soft : '),
                    Text(verSoft),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Date Fabrication : '),
                    Text(dateFab),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Date doueverture : '),
                    Text(dateOeuvre),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Zones : '),
                    Text(zones),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Label : '),
                    Text(label),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Location : '),
                    Text(location),
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
