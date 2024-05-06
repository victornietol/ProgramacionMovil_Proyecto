import 'package:flutter/material.dart';
import 'package:proyectofinal/navegador.dart';
import 'package:proyectofinal/vistas/calendario.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      locale: const Locale('es', 'MX'),
      home: const IniciarSesion(title: "Iniciar sesion"),
      //const Navegador(vistaInicio: 2,)
     // const Pruebas(title: "prbas")
    );
  }
}