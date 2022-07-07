import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';

import 'package:rolling_releases/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rolling Releases',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(body: DashboardWidget()),
    );
  }
}

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  Config? _config;

  void _load() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'json',
      ],
      withData: true,
    );

    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      log(utf8.decode(fileBytes));
      Map<String, dynamic> configMap = jsonDecode(utf8.decode(fileBytes));
      setState(() {
        _config = Config.fromJson(configMap);
      });
      log(jsonEncode(_config));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_config == null) {
      return Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 24)),
          onPressed: _load,
          child: const Text('Load'),
        ),
      );
    }

    return Center(
      child: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(20.0),
        minScale: 0.1,
        maxScale: 1.6,
        child: const Text('Dashboard', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
