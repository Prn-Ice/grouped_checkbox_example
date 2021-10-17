import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:grouped_checkbox_example/grouped_checkbox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '2 Broke Girls'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Fruits', style: textTheme.headline1),
            GroupedCheckbox(
              values: const ['Apples', 'Oranges', 'Mangoes', 'Guavas'],
              onChanged: (values) {
                log('$values');
              },
            ),
            const SizedBox(height: 20),
            Text('Movies', style: textTheme.headline1),
            GroupedCheckbox(
              values: const ['Avengers', 'Battleship', 'DOA', 'Real Steel'],
              onChanged: (values) {
                log('$values');
              },
            )
          ],
        ),
      ),
    );
  }
}
