//Import core
import 'package:flutter/material.dart';

class RegisterPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) {
          return const Center(
            child: Text('Register Page'),
          );
        });
  }
}
