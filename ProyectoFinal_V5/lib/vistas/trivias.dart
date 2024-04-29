import 'package:flutter/material.dart';

class Trivias extends StatefulWidget {
  const Trivias({super.key, required this.title});
  final String title;

  @override
  State<Trivias> createState() => _TriviasState();
}

class _TriviasState extends State<Trivias> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "Pantalla de Trivias"
            ),
          ],
        ),
      ),
    );
  }
}