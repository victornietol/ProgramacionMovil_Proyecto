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
  String _textoIntro = "";
  String _textoCombinaciones = "";
  String _textoPersonas = "";
  String _textoWishlist = "";
  String _textoCalendario = "";
  String _textoGuias = "";
  
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
    String leerIntro = await rootBundle.loadString("assets/inicio/sinopsis.txt");
    String leerComb = await rootBundle.loadString("assets/inicio/combinaciones.txt");
    String leerGuias = await rootBundle.loadString("assets/inicio/guias.txt");
    String leerPersonas = await rootBundle.loadString("assets/inicio/personas.txt");
    String leerWishlist = await rootBundle.loadString("assets/inicio/wishlist.txt");
    String leerCal = await rootBundle.loadString("assets/inicio/calendario.txt");
    setState(() {
      _textoIntro = leerIntro;
      _textoCombinaciones = leerComb;
      _textoGuias = leerGuias;
      _textoPersonas = leerPersonas;
      _textoWishlist = leerWishlist;
      _textoCalendario = leerCal;
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
      body: Container(  // imagen para el fondo de la vista
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pruebas/fondoApp1.png"),
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Center(  // contenido de la vista
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
                          "Información de la app",
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
                      child: Image.asset("assets/inicio/fotoInicio.png"),
                    ),
                    // contenedor contenido despues de la cabecera
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[

                          const SizedBox(
                            height: 25,
                          ),
                          Container(  // descripcion del apartado
                              padding: const EdgeInsets.only(top: 20, bottom: 20),
                              child: DefaultTextStyle(
                                style: Theme.of(context).textTheme.bodyText1!,
                                child: Text(
                                  _textoIntro,
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
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(Icons.account_tree_rounded),
                                    const SizedBox(width: 20),
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
                                  ],
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
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(Icons.contact_mail_rounded),
                                    const SizedBox(width: 20),
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
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child:  DefaultTextStyle(
                                    style: Theme.of(context).textTheme.bodyText1!,
                                    child: Text(
                                      _textoPersonas,
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
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const  Icon(Icons.accessibility_new_outlined),
                                    const SizedBox(width: 20),
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
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child:  DefaultTextStyle(
                                    style: Theme.of(context).textTheme.bodyText1!,
                                    child: Text(
                                      _textoWishlist,
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
                            //padding: const EdgeInsets.all(20),
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(Icons.calendar_month_outlined),
                                    const SizedBox(width: 20),
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
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child:  DefaultTextStyle(
                                    style: Theme.of(context).textTheme.bodyText1!,
                                    child: Text(
                                      _textoCalendario,
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
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(Icons.quiz_outlined),
                                    const SizedBox(width: 20),
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
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child:  DefaultTextStyle(
                                    style: Theme.of(context).textTheme.bodyText1!,
                                    child: Text(
                                      _textoGuias,
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
            ],
          ),
        ),
      ),

    );
  }
}