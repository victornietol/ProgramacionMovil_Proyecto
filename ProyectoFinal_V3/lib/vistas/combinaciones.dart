import 'package:flutter/material.dart';

class Combinaciones extends StatefulWidget {
  const Combinaciones({super.key, required this.title});
  final String title;

  @override
  State<Combinaciones> createState() => _CombinacionesState();
}

class _CombinacionesState extends State<Combinaciones> {

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
                "Pantalla de Combinaciones"
            ),
          ],
        ),
      ),
    );
  }
}