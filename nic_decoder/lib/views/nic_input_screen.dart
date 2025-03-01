import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class NICInputScreen extends StatelessWidget {
  final NicController nicController = Get.put(NicController());
  final TextEditingController nicInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("N I C    D e c o d e r"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        backgroundColor: Colors.purple,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            
            // Add Sri Lanka Emblem at the top
            Image.asset('lib/assets/sri_lanka_emblem.png', width: 180, height: 180),
            
            const SizedBox(height: 20),
            const Text(
              "Enter Your NIC Number",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nicInputController,
              decoration: InputDecoration(
                hintText: "Enter NIC (e.g. 2000xxxx1796)",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String nic = nicInputController.text.trim();
                if (nic.isNotEmpty) {
                  Get.toNamed('/result', arguments: {'nic': nic});
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                "Decode",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
