import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class NICResultScreen extends StatelessWidget {
  final NicController nicController = Get.put(NicController());

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> nicData = Get.arguments ?? {};
    String nic = nicData['nic'] ?? '';

    // Decode NIC when this screen is opened
    nicController.decodeNIC(nic);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Your NIC Details"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset('lib/assets/arrow.png', width: 34, height: 34), // Custom back button
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Image.asset('lib/assets/flag.png', width: 120, height: 120), // Add flag image
            const SizedBox(height: 10),
            Obx(() => Text(
                  "Your NIC: ${nicController.nicNumber.value}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const SizedBox(height: 20),
            Obx(() => _nicDetailTile("Date of Birth Year", nicController.birthYear.value)),
            Obx(() => _nicDetailTile("Date of Birth Date", nicController.birthDate.value)),
            Obx(() => _nicDetailTile("Date of Birth Day", nicController.birthDay.value)),
            Obx(() => _nicDetailTile("Gender", nicController.gender.value)),
            Obx(() => _nicDetailTile("Age", nicController.age.value)),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                "Regenerate",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _nicDetailTile(String title, String value) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.info, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}
