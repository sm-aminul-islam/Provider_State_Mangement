import 'package:flutter/material.dart';
import 'package:provider_state/Provider/count_provider.dart';

import 'package:provider/provider.dart';
import 'package:provider_state/Provider/exampleOne_provider.dart';
import 'package:provider_state/Screen/exampleOneScreen.dart';

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
        ],
        child: MaterialApp(
          title: 'Provider State management',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: ExampleOneProvider(),
        ));
  }
}
