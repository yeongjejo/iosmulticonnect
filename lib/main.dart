import 'package:flutter/material.dart';

import 'loding_screen.dart';
import 'mian_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,


    initialRoute: '/',
    routes: {
      '/main' : (BuildContext context) => MainScreen(),
      '/' : (BuildContext context) => const LoadingScreen(),
    },
  ));
}