import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class VCardController extends GetxController {
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController middlenamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController organizationcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController jobtitlecontroller = TextEditingController();
  TextEditingController profileurlcontroller = TextEditingController();
  TextEditingController notescontroller = TextEditingController();

  ImagePicker picker = ImagePicker();

  Rx<File> selectedimage = File("").obs;

  void get selectimagefromgallery async {
    Get.back();
    final xfile = await picker.pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      selectedimage.value = File(xfile.path);
    }
  }

  void get selectimagefromcamera async {
    Get.back();
    final xfile = await picker.pickImage(source: ImageSource.camera);
    if (xfile != null) {
      selectedimage.value = File(xfile.path);
    }
  }

  void get createvcard async {}
}
