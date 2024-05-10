import 'package:flutter/material.dart';
import 'package:proyectofinal/customWidgets/botonesPack.dart';
import 'package:proyectofinal/customWidgets/cuadrosDialogos.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:proyectofinal/vistas/pruebas.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Libros extends StatefulWidget {
  const Libros({super.key});

  @override
  State<Libros> createState() => _LibrosState();
}

class _LibrosState extends State<Libros> {
  List<String> listaLibros = [];


  // abrir el archivo separado por comas para obtener las personas
  Future<void> _leerTexto() async {
    String leerText = await rootBundle.loadString("assets/libros/libros.txt");
    List<String> lista = leerText.split(",");
    setState(() {
      listaLibros = lista;
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
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.amberAccent,
        title: const Text("Libros"),
      ),
      body: listaLibros.isEmpty
          ? const Center(child: CircularProgressIndicator()) // si hay no se cargan se muestra indicador de carga
          : BotonesLibros(  // si ya se cargo la informacion
        personas: listaLibros,
      ),
    );
  }
}