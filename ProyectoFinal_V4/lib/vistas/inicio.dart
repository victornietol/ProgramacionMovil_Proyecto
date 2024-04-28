import  'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectofinal/vistas/pruebas.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key, required this.title});
  final String title;


  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final db = FirebaseFirestore.instance;
  String _usuario = "";
  String _contrasenia = "";
  TextEditingController _textUsuario = TextEditingController();
  TextEditingController _textContrasenia = TextEditingController();
  
  // variable para guardar el usuario logueado
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // variable para mensaje de error
  String _msjError = "";
  
  // leer datos de la BD
  void _leerUsuario() async {
    await db.collection("usuarioprueba").doc("inicio").get().then((documento) {
      setState(() {
        _usuario = documento.get("usuario");
        _contrasenia = documento.get("contrasenia");
      });
    });
  }

  // verificar inicio de sesion
  void _iniciarSesion() async {
    String usuarioLeer = _textUsuario.text;
    String contraLeer = _textContrasenia.text;
    try {
      await db.collection("usuarioprueba").doc(usuarioLeer).get().then((documento) {
        setState(() {
          _usuario = documento.get("usuario");
          _contrasenia = documento.get("contrasenia");

          //mensaje error
          _msjError = "";
        });
      });

      // Si el usuario si existe y la contraseña es correcta, inicio correcto
      if (contraLeer == _contrasenia && contraLeer != "") {
        print("Acceso concedido");
        _guardarUsuario(_usuario);
        setState(() {
          _msjError = "";
        });
      } else {
        setState(() {
          _msjError = "Contraseña incorrecta";
        });
      }

    } catch (e) {

      /*
      // Cuadro de dialogo aparte
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("El usuario no existe"),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    color: Theme.of(context).colorScheme.inversePrimary,
                    child: const Text("Aceptar"),
                  )
                ],
              ),
            );
          }
      );
      */

      setState(() {
        _msjError = "El usuario no existe";
      });
    }
  }
  
  // funcion para guardar el usuario logueado
  Future<void> _guardarUsuario(String usuario) async {
    final SharedPreferences prefs = await _prefs;
    if(prefs != Null) {
      prefs.setString("usuario", usuario);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(   // contenedor de lectura de datos
              width: 190,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                      "Seccion lectura datos"
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Usuario: $_usuario"
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Contrasenia: $_contrasenia"
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: _leerUsuario,
                      child: const Text(
                          "Obtener información"
                      )
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    onPressed: _leerUsuario,
                    child: const Text(
                        "Obtener información"
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(
              width: 10,
            ),

            Container(
              width: 190,
              child: Column(  // Contenedor de inicio sesion
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                      "Seccion verificar datos"
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _textUsuario,
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Usuario"
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _textContrasenia,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Contraseña"
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    onPressed: () {
                      _iniciarSesion();
                    },
                    child: const Text(
                      "Verificar datos"
                    ),
                  ),


                  // Mensaje de error debajo de el boton
                  const SizedBox(height: 20),
                  Text(
                    "$_msjError",
                    style: TextStyle(
                        color: Colors.red
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Pruebas(
                    title: "Nuevo Usuario"
                );
              }
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}