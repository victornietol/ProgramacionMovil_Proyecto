import 'package:flutter/material.dart';
import 'package:proyectofinal/customWidgets/botonesPack.dart';
import 'package:proyectofinal/customWidgets/cuadrosDialogos.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:proyectofinal/vistas/pruebas.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SocialLinks extends StatefulWidget {
  const SocialLinks({super.key});

  @override
  State<SocialLinks> createState() => _SocialLinksState();
}

class _SocialLinksState extends State<SocialLinks> {
  List<String> listaPersonajes = [];


  // abrir el archivo separado por comas para obtener las personas
  Future<void> _leerTexto() async {
    String leerText = await rootBundle.loadString("assets/social-Links/social-Links.txt");
    List<String> lista = leerText.split(",");
    setState(() {
      listaPersonajes = lista;
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
        title: const Text("Social Links"),
      ),
      body: listaPersonajes.isEmpty
          ? const Center(child: CircularProgressIndicator()) // si hay no se cargan se muestra indicador de carga
          : BotonesSocialLinks(  // si ya se cargo la informacion
        personas: listaPersonajes,
      ),
    );
  }
}