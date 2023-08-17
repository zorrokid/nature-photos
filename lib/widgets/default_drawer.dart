import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/bindings/view_account_binding.dart';
import 'package:nature_photos/screens/view_account_screen.dart';

import '../controllers/logout_controller.dart';
import '../screens/add_photo_screen.dart';

class DefaultDrawer extends StatelessWidget {
  DefaultDrawer({super.key});

  final _logOutController = Get.put(LogOutController());

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
        onTap: () => Get.to(() => const AddPhotoScreen()),
      ),
      ListTile(
        title: const Text('Account'),
        onTap: () =>
            Get.to(() => ViewAccountScreen(), binding: ViewAccountBinding()),
      ),
      ListTile(
        title: const Text('Log out'),
        onTap: () => _logOutController.logOut(),
      ),
    ]));
  }
}
