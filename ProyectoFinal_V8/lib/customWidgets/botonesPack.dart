import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:proyectofinal/customWidgets/cuadrosDialogos.dart';
import 'package:flutter/services.dart' show rootBundle;

// clase para boton con texto para cada persona
class BotonInfoContorno extends StatefulWidget {
  const BotonInfoContorno({super.key, required this.texto, required this.rutaImagen, required this.accion});
  final String texto, rutaImagen;
  final Function accion;

  @override
  State<BotonInfoContorno> createState() => _BotonInfoContornoState();
}

class _BotonInfoContornoState extends State<BotonInfoContorno> {

  @override
  Widget build(BuildContext context) {
    return Container( // contenedor para controlar dimensiones del boton
        height: 50,
        width: double.infinity,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              )
          ),
          onPressed: () => widget.accion(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox( // sirve para controlar las dimensiones de la imagen
                height: 40,
                width: 40,
                child: Image.asset(widget.rutaImagen),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(widget.texto)
            ],
          ),
        )
    );
  }
}




// clase para boton ElevatedButton con texto para cada persona
class BotonInfoElevated extends StatefulWidget {
  const BotonInfoElevated({super.key, required this.texto, required this.rutaImagen, required this.accion});
  final String texto, rutaImagen;
  final Function accion;

  @override
  State<BotonInfoElevated> createState() => _BotonInfoElevatedState();
}

class _BotonInfoElevatedState extends State<BotonInfoElevated> {

  @override
  Widget build(BuildContext context) {
    return Container( // contenedor para controlar dimensiones del boton
        height: 55,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              )
          ),
          onPressed: () => widget.accion(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox( // sirve para controlar las dimensiones de la imagen
                height: 50,
                width: 50,
                child: Image.asset(widget.rutaImagen),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                widget.texto,
                style: const TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
        )
    );
  }
}



// Clase para boton con lista desplegable
class BotonListaDesplegable extends StatefulWidget {
  const BotonListaDesplegable({super.key,
    required this.listaItems,
    required this.colorBoton,
    required this.colorTextoBoton,
    required this.iconoPrincipal,
    required this.iconoSecundario,
    required this.iconoListaDesplegada,
    required this.colorScroll,
    required this.textoBoton,
    required this.textoCuadroBusqueda,
    required this.colorIconoListaDes,
    required this.colorIconoPrincipal,
    required this.colorIconoSecundario,
    required this.colorListaDesplegada,
    required this.colorTextoListaItems,
    required this.colorResaltarItemActual,
    required this.colorCursorTexto,
  });
  final List<String> listaItems;
  final Color colorBoton, colorTextoBoton, colorScroll, colorIconoPrincipal,
      colorIconoSecundario, colorIconoListaDes, colorTextoListaItems,
      colorListaDesplegada, colorResaltarItemActual, colorCursorTexto;
  final IconData iconoPrincipal,iconoSecundario, iconoListaDesplegada;
  final String textoBoton, textoCuadroBusqueda;

  @override
  State<BotonListaDesplegable> createState() => _BotonListaDesplegableState();
}

