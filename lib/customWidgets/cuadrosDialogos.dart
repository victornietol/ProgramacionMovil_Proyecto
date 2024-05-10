import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyectofinal/navegador.dart';
import 'package:proyectofinal/vistas/sets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;

// cuadro de dialogo descripcion de personas
class CuadroDialogo1 extends StatefulWidget {
  const CuadroDialogo1({super.key, required this.nombreItem, required this.contenido});
  final String nombreItem;
  final Widget contenido;

  @override
  State<CuadroDialogo1> createState() => _CuadroDialogo1State();
}

class _CuadroDialogo1State extends State<CuadroDialogo1> {
  final db = FirebaseFirestore.instance;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _usuario = "";


  // funcion para leer el usuario logueado
  Future<void> _leerUsuario() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs != Null) {
      setState(() {
        _usuario = (prefs.getString("usuario") ?? ""); // si es nulo se obtiene el usuario, sino se pone ""
      });
    }
  }


  Future<void> _guardarDatos() async {
    // guardar datos
    Map<String, dynamic> datos = {
      "item":widget.nombreItem,
    };
    await db.collection(_usuario).doc(widget.nombreItem).set(datos);
  }

  @override
  void initState() {
    super.initState();
    _leerUsuario();
  }


  @override
  Widget build(BuildContext context) {
    // tamanio de la pantalla del dispositivo
    final tamanioPantallaAlto = MediaQuery.of(context).size.height;
    final tamanioPantallaAncho = MediaQuery.of(context).size.width;
    final maxPorcentaje = 0.85;
    final maxAlturaWidget = tamanioPantallaAlto * maxPorcentaje;
    final maxAnchoWidget = tamanioPantallaAncho * maxPorcentaje;

    return AlertDialog(
      content: Container(
        height: maxAlturaWidget,
        width: maxAnchoWidget,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.nombreItem,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            
            Container(
                height: maxAlturaWidget * 0.84,  // altura de la caja de informacion
                width: maxAnchoWidget * 0.95, // ancho de la caja de informacion
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Colors.black
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 0,
                    ),
                    Expanded( // Sirve para indicar que se utilice el maximo alto posible de esa seccion
                        child: ListView(
                          children: [
                            widget.contenido, // contenido de la caja
                          ],
                        ),
                    ),
                    const SizedBox( // espacio debajo del contenido dentro de la caja
                      height: 0,
                    )
                  ],
                )
            ),


            /*
            Container(
              height: maxAlturaWidget * 0.85, // dimensiones de la caja para mostrar el contenido
              width: maxAnchoWidget * 0.95,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded( // Sirve para indicar que se utilice el maximo alto posible de esa seccion
                    child: ListView(
                      children: [
                        widget.contenido, // contenido de la caja
                      ],
                    ),
                  ),
                ],
              )
            ),

             */

            //widget.contenido,


            const Expanded(
              child: SizedBox(),
            ),
            Row(  // botones de la parte inferior
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 40,
                  width: maxAnchoWidget * 0.17,  // 80
                  child: ElevatedButton( // boton de regresar
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      child: const Icon(Icons.keyboard_backspace_rounded),
                  ),
                ),
                const Expanded( // ocupar el espacio sobrante entre los dos botones
                    child: SizedBox(
                      width: double.infinity,
                    ),
                ),

                Container(
                  height: 40,
                  width: maxAnchoWidget * 0.60, //210
                  child: ElevatedButton( // boton de Agregar a Wishlist
                      onPressed: (){
                        if(_usuario == "") {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    AlertDialog(
                                      content: const Text(
                                        "No se pueden agregar items a Wishlist sin iniciar sesión.",
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                          ),
                                          child: const Text("Aceptar"),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              }
                          );
                        } else {  // cuando se guardan correctamente en wishlist
                          _guardarDatos();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    AlertDialog(
                                      content: const Text(
                                        "¡Agregado exitosamente!",
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                          ),
                                          child: const Text("Aceptar"),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              }
                          );
                        }

                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.add_task_outlined,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 1,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.inversePrimary
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "Agregar a Wishlist",
                          )
                        ],
                      )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



