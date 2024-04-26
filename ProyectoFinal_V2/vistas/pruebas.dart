import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
            Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                      _cargarDatos();
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                        "Enviar datos"
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}