class _BotonListaDesplegableState extends State<BotonListaDesplegable> {
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Row(
          children: [
            Icon(
              widget.iconoPrincipal,
              size: 16,
              color: widget.colorIconoPrincipal,
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child:  Text(
                widget.textoBoton,
                style: TextStyle(
                  fontSize: 14,
                  color: widget.colorTextoBoton,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),

        items: widget.listaItems
            .map((item) => DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: widget.colorTextoListaItems,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: 200,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: widget.colorBoton,
            ),
            color: widget.colorBoton,
          ),
          elevation: 2,
        ),
        iconStyleData: IconStyleData(
          icon: Icon(
            widget.iconoSecundario,
          ),
          iconSize: 14,
          iconEnabledColor: widget.colorTextoBoton,
          iconDisabledColor: Colors.grey,
          openMenuIcon: Icon(
            widget.iconoListaDesplegada,
            size: 25,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.colorListaDesplegada,
          ),
          offset: const Offset(0, -10),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
            thumbColor: MaterialStateProperty.all(widget.colorScroll),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
            height: 40,
            padding: const EdgeInsets.only(left: 14, right: 14),
            overlayColor: MaterialStatePropertyAll(widget.colorResaltarItemActual)
        ),
        dropdownSearchData: DropdownSearchData(
          searchController: textEditingController,
          searchInnerWidgetHeight: 50,
          searchInnerWidget: Container(
            height: 50,
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 4,
              right: 8,
              left: 8,
            ),
            child: TextFormField(
              expands: true,
              maxLines: null,
              controller: textEditingController,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                hintText: 'Busca una Persona...',
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: widget.colorTextoBoton,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: widget.colorTextoBoton,
                    width: 1,
                  ),
                ),
              ),
              style: TextStyle(
                  color: widget.colorTextoBoton
              ),
              cursorColor: widget.colorCursorTexto,
            ),
          ),
          searchMatchFn: (item, searchValue) {
            String aux = searchValue.toLowerCase();
            if ( item.value.toString().toLowerCase().contains(searchValue) ) {
              return true;
            } else if ( item.value.toString().contains(searchValue) ) {
              return true;
            } else if ( item.value.toString().toLowerCase().contains(aux) ) {
              return true;
            };
            return false;
            //return item.value.toString().contains(searchValue);
          },
        ),
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    );
  }
}



// widget para crear la lista de botones de la vista infoPersonas
class BotonesPersonas extends StatefulWidget {
  const BotonesPersonas({super.key, required this.personas});
  final List<String> personas;

  @override
  State<BotonesPersonas> createState() => _BotonesPersonasState();
}

class _BotonesPersonasState extends State<BotonesPersonas> {
  // lista de widgets de los botones
  List<Widget> botones = [];

  @override
  void initState() {
    super.initState();
    _crearWidget();
  }

  void _crearWidget() {
    widget.personas.sort();
    for (int i=0; i<widget.personas.length; i++) {
      botones.add(
          Container(
            height: 1,
            color: Colors.amberAccent.withOpacity(0.5),
          )
      );
      botones.add(
        BotonInfoElevated(
            texto: widget.personas[i],
            rutaImagen: "assets/imagenesPersonas/info/${widget.personas[i]}/0.png",
            accion: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CuadroDialogo1(
                        nombreItem: widget.personas[i],
                        contenido: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Imagenes con las tablas de informacion
                              Container(
                                padding: EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => Dialog(
                                          child: InteractiveViewer(
                                            child: Image.asset( // imagen que se abre en pabtalla completa
                                              "assets/imagenesPersonas/info/${widget.personas[i]}/0.png",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        )
                                    );
                                  },
                                  child: Image.asset( // imagen que se muestra en la lista de widgets normal
                                    "assets/imagenesPersonas/info/${widget.personas[i]}/0.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => Dialog(
                                          child: InteractiveViewer(
                                            child: Image.asset( // imagen que se abre en pabtalla completa
                                              "assets/imagenesPersonas/info/${widget.personas[i]}/1.png",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        )
                                    );
                                  },
                                  child: Image.asset( // imagen que se muestra en la lista de widgets normal
                                    "assets/imagenesPersonas/info/${widget.personas[i]}/1.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => Dialog(
                                          child: InteractiveViewer(
                                            child: Image.asset( // imagen que se abre en pabtalla completa
                                              "assets/imagenesPersonas/info/${widget.personas[i]}/2.png",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        )
                                    );
                                  },
                                  child: Image.asset( // imagen que se muestra en la lista de widgets normal
                                    "assets/imagenesPersonas/info/${widget.personas[i]}/2.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => Dialog(
                                          child: InteractiveViewer(
                                            child: Image.asset( // imagen que se abre en pabtalla completa
                                              "assets/imagenesPersonas/info/${widget.personas[i]}/3.png",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        )
                                    );
                                  },
                                  child: Image.asset( // imagen que se muestra en la lista de widgets normal
                                    "assets/imagenesPersonas/info/${widget.personas[i]}/3.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => Dialog(
                                          child: InteractiveViewer(
                                            child: Image.asset( // imagen que se abre en pabtalla completa
                                              "assets/imagenesPersonas/info/${widget.personas[i]}/4.png",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        )
                                    );
                                  },
                                  child: Image.asset( // imagen que se muestra en la lista de widgets normal
                                    "assets/imagenesPersonas/info/${widget.personas[i]}/4.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        )
                    );
                  }
              );
            }
        ),
      );
      botones.add(
        Container(
          height: 1,
          color: Colors.amberAccent.withOpacity(0.5),
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: botones,
    );
  }
}



class BotonesPersonasWishlist extends StatefulWidget {
  const BotonesPersonasWishlist({super.key, required this.personas});
  final List<String> personas;

