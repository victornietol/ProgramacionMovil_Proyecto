import 'package:flutter/material.dart';

class InfoPersonas extends StatefulWidget {
  const InfoPersonas({super.key, required this.title});
  final String title;

  @override
  State<InfoPersonas> createState() => _InfoPersonasState();
}

class _InfoPersonasState extends State<InfoPersonas> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "Pantalla de InfoPersonas"
            ),
          ],
        ),
      ),
    );
  }
}