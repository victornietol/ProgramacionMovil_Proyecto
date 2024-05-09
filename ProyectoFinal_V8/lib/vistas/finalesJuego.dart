import 'package:flutter/material.dart';
import 'package:proyectofinal/customWidgets/botonesPack.dart';
import 'package:proyectofinal/customWidgets/cuadrosDialogos.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:proyectofinal/vistas/pruebas.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FinalesJuego extends StatefulWidget {
  const FinalesJuego({super.key});

  @override
  State<FinalesJuego> createState() => _FinalesJuegoState();
}

class _FinalesJuegoState extends State<FinalesJuego> {
  String _finalExtra1 = "";
  String _finalExtra2 = "";
  String _finalComplice = "";
  String _finalGolden = "";
  String _finalMalo = "";
  String _finalNormal = "";
  String _finalVerdadero = "";
  String _intro = "";

  // abrir el archivo separado por comas para obtener las personas
  Future<void> _leerTexto() async {
    String finalExtra1 = await rootBundle.loadString("assets/finales/info/extra 1.txt");
    String finalExtra2 = await rootBundle.loadString("assets/finales/info/extra 2.txt");
    String finalComplice = await rootBundle.loadString("assets/finales/info/Final Complice.txt");
    String finalGolden = await rootBundle.loadString("assets/finales/info/Final Golden.txt");
    String finalMalo = await rootBundle.loadString("assets/finales/info/Final Malo.txt");
    String finalNormal = await rootBundle.loadString("assets/finales/info/Final Normal.txt");
    String finalVerdadero = await rootBundle.loadString("assets/finales/info/Final Verdadero.txt");
    String intro = await rootBundle.loadString("assets/finales/info/intro.txt");
    setState(() {
      _finalExtra1 = finalExtra1;
      _finalExtra2 = finalExtra2;
      _finalComplice = finalComplice;
      _finalGolden = finalGolden;
      _finalMalo = finalMalo;
      _finalNormal = finalNormal;
      _finalVerdadero = finalVerdadero;
      _intro = intro;
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
        title: const Text("Posibles finales"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 30),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _intro,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 20),

                        const Text(
                          "Cómo obtener el verdadero final",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _finalVerdadero,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 10),
                        Image.asset("assets/finales/imagenes/Final Verdadero.png"),

                        const SizedBox(height: 30),
                        Container(  // lineas de separacion
                          height: 2,
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(height: 30),


                        const Text(
                          "Final Golden (dentro del final verdadero)",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _finalGolden,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 10),
                        Image.asset("assets/finales/imagenes/Final Golden.png"),

                        const SizedBox(height: 30),
                        Container(  // lineas de separacion
                          height: 2,
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(height: 30),


                        const Text(
                          "Finales malos",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _finalMalo,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 10),
                        Image.asset("assets/finales/imagenes/Final Malo.png"),

                        const SizedBox(height: 30),
                        Container(  // lineas de separacion
                          height: 2,
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(height: 30),


                        const Text(
                          "Final de cómplice: lo bueno siempre gana",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _finalComplice,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 10),
                        Image.asset("assets/finales/imagenes/Final Complice.png"),

                        const SizedBox(height: 30),
                        Container(  // lineas de separacion
                          height: 2,
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(height: 30),


                        const Text(
                          "Final Normal: ¡a un paso del final!",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _finalNormal,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 10),
                        Image.asset("assets/finales/imagenes/Final Normal.png"),

                        const SizedBox(height: 30),
                        Container(  // lineas de separacion
                          height: 2,
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                          ),
                        ),
                        const SizedBox(height: 30),


                        const Text(
                          "EXTRA (Desbloquear los dos desafíos definitivos",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _finalExtra1,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 10),
                        Image.asset("assets/finales/imagenes/extra 1.png"),
                        const SizedBox(height: 30),
                        Text(
                          _finalExtra2,
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 10),
                        Image.asset("assets/finales/imagenes/extra 2.png"),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}