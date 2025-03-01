import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/nic_input_screen.dart';
import 'result/nic_result_screen.dart'; // Import NICResultScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NIC Decoder',
      theme: ThemeData.light(),
      home: NICInputScreen(),
      getPages: [
        GetPage(name: '/', page: () => NICInputScreen()), // Default route
        GetPage(name: '/result', page: () => NICResultScreen()), // Register the /result route
      ],
    );
  }
}
