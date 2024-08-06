import 'package:flutter/material.dart';
import 'package:tap_code/src/screens/settings_view.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('TapCode'),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.restorablePushNamed(context, SettingsView.routeName);
          },
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
