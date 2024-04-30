import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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
        height: 50,
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
                height: 40,
                width: 40,
                child: Image.network(widget.rutaImagen),
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