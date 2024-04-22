import 'package:flutter/material.dart';
import 'package:proyectofinal/vistas/calendario.dart';
import 'package:proyectofinal/vistas/combinaciones.dart';
import 'package:proyectofinal/vistas/infoPersonas.dart';
import 'package:proyectofinal/vistas/inicio.dart';
import 'package:proyectofinal/vistas/sets.dart';

class Navegador extends StatefulWidget{
  const Navegador({super.key});

  @override
  State<Navegador> createState() => _NavegadorState();
}

class _NavegadorState extends State<Navegador>{
  int _indice = 0; // indice para controlar la vista a mostrar
  final _vistas = []; // arreglo para introducir las vistas

  // Actualizar el estado de la vista actual
  void _vistaActual(int i) {
    setState(() {
      _indice = i;
    });
  }

  // Agregar vistas al cuerpo
  @override
  void initState(){
    super.initState();
    _vistas.add(
      const Inicio(
          title: "Vista de inicio"
      )
    );
    _vistas.add(
        const Combinaciones(
            title: "Vista de Combinaciones"
        )
    );
    _vistas.add(
        const InfoPersonas(
            title: "Vista de Info Personas"
        )
    );
    _vistas.add(
        const Sets(
            title: "Vista de Sets"
        )
    );
    _vistas.add(
        const Calendario(
            title: "Vista de Calendario"
        )
    );
  }

  // Botones de las vistas
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _vistas[_indice],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _indice,
        onTap: (value) {
          setState(() {
            _indice = value; // la vista se cambia al valor del boton que se toque
            print("indice $_indice");
          });
        },
        items: const [
          // Botones para las vistas de la aplicacion
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Inicio"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_tree_rounded),
              label: "Combinaciones"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail_sharp),
              label: "Info Personas"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new_outlined),
              label: "Sets"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: "Calendario"
          ),
        ],
      ),
    );
  }
}