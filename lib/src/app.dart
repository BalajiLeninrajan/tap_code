import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:tap_code/src/controllers/gemini_controller.dart';
import 'package:tap_code/src/controllers/settings/settings_controller.dart';
import 'package:tap_code/src/controllers/stt_controller.dart';
import 'package:tap_code/src/controllers/vibration_controller.dart';

import 'package:tap_code/src/screens/home.dart';
import 'package:tap_code/src/screens/settings_view.dart';

/// The Widget that configures your application.
class TapCode extends StatelessWidget {
  const TapCode({
    super.key,
    required this.settingsController,
    required this.sttController,
    required this.geminiController,
    required this.vibrationController,
  });

  final SettingsController settingsController;
  final SttController sttController;
  final GeminiController geminiController;
  final VibrationController vibrationController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return DynamicColorBuilder(builder:
            (ColorScheme? lightColorScheme, ColorScheme? dartColorScheme) {
          return MaterialApp(
            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            restorationScopeId: 'app',

            // Provide the generated AppLocalizations to the MaterialApp. This
            // allows descendant Widgets to display the correct translations
            // depending on the user's locale.
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],

            // Use AppLocalizations to configure the correct application title
            // depending on the user's locale.
            //
            // The appTitle is defined in .arb files found in the localization
            // directory.
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            theme: ThemeData(
              colorScheme: lightColorScheme,
            ),
            darkTheme: ThemeData(
              colorScheme: dartColorScheme ?? const ColorScheme.dark(),
            ),
            themeMode: settingsController.themeMode,

            // Define a function to handle named routes in order to support
            // Flutter web url navigation and deep linking.
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SettingsView.routeName:
                      return SettingsView(controller: settingsController);
                    case HomeView.routeName:
                    default:
                      return HomeView(
                        sttController: sttController,
                        geminiController: geminiController,
                        vibrationController: vibrationController,
                        settingsController: settingsController,
                      );
                  }
                },
              );
            },
          );
        });
      },
    );
  }
}
