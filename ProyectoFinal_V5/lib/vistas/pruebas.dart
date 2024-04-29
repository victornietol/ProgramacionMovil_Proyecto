import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectofinal/navegador.dart';
import 'package:proyectofinal/vistas/iniciarSesion.dart';


class Pruebas extends StatefulWidget {
  const Pruebas({super.key, required this.title});
  final String title;

  @override
  State<Pruebas> createState() => _PruebasState();
}

class _PruebasState extends State<Pruebas> {
  final db = FirebaseFirestore.instance;
  TextEditingController _textUsuario = TextEditingController();
  TextEditingController _textContrasenia = TextEditingController();
  String _msjError = "";

  // cargar los datos a la BD
  Future<void> _cargarDatos() async {
    String usuarioCarga = _textUsuario.text;
    String contraCarga = _textContrasenia.text;

    Map<String, dynamic> datos = {
      // campo:valor
      "usuario":usuarioCarga,
      "contrasenia":contraCarga,
    };
    // caga del documento
    await db.collection("usuarioprueba").doc(usuarioCarga).set(datos);

    // resetear los campos
    _textContrasenia.text = "";
    _textUsuario.text = "";
  }

  // validaciones de contrasenia y usuario con formato valido
  bool _validarFormato(String texto) {
    if ( (texto.contains(" ") == true) || (texto == "") ) { // no es valido
      return false;
    } else {  // es valido
      return true;
    }
  }

  // widget de cuadro de dialogo cuando se inicia sesion
  Widget _cuadroDialogoExito(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Usuario creado con exito"),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Navegador()),
              );
              //Navigator.of(context).pop();
            },
            color: Theme.of(context).colorScheme.inversePrimary,
            child: const Text("Aceptar"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                      "Crear nuevo usuario",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                      height: 20
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
                      if (_validarFormato(_textUsuario.text) && _validarFormato(_textContrasenia.text)) {

                        showDialog( // Cuadro de dialogo nuevo usuario exitoso
                            context: context,
                            builder: (BuildContext context) {
                              return _cuadroDialogoExito(context);
                            }
                        );



                        //_cargarDatos();
                      } else if (!_validarFormato(_textContrasenia.text)) {
                        setState(() {
                          _msjError = "Error: La contraseña no puede tener espacios en blanco";
                        });
                      } else if (!_validarFormato(_textUsuario.text)) {
                        setState(() {
                          _msjError = "Error: El usuario no puede tener espacios en blanco";
                        });
                      }
                      //_cargarDatos();
                      //Navigator.of(context).pop();
                    },
                    child: const Text(
                        "Crear usuario"
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _msjError,
                    style: const TextStyle(
                        color: Colors.red
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const IniciarSesion(title: "Iniciar Sesión"))
          );
        },
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
        child: const Icon(
            Icons.keyboard_backspace_outlined,
            size: 40,
            //color: Colors.white
        ),
      ),
    );
  }
}