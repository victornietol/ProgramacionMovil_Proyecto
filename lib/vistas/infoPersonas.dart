import 'package:flutter/material.dart';
import 'package:proyectofinal/customWidgets/botonesPack.dart';
import 'package:proyectofinal/customWidgets/cuadrosDialogos.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:proyectofinal/vistas/pruebas.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoPersonas extends StatefulWidget {
  const InfoPersonas({super.key, required this.title});
  final String title;

  @override
  State<InfoPersonas> createState() => _InfoPersonasState();
}

class _InfoPersonasState extends State<InfoPersonas> {
  List<String> listaPersonas = [];


  // abrir el archivo separado por comas para obtener las personas
  Future<void> _leerTexto() async {
    String leerText = await rootBundle.loadString("assets/texto/personas.txt");
    List<String> lista = leerText.split(",");
    setState(() {
      listaPersonas = lista;
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
      body: listaPersonas.isEmpty
          ? const Center(child: CircularProgressIndicator()) // si hay no se cargan se muestra indicador de carga
          : BotonesPersonas(  // si ya se cargo la informacion
        personas: listaPersonas,
      ),
    );
  }
}