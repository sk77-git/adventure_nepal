import 'package:flutter/material.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangePasswordView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ChangePasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
