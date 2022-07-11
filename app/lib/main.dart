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

    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: _config!.initiatives.map((initiative) {
    //     return InitiativeWidget(initiative);
    //   }).toList(),
    // );

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(20.0),
        minScale: 0.1,
        maxScale: 1.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _config!.initiatives.map((initiative) {
            return InitiativeWidget(initiative);
          }).toList(),
        ),
      ),
    );
  }
}

class InitiativeWidget extends StatelessWidget {
  final Initiative initiative;
  const InitiativeWidget(this.initiative, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int releases =
        initiative.releases != null ? initiative.releases!.length : 1;

    List<Widget> children = [
      Text(initiative.title!, style: const TextStyle(fontSize: 16)),
    ];

    if (initiative.features != null) {
      children.addAll(
          initiative.features!.map((feature) => FeatureWidget(feature)));
    }

    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 200.0 * releases, // TODO take into account milestones
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class FeatureWidget extends StatelessWidget {
  final Feature feature;
  const FeatureWidget(this.feature, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(feature.title!, style: const TextStyle(fontSize: 16));
  }
}
