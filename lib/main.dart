import 'package:flutter/material.dart';
import 'package:flutter_api_samples/examples.dart';

void main() {
  runApp(const ExampleListApp());
}

class ExampleListApp extends StatelessWidget {
  const ExampleListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExampleListScreen(),
    );
  }
}

class ExampleListScreen extends StatelessWidget {
  const ExampleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final examplePaths = exampleWidgets.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter API Examples'),
      ),
      body: ListView.builder(
        itemCount: examplePaths.length,
        itemBuilder: (context, index) {
          final path = examplePaths[index];
          return ListTile(
            title: Text(path),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExampleHostScreen(
                    examplePath: path,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ExampleHostScreen extends StatelessWidget {
  const ExampleHostScreen({super.key, required this.examplePath});

  final String examplePath;

  @override
  Widget build(BuildContext context) {
    final exampleApp = exampleWidgets[examplePath]!;
    Widget exampleContent;

    // The exampleApp is a MaterialApp, we extract its home.
    if (exampleApp is MaterialApp) {
      exampleContent = exampleApp.home ?? const Center(child: Text('Example has no home widget.'));
    } else {
      exampleContent = exampleApp;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(examplePath),
      ),
      body: exampleContent,
    );
  }
}