import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:proyectofinal/customWidgets/botonesPack.dart';
import 'package:proyectofinal/customWidgets/cuadrosDialogos.dart';
import 'package:flutter/services.dart' show rootBundle;

class Combinaciones extends StatefulWidget {
  const Combinaciones({super.key, required this.title});
  final String title;

  @override
  State<Combinaciones> createState() => _CombinacionesState();
}

class _CombinacionesState extends State<Combinaciones> {
  //  lista de items de la lista desplegable
  List<String> items = [];

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  // abri el archivo separado por comas
  Future<void> _leerTexto() async {
    String leerText = await rootBundle.loadString("assets/texto/personas.txt");
    List<String> listaPersonas = leerText.split(",");
    setState(() {
      items = listaPersonas;
    });
  }

  @override
  void initState() {
    super.initState();
    _leerTexto();
  }



  @override
  Widget build(BuildContext context) {
    // colores de lista desplegable
    Color colorBoton = Colors.amberAccent;
    Color colorTextoBoton = Colors.white;

    Color colorScroll = Colors.deepOrange;
    Color colorIconoListaDes = Colors.white;
    Color colorIconoPrincipal = Colors.deepOrange;
    Color colorIconoSecundario = Colors.white;
    Color colorListaDesplegada = Colors.amberAccent;
    Color colorTextoListaItems = Colors.white;
    Color colorResaltarItemActual = Colors.orange;
    Color colorCursorTexto = Colors.red;

    IconData iconoPrincipal = Icons.person;
    IconData iconoSecundario = Icons.arrow_forward_ios;
    IconData iconoListaDesplegada = Icons.keyboard_arrow_down_rounded;

    String textoBoton = "Elige la Persona";
    String textoCuadroBusqueda = "Busca una persona...";

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),

            const  Text(
                "Información de las combinaciones", // \n${selectedValue ?? ""}", // si es null se escribe lo de la derecha
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
            ),

            const SizedBox(
              height: 20,
            ),

            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Row(
                  children: [
                    Icon(
                      iconoPrincipal,
                      size: 16,
                      color: colorIconoPrincipal,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                        child:  Text(
                          textoBoton,
                          style: TextStyle(
                            fontSize: 14,
                            color: colorTextoBoton,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    )
                  ],
                ),


                items: items
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: colorTextoListaItems,
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
                      color: colorBoton,
                    ),
                    color: colorBoton,
                  ),
                  elevation: 2,
                ),
                iconStyleData: IconStyleData(
                  icon: Icon(
                    iconoSecundario,
                  ),
                  iconSize: 14,
                  iconEnabledColor: colorIconoSecundario,
                  iconDisabledColor: Colors.grey,
                  openMenuIcon: Icon(
                    iconoListaDesplegada,
                    size: 25,
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colorListaDesplegada,
                  ),
                  offset: const Offset(0, -10),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                    thumbColor: MaterialStateProperty.all(colorScroll),
                  ),
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: 40,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  overlayColor: MaterialStatePropertyAll(colorResaltarItemActual)
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
                        hintText: textoCuadroBusqueda,
                        hintStyle: TextStyle(
                          fontSize: 13,
                          color: colorTextoListaItems,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                      ),
                      style: TextStyle(
                          color: colorTextoListaItems
                      ),
                      cursorColor: colorCursorTexto,
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
            ),

            const SizedBox(
              height: 20,
            ),

            // caja de contenido
            ContenidoCombinaciones(
                personaActual: selectedValue,
                onChange: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
            ),


          ],
        ),
      ),
    );
  }
}