// cuadro de dialogo descripcion de wishlist (diferentes botones inferiores)
class CuadroDialogo2 extends StatefulWidget {
  const CuadroDialogo2({super.key, required this.nombreItem, required this.contenido});
  final String nombreItem;
  final Widget contenido;

  @override
  State<CuadroDialogo2> createState() => _CuadroDialogo2State();
}

class _CuadroDialogo2State extends State<CuadroDialogo2> {
  final db = FirebaseFirestore.instance;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _usuario = "";


  // funcion para leer el usuario logueado
  Future<void> _leerUsuario() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs != Null) {
      setState(() {
        _usuario = (prefs.getString("usuario") ?? ""); // si es nulo se obtiene el usuario, sino se pone ""
      });
    }
  }

  void _borrarDocumento(String item) {
    db.collection(_usuario).doc(item).delete();
  }

  @override
  void initState() {
    super.initState();
    _leerUsuario();
  }


  @override
  Widget build(BuildContext context) {
    // tamanio de la pantalla del dispositivo
    final tamanioPantallaAlto = MediaQuery.of(context).size.height;
    final tamanioPantallaAncho = MediaQuery.of(context).size.width;
    final maxPorcentaje = 0.85;
    final maxAlturaWidget = tamanioPantallaAlto * maxPorcentaje;
    final maxAnchoWidget = tamanioPantallaAncho * maxPorcentaje;

    return AlertDialog(
      content: Container(
        height: maxAlturaWidget,
        width: maxAnchoWidget,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Información ${widget.nombreItem}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
            const SizedBox(
              height: 15,
            ),


            Container(
                height: maxAlturaWidget * 0.84,  // altura de la caja de informacion
                width: maxAnchoWidget * 0.95, // ancho de la caja de informacion
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Colors.black
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 0,
                    ),
                    Expanded( // Sirve para indicar que se utilice el maximo alto posible de esa seccion
                      child: ListView(
                        children: [
                          widget.contenido, // contenido de la caja
                        ],
                      ),
                    ),
                    const SizedBox( // espacio debajo del contenido dentro de la caja
                      height: 0,
                    )
                  ],
                )
            ),

            const SizedBox(
                height: 20
            ),
            Row(  // botones de la parte inferior
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 40,
                  width: maxAnchoWidget * 0.17,  // 80
                  child: ElevatedButton( // boton de regresar
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.keyboard_backspace_rounded),
                      ],
                    ),
                  ),
                ),
                const Expanded( // ocupar el espacio sobrante entre los dos botones
                  child: SizedBox(
                    width: double.infinity,
                  ),
                ),

                Container(
                  height: 40,
                  width: maxAnchoWidget * 0.60, //210
                  child: ElevatedButton( // boton de Agregar a Wishlist
                      onPressed: (){
                        _borrarDocumento(widget.nombreItem);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Navegador(vistaInicio: 3,)),
                              (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.remove_circle_outline,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 1,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.inversePrimary
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "Eliminar de Wishlist",
                            style: TextStyle(
                                fontSize: 13
                            ),
                          )
                        ],
                      )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



// cuadro de dialogo para social links
class CuadroDialogoSL extends StatefulWidget {
  const CuadroDialogoSL({super.key, required this.nombreItem, required this.contenido});
  final String nombreItem;
  final Widget contenido;

  @override
  State<CuadroDialogoSL> createState() => _CuadroDialogoSLState();
}

class _CuadroDialogoSLState extends State<CuadroDialogoSL> {
  final db = FirebaseFirestore.instance;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _usuario = "";


