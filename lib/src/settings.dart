import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terminev/states/state_vars.dart';

Future<void> readSettings() async {
  final prefs = await SharedPreferences.getInstance();

  fontSizeObs = RxDouble(prefs.getDouble('font_size') ?? 11);

  prefs.getString('default_shell') != null
      ? defaultShellObs = RxString(prefs.getString('default_shell')!)
      : null;

  prefs.getString('default_working_directory') != null
      ? defaultWorkingDirectoryObs =
          RxString(prefs.getString('default_working_directory')!)
      : null;
}

Future<void> writeFontSize(double value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('font_size', value);
}

Future<void> writeDefaultShell(String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('font_size', value);
}

Future<void> writeDefaultWorkingDirectory(String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('font_size', value);
}
