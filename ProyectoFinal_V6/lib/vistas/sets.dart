import 'package:flutter/material.dart';
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
  late List _listaDocumentos = [];


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
    List listaCampos = [];
    await db.collection("usuarioprueba").get().then((documentos) {
        for(var doc in documentos.docs) {
          final docActual = doc.data();
          final usuario = docActual["usuario"];
          final contra = docActual["contrasenia"];
          listaCampos.add(
              [usuario,contra]
          );
        }
      }
    );
    setState(() {
      _listaDocumentos = listaCampos;
    });
    print(_listaDocumentos);


    /* //Asi se obtienen los elemntos de los distintos elementos por tuplas
    List<dynamic> aux = _listaDocumentos[0];
    print(aux[0]);
     */
  }

  @override
  void initState() {
    super.initState();
    _leerUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "Sets del usuario $_usuario"
            ),
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
                children: _mostrarSets(_listaDocumentos),
              ),
            )
          ],
        ),
      ),
    );
  }



  // para mostrar los sets guardados dinamicamente
  List<Widget> _mostrarSets(List lista) {
    // variable para llevar el conteo de los sets guardados
    List<Widget> listaWidgets = [];
    for (var set in lista) {
      listaWidgets.add(
        Container(
          width: 400,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(
              width: 1,
              color: Colors.black
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(set[0]),
              SizedBox(width: 10),
              Text(set[1]),
            ],
          ),
        )
      );
    }
    return listaWidgets;
  }



}