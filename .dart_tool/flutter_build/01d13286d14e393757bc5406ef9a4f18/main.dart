// @dart=2.17

import 'dart:ui' as ui;

import 'package:onehive_v1/main.dart' as entrypoint;

Future<void> main() async {
  await ui.webOnlyInitializePlatform();
  entrypoint.main();
}