  @override
  State<BotonesPersonasWishlist> createState() => _BotonesPersonasWishlistState();
}

class _BotonesPersonasWishlistState extends State<BotonesPersonasWishlist> {
  // lista de widgets de los botones
  List<Widget> botones = [];
  List<String> listaPersonas = [];
  List<String> listaLibros = [];


  @override
  void initState() {
    super.initState();

    _crearWidget();
  }


  void _crearWidget() {
    //widget.personas.sort();
    for (int i=0; i<widget.personas.length; i++) {
      botones.add(
          Container(
            height: 1,
            color: Colors.amberAccent.withOpacity(0.5),
          )
      );
      botones.add(
        BotonInfoElevated(
            texto: widget.personas[i],
            rutaImagen: "assets/imagenesPersonas/info/${widget.personas[i]}/0.png",
            accion: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CuadroDialogo2(
                        nombreItem: widget.personas[i],
                        contenido: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Imagenes con las tablas de informacion
                              Container(
                                padding: EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => Dialog(
                                          child: InteractiveViewer(
                                            child: Image.asset( // imagen que se abre en pabtalla completa
                                              "assets/imagenesPersonas/info/${widget.personas[i]}/0.png",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        )
                                    );
                                  },
                                  child: Image.asset( // imagen que se muestra en la lista de widgets normal
                                    "assets/imagenesPersonas/info/${widget.personas[i]}/0.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => Dialog(
                                          child: InteractiveViewer(
                                            child: Image.asset( // imagen que se abre en pabtalla completa
                                              "assets/imagenesPersonas/info/${widget.personas[i]}/1.png",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        )
                                    );
                                  },
                                  child: Image.asset( // imagen que se muestra en la lista de widgets normal
                                    "assets/imagenesPersonas/info/${widget.personas[i]}/1.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => Dialog(
                                          child: InteractiveViewer(
                                            child: Image.asset( // imagen que se abre en pabtalla completa
                                              "assets/imagenesPersonas/info/${widget.personas[i]}/2.png",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        )
                                    );
                                  },
                                  child: Image.asset( // imagen que se muestra en la lista de widgets normal
                                    "assets/imagenesPersonas/info/${widget.personas[i]}/2.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => Dialog(
                                          child: InteractiveViewer(
                                            child: Image.asset( // imagen que se abre en pabtalla completa
                                              "assets/imagenesPersonas/info/${widget.personas[i]}/3.png",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        )
                                    );
                                  },
                                  child: Image.asset( // imagen que se muestra en la lista de widgets normal
                                    "assets/imagenesPersonas/info/${widget.personas[i]}/3.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => Dialog(
                                          child: InteractiveViewer(
                                            child: Image.asset( // imagen que se abre en pabtalla completa
                                              "assets/imagenesPersonas/info/${widget.personas[i]}/4.png",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        )
                                    );
                                  },
                                  child: Image.asset( // imagen que se muestra en la lista de widgets normal
                                    "assets/imagenesPersonas/info/${widget.personas[i]}/4.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        )
                    );
                  }
              );
            }
        ),
      );

      /*
      if (listaLibros.contains(widget.personas[i])) {
        botones.add(
          BotonInfoElevated(
              texto: widget.personas[i],
              rutaImagen: "assets/libros/imgLibro.png",
              accion: () {
                _leeriInfoLibro2(widget.personas[i]);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CuadroDialogo1(
                          nombreItem: widget.personas[i],
                          contenido: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // Imagenes con las tablas de informacion
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) => Dialog(
                                            child: InteractiveViewer(
                                              child: Image.asset( // imagen que se abre en pabtalla completa
                                                "assets/libros/imgLibro.png",
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          )
                                      );
                                    },
                                    child: Image.asset( // imagen que se muestra en la lista de widgets normal
                                      "assets/libros/imgLibro.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(  // descripciones de cada personaje
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    desc,
                                    textAlign: TextAlign.justify,
                                  ),
                                ),

                              ],
                            ),
                          )
                      );
                    }
                );
              }
          ),
        );
      }

       */





      botones.add(
          Container(
            height: 1,
            color: Colors.amberAccent.withOpacity(0.5),
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: botones,
    );
  }
}



// botones para vista social links
class BotonesSocialLinks extends StatefulWidget {
  const BotonesSocialLinks({super.key, required this.personas});
  final List<String> personas;

