import 'package:flutter/material.dart';

class DefaultDrawer extends StatelessWidget {
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
        onTap: () => {/* TODO */},
      ),
      ListTile(
        title: const Text('Account'),
        onTap: () => {/* TODO */},
      ),
      ListTile(
        title: const Text('Log out'),
        onTap: () => {/* TODO */},
      ),
    ]));
  }
}
