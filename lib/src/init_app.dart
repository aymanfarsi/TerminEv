import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/widgets.dart';
import 'package:terminev/src/settings.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await readSettings();

  doWhenWindowReady(() {
    const initialSize = Size(700, 500);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}
