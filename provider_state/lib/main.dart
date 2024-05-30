import 'package:flutter/material.dart';
import 'package:provider_state/Provider/count_provider.dart';
import 'package:provider_state/Screen/count_example.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CountProvider(),
        child: MaterialApp(
          title: 'Provider State management',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: CountExample(),
        ));
  }
}
