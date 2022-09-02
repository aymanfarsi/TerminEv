import 'package:flutter/material.dart';
import 'package:terminev/services/init_app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:terminev/views/terminal_split/terminal_split.dart';
import 'package:terminev/views/terminal_prefs/terminal_preferences.dart';
import 'package:terminev/views/terminal_full/terminal_full.dart';

Future<void> main() async {
  await initApp();
  runApp(
    const ProviderScope(
      child: TerminEv(),
    ),
  );
}

class TerminEv extends StatelessWidget {
  const TerminEv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TerminEv',
      initialRoute: '/',
      darkTheme: ThemeData.dark().copyWith(
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.transparent,
        buttonTheme: ButtonThemeData(
          hoverColor: Colors.grey.withOpacity(0.2),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      routes: {
        '/': (_) => const TerminalFull(),
        '/split': (_) => const TerminalSplit(),
        '/settings': (_) => const TerminalSettings(),
      },
    );
  }
}
