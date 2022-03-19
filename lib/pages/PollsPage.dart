//Import core
import 'package:flutter/material.dart';

class ExplorePage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) {
          return const Center(
            child: Text('Explore Polls Page'),
          );
        });
  }
}
