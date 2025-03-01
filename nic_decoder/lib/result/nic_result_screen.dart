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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("Your NIC Details"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset('lib/assets/arrow.png', width: 24, height: 24), // Use custom back button
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
            const SizedBox(height: 20),
            Icon(Icons.account_circle, size: 80, color: Theme.of(context).primaryColor),
            const SizedBox(height: 10),
            Obx(() => Text(
                  "Your NIC: ${nicController.nicNumber.value}",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 30),
            Obx(() => _nicDetailTile("Date of Birth Year", nicController.birthYear.value, context)),
            Obx(() => _nicDetailTile("Date of Birth Date", nicController.birthDate.value, context)),
            Obx(() => _nicDetailTile("Date of Birth Day", nicController.birthDay.value, context)),
            Obx(() => _nicDetailTile("Gender", nicController.gender.value, context)),
            Obx(() => _nicDetailTile("Age", nicController.age.value, context)),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Regenerate"),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _nicDetailTile(String title, String value, BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.info, color: Colors.white),
        ),
        title: Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
        subtitle: Text(value, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
