import 'package:flutter/material.dart';
import 'OHRouterDelegate.dart';
import 'OHRouteInformationParser.dart';
import 'package:provider/provider.dart';
import 'data/myAuth.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';
import 'cache/myPrefs.dart';
import 'view_models/AuthViewModel.dart';

void main() {
  configureApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late RouterDelegate<Object> delegate;
  late RouteInformationParser<Object> parser;
  late myAuth authRepository;

  @override
  void initState() {
    authRepository = myAuth(myPrefs());
    delegate = OHRouterDelegate(authRepository);
    parser = OHRouteInformationParser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(
          create: (_) => AuthViewModel(authRepository),
        ),
        //Add Poll Change Notifyier?
      ],
      child: MaterialApp.router(
        routeInformationParser: parser,
        routerDelegate: delegate,
      ),
    );
  }
}
