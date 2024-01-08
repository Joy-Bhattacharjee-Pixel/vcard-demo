import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:vcard_qr_project/controllers/vcard.controller.dart';

class ViewCard extends StatefulWidget {
  const ViewCard({super.key});

  @override
  State<ViewCard> createState() => _ViewCardState();
}

class _ViewCardState extends State<ViewCard> {
  final controller = Get.put(VCardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("View VCard", style: TextStyle(fontSize: 18)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: const Column(children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D"),
                    ),
                    SizedBox(height: 15),
                    Text("Joy Bhattacherjee", style: TextStyle(fontSize: 15)),
                    SizedBox(height: 2),
                    Text("https://www.pixelconsultancy.in",
                        style: TextStyle(
                            color: Colors.indigo,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.indigo)),
                    SizedBox(height: 6),
                    Text("Software Developer at Pixel Consultancy",
                        style: TextStyle(fontSize: 14)),
                    SizedBox(height: 6),
                    Text("Contact: +918697604919",
                        style: TextStyle(fontSize: 14)),
                    SizedBox(height: 6),
                    Text('"Lorem Ipsum Notes Placed here"',
                        style: TextStyle(fontSize: 14)),
                  ])),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(Get.width, 45),
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {
                    Get.to(() => const ViewCard());
                  },
                  child: const Text("Confirm and Create",
                      style: TextStyle(color: Colors.white, fontSize: 14))),
            )
          ],
        ),
      ),
    );
  }
}
