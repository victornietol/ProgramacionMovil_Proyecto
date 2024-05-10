import 'package:flutter/material.dart';
import 'package:proyectofinal/vistas/finalesJuego.dart';
import 'package:proyectofinal/vistas/libros.dart';
import 'package:proyectofinal/vistas/pruebas.dart';
import 'package:proyectofinal/vistas/respuestasExamenes.dart';
import 'package:proyectofinal/vistas/socialLinks.dart';

class Trivias extends StatefulWidget {
  const Trivias({super.key, required this.title});
  final String title;

  @override
  State<Trivias> createState() => _TriviasState();
}

class _TriviasState extends State<Trivias> {

  @override
  Widget build(BuildContext context) {
    final tamanioPantallaAlto = MediaQuery.of(context).size.height;
    final tamanioPantallaAncho = MediaQuery.of(context).size.width;
    final maxPorcentaje = 1;
    final maxAlturaWidget = tamanioPantallaAlto * 0.80;
    final maxAnchoWidget = tamanioPantallaAncho * maxPorcentaje;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(  // boton 1
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const FinalesJuego();
                        }
                    );
                  },
                  child: Container(
                    height: maxAlturaWidget/2,
                    width: maxAnchoWidget/2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/imagenesGuias/Boton-finales.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    child: const Center(
                      child: Text(
                        "Finales del Juego",
                        style: TextStyle(
                          color: Colors.white, // color del texto
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(  // boton 2
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const RespuestasExamenes();
                        }
                    );
                  },
                  child: Container(
                    height: maxAlturaWidget/2,
                    width: maxAnchoWidget/2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/imagenesGuias/Boton-Examenes.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Examenes y Clases",
                              style: TextStyle(
                                color: Colors.white, // color del texto
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Respuestas",
                              style: TextStyle(
                                color: Colors.white, // color del texto
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(  // boton 3
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const SocialLinks();
                        }
                    );
                  },
                  child: Container(
                    height: maxAlturaWidget/2,
                    width: maxAnchoWidget/2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/imagenesGuias/Boton-vinculos.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    child: const Center(
                      child: Text(
                        "Social Links",
                        style: TextStyle(
                          color: Colors.white, // color del texto
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(  // boton 4
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const Libros();
                        }
                    );
                  },
                  child: Container(
                    height: maxAlturaWidget/2,
                    width: maxAnchoWidget/2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/imagenesGuias/BotonLibros.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    child: const Center(
                      child: Text(
                        "Libros",
                        style: TextStyle(
                          color: Colors.white, // color del texto
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}