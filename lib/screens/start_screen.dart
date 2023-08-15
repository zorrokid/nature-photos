import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_photo_screen.dart';
import '../widgets/default_drawer.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Nature photos'),
      ),
      drawer: DefaultDrawer(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Wellcome to nature photos!',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddPhotoScreen()),
        tooltip: 'Add photo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
