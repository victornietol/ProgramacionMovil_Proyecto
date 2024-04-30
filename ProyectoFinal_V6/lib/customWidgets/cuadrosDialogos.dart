import 'package:flutter/material.dart';

class CuadroDialogo1 extends StatefulWidget {
  const CuadroDialogo1({super.key, required this.nombreItem, required this.contenido});
  final String nombreItem;
  final Widget contenido;

  @override
  State<CuadroDialogo1> createState() => _CuadroDialogo1State();
}

class _CuadroDialogo1State extends State<CuadroDialogo1> {

  @override
  Widget build(BuildContext context) {
    // tamanio de la pantalla del dispositivo
    final tamanioPantallaAlto = MediaQuery.of(context).size.height;
    final tamanioPantallaAncho = MediaQuery.of(context).size.width;
    final maxPorcentaje = 0.9;
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
              height: 20,
            ),
            Container(
                height: maxAlturaWidget * 0.85,  // altura de la caja de informacion
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
                      height: 20,
                    ),
                    Expanded( // Sirve para indicar que se utilice el maximo alto posible de esa seccion
                        child: ListView(
                          children: [
                            widget.contenido, // contenido de la caja
                          ],
                        ),
                    ),
                    const SizedBox( // espacio debajo del contenido dentro de la caja
                      height: 20,
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
                  width: maxAnchoWidget * 0.18,  // 80
                  child: ElevatedButton( // boton de regresar
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      child: const Row(
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
                  width: maxAnchoWidget * 0.51, //210
                  child: ElevatedButton( // boton de Agregar a Wishlist
                      onPressed: (){
                        print("Presionado");
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
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 2,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.inversePrimary
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Agregar a Wishlist",
                            style: TextStyle(
                                fontSize: 14
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