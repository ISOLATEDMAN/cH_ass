import 'package:ass_captianhub/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Sizer(builder: (context, Orientation, DeviceType){
      return const MaterialApp(
        home:Home()
    );});
  }
}