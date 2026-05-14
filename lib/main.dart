import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final savedDarkMode = prefs.getBool('isDarkMode') ?? false;
  runApp(MyApp(initialDarkMode: savedDarkMode, preferences: prefs));
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.initialDarkMode,
    required this.preferences,
  });

  final bool initialDarkMode;
  final SharedPreferences preferences;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final ValueNotifier<bool> _isDarkModeNotifier;

  @override
  void initState() {
    super.initState();
    _isDarkModeNotifier = ValueNotifier<bool>(widget.initialDarkMode);
  }

  @override
  void dispose() {
    _isDarkModeNotifier.dispose();
    super.dispose();
  }

  Future<void> _saveThemePreference(bool value) async {
    await widget.preferences.setBool('isDarkMode', value);
  }

  void _toggleTheme(bool value) {
    _isDarkModeNotifier.value = value;
    _saveThemePreference(value);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          title: 'Theme Demo',
          theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blueGrey,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: ThemePage(
            darkModeNotifier: _isDarkModeNotifier,
            onThemeChanged: _toggleTheme,
          ),
        );
      },
    );
  }
}

class ThemePage extends StatelessWidget {
  const ThemePage({
    super.key,
    required this.darkModeNotifier,
    required this.onThemeChanged,
  });

  final ValueNotifier<bool> darkModeNotifier;
  final ValueChanged<bool> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: darkModeNotifier,
      builder: (context, isDarkMode, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Light / Dark Theme ')),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isDarkMode ? Icons.nights_stay : Icons.wb_sunny,
                    size: 96,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    isDarkMode
                        ? 'Dark theme is active'
                        : 'Light theme is active',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'The selected theme is saved using shared_preferences and restored on startup.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  SwitchListTile(
                    value: isDarkMode,
                    onChanged: onThemeChanged,
                    title: const Text('Use dark theme'),
                    secondary: const Icon(Icons.brightness_6),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
