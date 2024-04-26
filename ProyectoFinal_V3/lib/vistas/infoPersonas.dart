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
            BotonInfo(
                texto: "Persona 1",
                rutaImagen: "pruebas/img1.jpg",
                accion: () {
                  print("Se presiono boton");
                }
            ),
            BotonInfo2(
                texto: "Persona 1",
                rutaImagen: "pruebas/img1.jpg",
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

// clase para boton con texto para cada persona
class BotonInfo extends StatefulWidget {
  const BotonInfo({super.key, required this.texto, required this.rutaImagen, required this.accion});
  final String texto, rutaImagen;
  final Function accion;

  @override
  State<BotonInfo> createState() => _BotonInfoState();
}

class _BotonInfoState extends State<BotonInfo> {

  @override
  Widget build(BuildContext context) {
    return Container( // contenedor para controlar dimensiones del boton
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          )
        ),
        onPressed: () => widget.accion(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox( // sirve para controlar las dimensiones de la imagen
              height: 40,
              width: 40,
              child: Image.asset(widget.rutaImagen),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(widget.texto)
          ],
        ),
      )
    );
  }
}



// clase para boton2 con texto para cada persona
class BotonInfo2 extends StatefulWidget {
  const BotonInfo2({super.key, required this.texto, required this.rutaImagen, required this.accion});
  final String texto, rutaImagen;
  final Function accion;

  @override
  State<BotonInfo2> createState() => _BotonInfo2State();
}

class _BotonInfo2State extends State<BotonInfo2> {

  @override
  Widget build(BuildContext context) {
    return Container( // contenedor para controlar dimensiones del boton
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              )
          ),
          onPressed: () => widget.accion(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox( // sirve para controlar las dimensiones de la imagen
                height: 40,
                width: 40,
                child: Image.asset(widget.rutaImagen),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(widget.texto)
            ],
          ),
        )
    );
  }
}