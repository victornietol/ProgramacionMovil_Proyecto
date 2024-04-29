import 'package:flutter/material.dart';
import 'package:proyectofinal/navegador.dart';
import 'package:proyectofinal/vistas/iniciarSesion.dart';
import 'package:proyectofinal/vistas/pruebas.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Juego Persona',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const IniciarSesion(title: "Iniciar sesion"),
    );
  }
}