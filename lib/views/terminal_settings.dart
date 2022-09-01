import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:terminev/states/state_vars.dart';

class TerminalSettings extends StatelessWidget {
  const TerminalSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Terminal'),
            tiles: <SettingsTile>[
              SettingsTile(
                title: const Text('Font Size'),
                enabled: true,
                trailing: IconButton(
                  onPressed: () {
                    fontSizeObs.value = fontSizeObs.value + 5;
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
