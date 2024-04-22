import 'package:flutter/material.dart';

class Sets extends StatefulWidget {
  const Sets({super.key, required this.title});
  final String title;

  @override
  State<Sets> createState() => _SetsState();
}

class _SetsState extends State<Sets> {

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
                "Pantalla de Sets"
            ),
          ],
        ),
      ),
    );
  }
}