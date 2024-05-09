import 'package:flutter/material.dart';
import 'package:proyectofinal/customWidgets/botonesPack.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Sets extends StatefulWidget {
  const Sets({super.key, required this.title});
  final String title;

  @override
  State<Sets> createState() => _SetsState();
}

class _SetsState extends State<Sets> {
  // variable del usuario registrado
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _usuario = "";

  // variables para la BD
  final db = FirebaseFirestore.instance;
  late List<String> _listaDocumentos = [];


  // funcion para leer el usuario logueado en vista Inicio
  Future<void> _leerUsuario() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs != Null) {
      setState(() {
        _usuario = (prefs.getString("usuario") ?? ""); // si es nulo se obtiene el usuario, sino se pone ""
      });
    }
  }

  // leer la informacion de los distintos docuemntos de la BD
  Future<void> _leerDocumentos() async {
    List<String> listaCampos = [];
    try {
      await db.collection(_usuario).get().then((documentos) {
        for(var doc in documentos.docs) {
          final docActual = doc.data();
          final item = docActual["item"];
          listaCampos.add(item);
        }
      }
      );
      setState(() {
        _listaDocumentos = listaCampos;
      });
    } catch (e) {
      print("No existe el usuario");
    }



    /* //Asi se obtienen los elemntos de los distintos elementos por tuplas
    List<dynamic> aux = _listaDocumentos[0];
    print(aux[0]);
     */
  }

  @override
  void initState() {
    super.initState();
    _leerUsuario().then((_) {  // se ejecuta _leerDocumento hasta que termine _leerUsuario
      _leerDocumentos();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        /*
      _listaDocumentos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : BotonesPersonas(
              personas: _listaDocumentos
            ),

         */





      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 80,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if(_usuario != "")   // si hay usuario logueado se muestra el widget
                    const Text(
                        "Estos son tus elementos guardados ",
                    ),
                  if(_usuario != "")   // si hay usuario logueado se muestra el widget
                    Text(
                      _usuario,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              )
            ),
            if(_usuario != "" && _listaDocumentos.isEmpty == false)
              Expanded(
                child: _listaDocumentos.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : BotonesPersonasWishlist(
                    personas: _listaDocumentos
                ),
              ),
            if(_usuario == "")
              const Text(
                  "Inicia sesión para guardar items",
                  style: TextStyle(
                  fontSize: 18,
                ),
              ),
            if(_usuario != "" && _listaDocumentos.isEmpty == true)
              const Text(
              "Aún no tienes items guardados",
              style: TextStyle(
              fontSize: 18,
              ),
              )

            /*
            MaterialButton(
                onPressed: _leerDocumentos,
                color: Theme.of(context).colorScheme.inversePrimary,
                child: const Text("Leer datos DB"),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 450,
              //height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 1,
                  color: Colors.black
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("hoal")],
                //_mostrarSets(_listaDocumentos),
              ),
            )

             */

          ],
        ),
      ),


    );
  }
}