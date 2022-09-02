import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:terminev/providers/window_titlebar_provider.dart';
import 'package:titlebar_buttons/titlebar_buttons.dart';

class WindowTitleBar extends HookConsumerWidget implements PreferredSizeWidget {
  const WindowTitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final windowTitleBar = ref.watch(windowTitleBarProvider);
    return Container(
      width: appWindow.size.width,
      height: 50,
      padding: const EdgeInsets.only(
        left: 9.0,
        right: 9.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onPanUpdate: (_) => appWindow.startDragging(),
              child: windowTitleBar.leading ?? Container(),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onPanUpdate: (_) => appWindow.startDragging(),
              child: windowTitleBar.center ?? Container(),
            ),
          ),
          // TODO settings for titlebar button
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              children: [
                DecoratedMinimizeButton(
                  type: windowTitleBar.buttons,
                  onPressed: () {
                    appWindow.minimize();
                  },
                ),
                DecoratedMaximizeButton(
                  type: windowTitleBar.buttons,
                  onPressed: () {
                    appWindow.maximize();
                  },
                ),
                DecoratedCloseButton(
                  type: windowTitleBar.buttons,
                  onPressed: () {
                    appWindow.close();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => appWindow.size;
}
