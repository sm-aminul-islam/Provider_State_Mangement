import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/Provider/exampleOne_provider.dart';

class ExampleOneProvider extends StatefulWidget {
  const ExampleOneProvider({super.key});

  @override
  State<ExampleOneProvider> createState() => _ExampleOneProviderState();
}

class _ExampleOneProviderState extends State<ExampleOneProvider> {
  double value = 1.0;
  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      appBar: AppBar(
        title: Text("ExampleOne"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOne>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.setvalue(val);
                });
          }),
          Row(
            children: [
              Consumer<ExampleOne>(builder: (context, value, child) {
                return Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value)),
                    height: 100,
                    child: Center(child: Text("container 1")),
                  ),
                );
              }),
              Consumer<ExampleOne>(builder: (context, value, child) {
                return Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value)),
                    height: 100,
                    child: Center(child: Text("container 2")),
                  ),
                );
              }),
            ],
          )
        ],
      ),
    );
  }
}
