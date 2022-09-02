import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:terminev/providers/terminal_provider.dart';
import 'package:terminev/views/common/tab_widget.dart';

class TabsBar extends HookConsumerWidget {
  const TabsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final terminals = ref.watch(terminalProvider);
    int index = 1;
    if (terminals.terminals.length < 2) return Container();
    return Container(
      padding: const EdgeInsets.all(7.0),
      width: appWindow.size.width,
      height: 45,
      color: const Color(0xff292d32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.abc_rounded,
          ),
          const Gap(10),
          ...terminals.terminals.entries.map(
            (term) => TabWidget(
              title: 'Terminal ${index++}',
              focusNode: term.key,
            ),
          ),
        ],
      ),
    );
  }
}