  @override
  State<BotonesSocialLinks> createState() => _BotonesSocialLinksState();
}

class _BotonesSocialLinksState extends State<BotonesSocialLinks> {
  // lista de widgets de los botones
  List<Widget> botones = [];
  Map<String,String> descripcionesPersonaje = {};
  String desc = "";

  @override
  void initState() {
    super.initState();
    _crearWidget();
    _leerinfoPersonaje();
  }

  Future<void> _leerinfoPersonaje() async {
    for (int i=0; i<widget.personas.length; i++) {
      String descripcion = await rootBundle.loadString("assets/social-Links/info/${widget.personas[i]}.txt");
      setState(() {
        descripcionesPersonaje[widget.personas[i]] = descripcion;
      });
    }
  }

  Future<void> _leerinfoPersonaje2(String personaje) async {
    String descripcion = await rootBundle.loadString("assets/social-Links/info/${personaje}.txt");
    setState(() {
      desc = descripcion;
    });
  }

  void _crearWidget() {
    widget.personas.sort();
    for (int i=0; i<widget.personas.length; i++) {
      botones.add(
          Container(
            height: 1,
            color: Colors.amberAccent.withOpacity(0.5),
          )
      );
      botones.add(
        BotonInfoElevated(
            texto: widget.personas[i],
            rutaImagen: "assets/social-Links/imagenes/${widget.personas[i]}.png",
            accion: () {
              _leerinfoPersonaje2(widget.personas[i]);
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CuadroDialogoSL(
                        nombreItem: widget.personas[i],
                        contenido: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Imagen del personaje
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => Dialog(
                                          child: InteractiveViewer(
                                            child: Image.asset( // imagen que se abre en pabtalla completa
                                              "assets/social-Links/imagenes/${widget.personas[i]}.png",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        )
                                    );
                                  },
                                  child: Image.asset( // imagen que se muestra en la lista de widgets normal
                                    "assets/social-Links/imagenes/${widget.personas[i]}.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(  // descripciones de cada personaje
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  desc,
                                  textAlign: TextAlign.justify,
                                ),
                              ),


                            ],
                          ),
                        )
                    );
                  }
              );
            }
        ),
      );
      botones.add(
          Container(
            height: 1,
            color: Colors.amberAccent.withOpacity(0.5),
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: botones,
    );
  }
}



// botones para la vista libros
class BotonesLibros extends StatefulWidget {
  const BotonesLibros({super.key, required this.personas});
  final List<String> personas; // lista de los libros

