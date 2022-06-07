import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          ListTile(
            leading: Image(
              image: NetworkImage(
                'url',
              ),
              height: 50,
              width: 50,
            ),
            title: Text(
              'User name ',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Email: mw41532@gamail.com \n Phone: 0540814455',
            ),
          ),
        ],
      ),
    );
  }
}
