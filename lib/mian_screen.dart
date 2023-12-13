import 'dart:async';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String btnTitle = "Adv 시작";
  bool isAdv = false;
  late Timer serviceTimer;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       body: Column (
         children: [
           ElevatedButton(onPressed: (){
             if (isAdv) {
               btnTitle = "Adv 시작";
               setState(() {

               });
             } else {
               btnTitle = "Adv 종료";
             }
           }, child: Text(btnTitle)),
         ],
       ),
      ),
    );
  }
}
