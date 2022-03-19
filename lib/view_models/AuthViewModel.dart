import 'package:flutter/material.dart';
import 'package:onehive_v1/data/myAuth.dart';

class AuthViewModel extends ChangeNotifier {
  final myAuth authRepository;

  bool loggingIn = false;
  bool loggingOut = false;

  AuthViewModel(this.authRepository);
  
}
