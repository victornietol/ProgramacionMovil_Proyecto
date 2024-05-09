import  'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectofinal/vistas/pruebas.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;

class Inicio extends StatefulWidget {
  const Inicio({super.key, required this.title});
  final String title;


  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final db = FirebaseFirestore.instance;
  String _textoCombinaciones = "";
  
  // variable para guardar el usuario logueado
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  
  // funcion para guardar el usuario logueado
  Future<void> _guardarUsuario(String usuario) async {
    final SharedPreferences prefs = await _prefs;
    if(prefs != Null) {
      prefs.setString("usuario", usuario);
    }
  }

  // funcion para abrir archivos de texto
  Future<void> _leerTexto() async {
    String leerText = await rootBundle.loadString("assets/texto/texto1.txt");
    setState(() {
      _textoCombinaciones = leerText;
    });
  }

  @override
  void initState() {
    super.initState();
    _leerTexto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: ListView(
                  children: <Widget>[
                    const SizedBox(
                      height: 35,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Texto de esta vista",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      child: Image.asset("assets/pruebas/img1.jpg"),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(  // descripcion del apartado
                      padding: const EdgeInsets.all(20),
                      child: DefaultTextStyle(
                        style: Theme.of(context).textTheme.bodyText1!,
                        child: Text(
                          _textoCombinaciones,
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ),
                    Container(  // lineas de separacion
                      height: 2,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                      ),
                    ),

                    Container(  // caja para la descripcion de la vista
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            DefaultTextStyle(
                              style: Theme.of(context).textTheme.bodyText1!,
                              child: const Text(
                                "Combinaciones",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              child:  DefaultTextStyle(
                                style: Theme.of(context).textTheme.bodyText1!,
                                child: Text(
                                  _textoCombinaciones,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            )
                          ],
                        ),
                    ),

                    Container(  // lineas de separacion
                      height: 2,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                      ),
                    ),

                    Container(  // caja para la descripcion de la vista
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          DefaultTextStyle(
                            style: Theme.of(context).textTheme.bodyText1!,
                            child: const Text(
                              "Personas",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            child:  DefaultTextStyle(
                              style: Theme.of(context).textTheme.bodyText1!,
                              child: Text(
                                _textoCombinaciones,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(  // lineas de separacion
                      height: 2,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                      ),
                    ),

                    Container(  // caja para la descripcion de la vista
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          DefaultTextStyle(
                            style: Theme.of(context).textTheme.bodyText1!,
                            child: const Text(
                              "Wishlist",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            child:  DefaultTextStyle(
                              style: Theme.of(context).textTheme.bodyText1!,
                              child: Text(
                                _textoCombinaciones,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(  // lineas de separacion
                      height: 2,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                      ),
                    ),

                    Container(  // caja para la descripcion de la vista
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          DefaultTextStyle(
                            style: Theme.of(context).textTheme.bodyText1!,
                            child: const Text(
                              "Calendario",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            child:  DefaultTextStyle(
                              style: Theme.of(context).textTheme.bodyText1!,
                              child: Text(
                                _textoCombinaciones,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(  // lineas de separacion
                      height: 2,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                      ),
                    ),

                    Container(  // caja para la descripcion de la vista
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          DefaultTextStyle(
                            style: Theme.of(context).textTheme.bodyText1!,
                            child: const Text(
                              "Guías",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            child:  DefaultTextStyle(
                              style: Theme.of(context).textTheme.bodyText1!,
                              child: Text(
                                _textoCombinaciones,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}