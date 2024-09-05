import 'package:flutter/material.dart';

class SettingesPage extends StatefulWidget {
  const SettingesPage({super.key});

  @override
  State<SettingesPage> createState() => _SettingesPageState();
}

class _SettingesPageState extends State<SettingesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Settinges Page',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}
