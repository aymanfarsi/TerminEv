import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:terminev/utils/native_shells.dart';
import 'package:titlebar_buttons/titlebar_buttons.dart';

class WindowTitleBarProvider extends ChangeNotifier {
  Widget? leading;
  Widget? center;
  ThemeType? buttons;
  WindowTitleBarProvider() : super();

  void setLeading(Widget widget) {
    leading = widget;
    notifyListeners();
  }

  void setCenter(Widget widget) {
    center = widget;
    notifyListeners();
  }

  void setButtons(ThemeType widget) {
    buttons = widget;
    notifyListeners();
  }
}

final windowTitleBarProvider = ChangeNotifierProvider(
  (ref) {
    return WindowTitleBarProvider();
  },
);
