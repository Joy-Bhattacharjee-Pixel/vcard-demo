import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vcard_qr_project/controllers/vcard.controller.dart';
import 'package:vcard_qr_project/main.dart';
import 'package:vcard_qr_project/presentations/view.card.dart';

class GenerateVCard extends StatefulWidget {
  const GenerateVCard({super.key});

  @override
  State<GenerateVCard> createState() => _GenerateVCardState();
}

class _GenerateVCardState extends State<GenerateVCard> {
  final controller = Get.put(VCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("VCard Generation",
            style: TextStyle(color: Colors.white, fontSize: 17)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CommonTextField(
                hint: "First Name", controller: controller.firstnamecontroller),
            const SizedBox(height: 10),
            CommonTextField(
                hint: "Middle Name",
                controller: controller.middlenamecontroller),
            const SizedBox(height: 10),
            CommonTextField(
                hint: "Last Name", controller: controller.lastnamecontroller),
            const SizedBox(height: 10),
            CommonTextField(
                hint: "Organization",
                controller: controller.organizationcontroller),
            const SizedBox(height: 10),
            CommonTextField(
                hint: "Phone Number", controller: controller.phonecontroller),
            const SizedBox(height: 10),
            CommonTextField(
                hint: "Job Title", controller: controller.jobtitlecontroller),
            const SizedBox(height: 10),
            CommonTextField(
                hint: "Profile Url",
                controller: controller.profileurlcontroller),
            const SizedBox(height: 10),
            CommonTextField(
                hint: "Note", controller: controller.notescontroller),
            const SizedBox(height: 10),
            Obx(() => OutlinedButton(
                style: OutlinedButton.styleFrom(
                    fixedSize: Size(Get.width, 45),
                    side: const BorderSide(color: Colors.indigo, width: 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {
                  selectimagedialog;
                },
                child: Text(
                    controller.selectedimage.value.path.isNotEmpty
                        ? "Change Image"
                        : "Upload Image",
                    style:
                        const TextStyle(color: Colors.indigo, fontSize: 14)))),
            const SizedBox(height: 10),
            Obx(() => controller.selectedimage.value.path.isNotEmpty
                ? CircleAvatar(
                    radius: 52,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          FileImage(controller.selectedimage.value),
                    ),
                  )
                : const SizedBox()),
            const SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(Get.width, 45),
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {
                  Get.to(() => const ViewCard());
                },
                child: const Text("View Card",
                    style: TextStyle(color: Colors.white, fontSize: 14)))
          ],
        ),
      ),
    );
  }

  dynamic get selectimagedialog async {
    return Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      title: const Text("Select Image Location",
          textAlign: TextAlign.center, style: TextStyle(fontSize: 15)),
      content: const Text(
          "Please choose from where you want to select image from below options",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: Colors.black45)),
      actions: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      fixedSize: Size(Get.width, 40),
                      side: const BorderSide(color: Colors.indigo, width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {
                    controller.selectimagefromgallery;
                  },
                  child: const Text("Gallery",
                      style: TextStyle(color: Colors.indigo, fontSize: 14))),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      fixedSize: Size(Get.width, 40),
                      side: const BorderSide(color: Colors.indigo, width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {
                    controller.selectimagefromcamera;
                  },
                  child: const Text("Camera",
                      style: TextStyle(color: Colors.indigo, fontSize: 14))),
            ),
          ],
        )
      ],
    ));
  }
}
