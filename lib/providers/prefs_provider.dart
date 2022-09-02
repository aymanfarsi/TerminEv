import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:terminev/utils/native_shells.dart';

class PreferencesProvider extends ChangeNotifier {
  double fontSize;
  String? defaultShell;
  String? defaultWorkingDirectory;
  PreferencesProvider({
    required this.fontSize,
    this.defaultShell,
    this.defaultWorkingDirectory,
  }) : super() {
    defaultShell = defaultShell ?? getNativeShells().last;
  }

  void setFontSize(double newFontSize) {
    if (newFontSize < 9 || newFontSize > 50) return;
    fontSize = newFontSize;
    notifyListeners();
  }

  void setDefaultShell(String shell) {
    defaultShell = shell;
    notifyListeners();
  }

  void setDefaultWorkingDirectory(String dir) {
    defaultWorkingDirectory = dir;
    notifyListeners();
  }
}

final preferencesProvider = ChangeNotifierProvider(
  (ref) {
    return PreferencesProvider(fontSize: 12);
  },
);
