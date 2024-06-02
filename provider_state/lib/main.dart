import 'package:flutter/material.dart';
import 'package:provider_state/Provider/count_provider.dart';

import 'package:provider/provider.dart';
import 'package:provider_state/Provider/darkTheme_provider.dart';
import 'package:provider_state/Provider/exampleOne_provider.dart';
import 'package:provider_state/Provider/favourite_provider.dart';
import 'package:provider_state/Screen/dark_theme.dart';
import 'package:provider_state/Screen/exampleOneScreen.dart';
import 'package:provider_state/Screen/favourite_screen.dart';
import 'package:provider_state/Screen/value_notify_listener.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CountProvider(),
          ),
          ChangeNotifierProvider(create: (_) => ExampleOne()),
          ChangeNotifierProvider(create: (_) => FovouriteItemProvider()),
          ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<DarkThemeProvider>(context);
          return MaterialApp(
            title: 'Provider State management',
            themeMode: themeChanger.themeMode,
            darkTheme: ThemeData(
                brightness: Brightness.dark, primaryColor: Colors.orange),
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.orange,
              primaryColor: Colors.purple,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: NotifyListenerScreen(),
          );
        }));
  }
}
