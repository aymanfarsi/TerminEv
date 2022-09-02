import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:terminev/providers/terminal_provider.dart';

class TabWidget extends HookConsumerWidget {
  final String title;
  final FocusNode focusNode;
  const TabWidget({
    Key? key,
    required this.title,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final terminals = ref.watch(terminalProvider);
    return Container(
      width: 150.0,
      height: 100.0,
      color: const Color(0xff292d32),
      alignment: Alignment.center,
      transformAlignment: Alignment.center,
      child: Container(
        color: const Color(0xff292d32),
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: const Color(0xff292d32),
            borderRadius: BorderRadius.circular(25),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff11151a),
                Color(0xff41454a),
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xff41454a),
                offset: Offset(14.9, 14.9),
                blurRadius: 30,
                spreadRadius: 0.0,
              ),
              BoxShadow(
                color: Color(0xff11151a),
                offset: Offset(-14.9, -14.9),
                blurRadius: 30,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    title,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  terminals.removeTerminal(focusNode);
                },
                icon: const Icon(
                  Icons.close,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
