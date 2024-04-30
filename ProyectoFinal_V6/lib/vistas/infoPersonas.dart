import 'package:flutter/material.dart';
import 'package:proyectofinal/customWidgets/botonesPack.dart';
import 'package:proyectofinal/customWidgets/cuadrosDialogos.dart';

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

                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CuadroDialogo1(
                            nombreItem: "Persona 1",
                            contenido: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 200,
                                    child: Image.network("https://upload.wikimedia.org/wikipedia/commons/5/52/Spider-Man.jpg"),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      "Informacion del personaje para rellenar espacio"
                                  ),
                                  Container(
                                    height: 200,
                                    child: Image.network("https://upload.wikimedia.org/wikipedia/commons/5/52/Spider-Man.jpg"),
                                  ),
                                  Container(
                                    height: 200,
                                    child: Image.network("https://upload.wikimedia.org/wikipedia/commons/5/52/Spider-Man.jpg"),
                                  ),
                                  Container(
                                    height: 200,
                                    child: Image.network("https://upload.wikimedia.org/wikipedia/commons/5/52/Spider-Man.jpg"),
                                  ),
                                  Container(
                                    height: 200,
                                    child: Image.network("https://upload.wikimedia.org/wikipedia/commons/5/52/Spider-Man.jpg"),
                                  ),
                                  Container(
                                    height: 200,
                                    child: Image.network("https://upload.wikimedia.org/wikipedia/commons/5/52/Spider-Man.jpg"),
                                  ),
                                ],
                              ),
                            )
                        );
                      }
                  );

                  /*
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Container(
                            height: 800,
                            width: 400,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Informacion Persona 1",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 700,
                                  width: 390,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.black
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                          "Texto que describe a esta Persona..."
                                              "error"
                                      ),

                                    ],
                                  )
                                )
                              ],
                            ),
                          ),
                        );
                      }
                  );
                   */

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