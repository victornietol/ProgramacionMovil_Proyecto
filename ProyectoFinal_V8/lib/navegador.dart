import 'package:flutter/material.dart';
import 'package:proyectofinal/vistas/calendario.dart';
import 'package:proyectofinal/vistas/combinaciones.dart';
import 'package:proyectofinal/vistas/infoPersonas.dart';
import 'package:proyectofinal/vistas/iniciarSesion.dart';
import 'package:proyectofinal/vistas/inicio.dart';
import 'package:proyectofinal/vistas/sets.dart';
import 'package:proyectofinal/vistas/trivias.dart';

class Navegador extends StatefulWidget{
  const Navegador({super.key, required this.vistaInicio});
  final int vistaInicio;

  @override
  State<Navegador> createState() => _NavegadorState();
}

class _NavegadorState extends State<Navegador>{
  int _indice = 0; // indice para controlar la vista a mostrar
  final _vistas = []; // arreglo para introducir las vistas
  final List<String> _textoAppBar = [ // titulo de la appBar
    "Inicio",
    "Combinaciones",
    "Personas",
    "Wishlist",
    "Calendario",
    "Guias"
  ];

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
    setState(() {
      _indice = widget.vistaInicio;
    });
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
            title: "Wishlist"
        )
    );
    _vistas.add(
        const Calendario(
            title: "Vista de Calendario"
        )
    );
    _vistas.add(
        const Trivias(
            title: "Vista de Trivias"
        )
    );
  }

  // Botones de las vistas
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        foregroundColor: Colors.white,
        title: Text(_textoAppBar[_indice]), // dependiendo del indice se cambia el titulo
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const IniciarSesion(title: "Iniciar Sesión")),
                  (route) => false,
              );
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: _vistas[_indice],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _indice,
        onTap: (value) {
          setState(() {
            _indice = value; // la vista se cambia al valor del boton que se toque
          });
        },
        items: const [
          // Botones para las vistas de la aplicacion
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Inicio",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_tree_rounded),
              label: "Combinaciones"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail_sharp),
              label: "Personas"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new_outlined),
              label: "Wishlist"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: "Calendario"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.quiz_outlined),
              label: "Guías"
          ),
        ],
      ),
    );
  }


  //otra forma
/*
  Widget build(BuildContext context){
    return Scaffold(
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.amberAccent.withOpacity(0.7),
              //elevation: 0, // Quitar la sombra de la AppBar
              title: Text(_textoAppBar[_indice]), // dependiendo del indice se cambia el titulo
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const IniciarSesion(title: "Iniciar Sesión")),
                          (route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout_outlined),
                ),
              ],
              floating: true, // Hacer que la AppBar se eleve cuando se desplaza el contenido
              pinned: true, // Mantener la AppBar visible incluso al desplazar el contenido
              //expandedHeight: kToolbarHeight*0.1, // Establecer la altura expandida para que siempre sea transparente
            ),
          ];
        },
        body: _vistas[_indice],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _indice,
        onTap: (value) {
          setState(() {
            _indice = value; // la vista se cambia al valor del boton que se toque
          });
        },
        items: const [
          // Botones para las vistas de la aplicacion
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_tree_rounded),
              label: "Combinaciones"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail_sharp),
              label: "Personas"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new_outlined),
              label: "Wishlist"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: "Calendario"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.quiz_outlined),
              label: "Guías"
          ),
        ],
      ),
    );
  }
*/

  //otra forma
  /*
  Widget build(BuildContext context){
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.amberAccent.withOpacity(0.7),
            elevation: 0, // Quitar la sombra de la AppBar
            title: Text(_textoAppBar[_indice]), // dependiendo del indice se cambia el titulo
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const IniciarSesion(title: "Iniciar Sesión")),
                        (route) => false,
                  );
                },
                icon: const Icon(Icons.logout_outlined),
              ),
            ],
            floating: true, // Hacer que la AppBar se eleve cuando se desplaza el contenido
            pinned: true, // Mantener la AppBar visible incluso al desplazar el contenido
          ),
          SliverFillRemaining(
            child: _vistas[_indice],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _indice,
        onTap: (value) {
          setState(() {
            _indice = value; // la vista se cambia al valor del boton que se toque
          });
        },
        items: const [
          // Botones para las vistas de la aplicacion
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_tree_rounded),
              label: "Combinaciones"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail_sharp),
              label: "Personas"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new_outlined),
              label: "Wishlist"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: "Calendario"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.quiz_outlined),
              label: "Guías"
          ),
        ],
      ),
    );
  }
   */


}