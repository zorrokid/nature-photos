import 'package:flutter/material.dart';

class AddPhotoScreen extends StatelessWidget {
  const AddPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Photo'),
      ),
      body: const Center(
        child: Text('Add Photo'),
      ),
    );
  }
}
