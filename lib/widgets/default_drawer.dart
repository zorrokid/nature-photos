import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/bindings/add_photo_binding.dart';
import 'package:nature_photos/bindings/view_account_binding.dart';
import 'package:nature_photos/controllers/app_controller.dart';
import 'package:nature_photos/screens/view_account_screen.dart';

import '../screens/add_photo_screen.dart';

class DefaultDrawer extends GetView<AppController> {
  const DefaultDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blue),
        child: Text('Nature photos'),
      ),
      ListTile(
        title: const Text('Add photo'),
        onTap: () => Get.to(
          () => const AddPhotoScreen(),
          binding: AddPhotoBinding(),
        ),
      ),
      ListTile(
        title: const Text('Account'),
        onTap: () =>
            Get.to(() => ViewAccountScreen(), binding: ViewAccountBinding()),
      ),
    ]));
  }
}
