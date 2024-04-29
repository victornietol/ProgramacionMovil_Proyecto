import 'package:flutter/material.dart';
import 'package:proyectofinal/customWidgets/botonesPack.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
                "Pantalla de InfoPersonas"
            ),
            const SizedBox(
              height: 20,
            ),
            BotonInfoContorno(
                texto: "Persona 1",
                rutaImagen: "pruebas/img1.jpg",
                accion: () {
                  print("Se presiono boton");
                }
            ),
            BotonInfoElevated(
                texto: "Persona 1",
                rutaImagen: "https://upload.wikimedia.org/wikipedia/commons/5/52/Spider-Man.jpg",
                accion: () {
                  print("Se presiono boton");
                }
            ),
          ],
        ),
      ),
    );
  }
}