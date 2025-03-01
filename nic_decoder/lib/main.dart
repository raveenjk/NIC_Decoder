import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/nic_input_screen.dart';
import 'result/nic_result_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => NICInputScreen()),
        GetPage(name: '/result', page: () => NICResultScreen()),
      ],
    );
  }
}
