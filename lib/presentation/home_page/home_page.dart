import 'dart:io';

import 'package:adb_helper/presentation/home_page/components/adb_status.dart';
import 'package:adb_helper/presentation/home_page/components/device_list.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _output = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("HomePage"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AdbStatus(),
              DeviceList(),
            ],
          ),
        ));
  }

  void _runProcess() async {
    // List all files in the current directory in UNIX-like systems.
    // var result = await Process.run('ls', ['-l']);

    var result = await Process.run(
      'adb',
      [],
      runInShell: true,
    );

    setState(() {
      _output.add(result.stdout);
    });
  }
}