  // funcion para leer el usuario logueado
  Future<void> _leerUsuario() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs != Null) {
      setState(() {
        _usuario = (prefs.getString("usuario") ?? ""); // si es nulo se obtiene el usuario, sino se pone ""
      });
    }
  }


  Future<void> _guardarDatos() async {
    // guardar datos
    Map<String, dynamic> datos = {
      "item":widget.nombreItem,
    };
    await db.collection(_usuario).doc(widget.nombreItem).set(datos);
  }

  @override
  void initState() {
    super.initState();
    _leerUsuario();
  }


  @override
  Widget build(BuildContext context) {
    // tamanio de la pantalla del dispositivo
    final tamanioPantallaAlto = MediaQuery.of(context).size.height;
    final tamanioPantallaAncho = MediaQuery.of(context).size.width;
    final maxPorcentaje = 0.85;
    final maxAlturaWidget = tamanioPantallaAlto * maxPorcentaje;
    final maxAnchoWidget = tamanioPantallaAncho * maxPorcentaje;

    return AlertDialog(
      content: Container(
        height: maxAlturaWidget,
        width: maxAnchoWidget,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Información ${widget.nombreItem}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                height: maxAlturaWidget * 0.84,  // altura de la caja de informacion
                width: maxAnchoWidget * 0.95, // ancho de la caja de informacion
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Colors.black
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 0,
                    ),
                    Expanded( // Sirve para indicar que se utilice el maximo alto posible de esa seccion
                      child: ListView(
                        children: [
                          widget.contenido, // contenido de la caja
                        ],
                      ),
                    ),
                    const SizedBox( // espacio debajo del contenido dentro de la caja
                      height: 0,
                    )
                  ],
                )
            ),
            const Expanded(
              child: SizedBox(),
            ),

            Row(  // botones de la parte inferior
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 40,
                  width: maxAnchoWidget * 0.20,  // 80
                  child: ElevatedButton( // boton de regresar
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                    child: const Icon(Icons.keyboard_backspace_rounded),
                  ),
                ),
                const Expanded( // ocupar el espacio sobrante entre los dos botones
                  child: SizedBox(
                    width: double.infinity,
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}




// widget para mostrar las posibles combinaciones
class ContenidoCombinaciones extends StatefulWidget {
  const ContenidoCombinaciones({super.key, required this.personaActual, required this.onChange});
  final String? personaActual;
  final Function(String?)? onChange;

  @override
  State<ContenidoCombinaciones> createState() => _ContenidoCombinacionesState();
}

class _ContenidoCombinacionesState extends State<ContenidoCombinaciones> {
  String? rutaActual = "";

  @override
  void initState() {
    super.initState();
    actualizarRutaActual();
  }

  @override
  void didUpdateWidget(ContenidoCombinaciones oldWidget) {
    super.didUpdateWidget(oldWidget);
    actualizarRutaActual();
  }

  void actualizarRutaActual() {
    if (widget.personaActual == null) {
      rutaActual = "transparente";
    } else {
      rutaActual = widget.personaActual;
    }
  }


  @override
  Widget build(BuildContext  context) {
    return Container(
      //padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InteractiveViewer(
              child: Image.asset("assets/imagenesPersonas/combinaciones/$rutaActual.png"),
          ),
        ],
      ),
    );
  }
}



// widget para mostrar el contenido de la vista respuestasExamenes de la pestania Guias
class ContenidoRespuestasEx extends StatefulWidget {
  const ContenidoRespuestasEx({super.key, required this.mesActual, required this.onChange});
  final String? mesActual;
  final Function(String?)? onChange;

  @override
  State<ContenidoRespuestasEx> createState() => _ContenidoRespuestasExState();
}

class _ContenidoRespuestasExState extends State<ContenidoRespuestasEx> {
  String? rutaActual = "";
  String _texto = "";

  @override
  void initState() {
    super.initState();
    actualizarRutaActual();
  }

  @override
  void didUpdateWidget(ContenidoRespuestasEx oldWidget) {
    super.didUpdateWidget(oldWidget);
    actualizarRutaActual();
  }

  void actualizarRutaActual() {
    if (widget.mesActual == null) {
      rutaActual = "Vacio";
    } else {
      rutaActual = widget.mesActual;
    }
  }

  // funcion para abrir archivos de texto
  Future<void> _leerTexto() async {
    String leerText = await rootBundle.loadString("assets/textoGuias/${rutaActual}.txt");
    setState(() {
      _texto = leerText;
    });
  }


  @override
  Widget build(BuildContext  context) {
    _leerTexto();
    return Expanded(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width ,
                  padding: const EdgeInsets.only(left: 40,right: 40, top: 30),
                  child: Text(_texto),
                )
              ],
            )
          ],
        )
    );
  }
}