  @override
  State<BotonesLibros> createState() => _BotonesLibrosState();
}

class _BotonesLibrosState extends State<BotonesLibros> {
  // lista de widgets de los botones
  List<Widget> botones = [];
  Map<String,String> descripcionesLibros = {};
  String desc = "";

  @override
  void initState() {
    super.initState();
    _crearWidget();
    _leerInfoLibro();
  }

  Future<void> _leerInfoLibro() async {
    for (int i=0; i<widget.personas.length; i++) {
      String descripcion = await rootBundle.loadString("assets/libros/info/${widget.personas[i]}.txt");
      setState(() {
        descripcionesLibros[widget.personas[i]] = descripcion;
      });
    }
  }

  Future<void> _leeriInfoLibro2(String libro) async {
    String descripcion = await rootBundle.loadString("assets/libros/info/${libro}.txt");
    setState(() {
      desc = descripcion;
    });
  }

  void _crearWidget() {
    widget.personas.sort();
    for (int i=0; i<widget.personas.length; i++) {
      botones.add(
          Container(
            height: 1,
            color: Colors.amberAccent.withOpacity(0.5),
          )
      );
      botones.add(
        BotonInfoElevated(
            texto: widget.personas[i],
            rutaImagen: "assets/libros/imgLibro.png",
            accion: () {
              _leeriInfoLibro2(widget.personas[i]);
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CuadroDialogoSL(
                        nombreItem: widget.personas[i],
                        contenido: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Imagenes con las tablas de informacion
                              Container(
                                padding: EdgeInsets.all(10),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => Dialog(
                                          child: InteractiveViewer(
                                            child: Image.asset( // imagen que se abre en pabtalla completa
                                              "assets/libros/imgLibro.png",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        )
                                    );
                                  },
                                  child: Image.asset( // imagen que se muestra en la lista de widgets normal
                                    "assets/libros/imgLibro.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(  // descripciones de cada personaje
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  desc,
                                  textAlign: TextAlign.justify,
                                ),
                              ),

                            ],
                          ),
                        )
                    );
                  }
              );
            }
        ),
      );
      botones.add(
          Container(
            height: 1,
            color: Colors.amberAccent.withOpacity(0.5),
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: botones,
    );
  }
}















// boton con botones que se ocultan (no se usa aun)
class BotonExpandible1 extends StatefulWidget {
  const BotonExpandible1({super.key});

  @override
  State<BotonExpandible1> createState() => _BotonExpandible1State();
}

class _BotonExpandible1State extends State<BotonExpandible1> {
  bool mostrarBotonesAdicionales = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BotonArcanosDesplegable(
              texto: "aracano",
              accion: () {
                setState(() {
                  mostrarBotonesAdicionales = !mostrarBotonesAdicionales;
                });
              }
          ),
          if (mostrarBotonesAdicionales)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Acción cuando se presiona el primer botón adicional
                  },
                  child: Text('Botón adicional 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Acción cuando se presiona el segundo botón adicional
                  },
                  child: Text('Botón adicional 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Acción cuando se presiona el tercer botón adicional
                  },
                  child: Text('Botón adicional 3'),
                ),
                // Agrega más botones adicionales según sea necesario
              ],
            ),
        ],
      ),
    );
  }
}




// clase para boton ElevatedButton con texto para cada persona (todavia no se usa)
class BotonArcanosDesplegable extends StatefulWidget {
  const BotonArcanosDesplegable({super.key, required this.texto, required this.accion});
  final String texto;
  final Function accion;

  @override
  State<BotonArcanosDesplegable> createState() => _BotonArcanosDesplegableState();
}

class _BotonArcanosDesplegableState extends State<BotonArcanosDesplegable> {

  @override
  Widget build(BuildContext context) {
    return Container( // contenedor para controlar dimensiones del boton
        height: 55,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            backgroundColor: Colors.amberAccent,
          ),
          onPressed: () => widget.accion(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                  widget.texto,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        )
    );
  }
}

