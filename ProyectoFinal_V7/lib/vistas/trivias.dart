import 'package:flutter/material.dart';
import 'package:proyectofinal/vistas/pruebas.dart';

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
                          return Pruebas(
                              title: "Nuevo Usuario"
                          );
                        }
                    );
                  },
                  child: Container(
                    height: maxAlturaWidget/2,
                    width: maxAnchoWidget/2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/pruebas/img1.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    child: const Center(
                      child: Text(
                        "Boton 1",
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
                          return Pruebas(
                              title: "Nuevo Usuario"
                          );
                        }
                    );
                  },
                  child: Container(
                    height: maxAlturaWidget/2,
                    width: maxAnchoWidget/2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/pruebas/img2.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    child: const Center(
                      child: Text(
                        "Boton 2",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(  // boton 3
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Pruebas(
                              title: "Nuevo Usuario"
                          );
                        }
                    );
                  },
                  child: Container(
                    height: maxAlturaWidget/2,
                    width: maxAnchoWidget/2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/pruebas/img3.jpeg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    child: const Center(
                      child: Text(
                        "Boton 3",
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
                          return Pruebas(
                              title: "Nuevo Usuario"
                          );
                        }
                    );
                  },
                  child: Container(
                    height: maxAlturaWidget/2,
                    width: maxAnchoWidget/2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/pruebas/img4.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    child: const Center(
                      child: Text(
                        "Boton 4",
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