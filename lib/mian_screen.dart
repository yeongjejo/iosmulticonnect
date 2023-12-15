import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';

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
               FlutterBlePeripheral().stop();
               isAdv = false;
               btnTitle = "Adv 시작";
               setState(() {

               });
             } else {
               isAdv = true;

               startAdvertising();
               btnTitle = "Adv 종료";
               setState(() {

               });
             }
           }, child: Text(btnTitle)),
         ],
       ),
      ),
    );
  }


  startAdvertising() {

    final AdvertiseData advertiseData = AdvertiseData(
      serviceUuid: '00003559-0000-1000-8000-00805F9B34FA',
      localName: "test",
    );

    final AdvertiseSetParameters advertiseSetParameters =
    AdvertiseSetParameters(
      connectable: true,
      scannable: true,
    );

    final AdvertiseSettings advertiseSettings = AdvertiseSettings(
      advertiseMode: AdvertiseMode.advertiseModeLowLatency,
      txPowerLevel: AdvertiseTxPower.advertiseTxPowerMedium,
      connectable: true,
      timeout: 50000,
    );

    FlutterBlePeripheral().start(
      advertiseData: advertiseData,
      advertiseSetParameters: advertiseSetParameters,
      advertiseSettings: advertiseSettings
    );
  }



}
