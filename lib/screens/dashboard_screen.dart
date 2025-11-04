import 'package:flutter/material.dart';

class ComebackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Start to Dashboard'),
          onPressed: () => Navigator.pushReplacementNamed(context, '/dashboard'),
        ),
      ),
    );
  }
}