import 'package:flutter/material.dart';
import 'package:proyectofinal/navegador.dart';
import 'package:proyectofinal/vistas/nuevoUsuario.dart';
import 'package:proyectofinal/vistas/pruebas.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IniciarSesion extends StatefulWidget {
  const IniciarSesion({super.key, required this.title});
  final String title;

  @override
  State<IniciarSesion> createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {
  final db = FirebaseFirestore.instance;
  String _usuario = "";
  String _contrasenia = "";
  TextEditingController _textUsuario = TextEditingController();
  TextEditingController _textContrasenia = TextEditingController();

  // variable para guardar el usuario logueado
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // variable para mensaje de errores y datos
  String _msjError = "";

  // leer datos de la BD
  void _leerUsuario() async {
    await db.collection("usuarioprueba").doc("inicio").get().then((documento) {
      setState(() {
        _usuario = documento.get("usuario");
        _contrasenia = documento.get("contrasenia");
      });
    });
  }


  // Verificar inicio de sesion
  void _iniciarSesion() async {
    String usuarioLeer = _textUsuario.text;
    String contraLeer = _textContrasenia.text;
    try {
      await db.collection("usuarioprueba").doc(usuarioLeer).get().then((documento) {
        setState(() {
          _usuario = documento.get("usuario");
          _contrasenia = documento.get("contrasenia");

          //mensaje error
          _msjError = "";
        });
      });

      // Si el usuario si existe y la contraseña es correcta, inicio correcto
      if (contraLeer == _contrasenia && contraLeer != "") {
        _guardarUsuario(_usuario);
        setState(() {
          _msjError = "";
        });

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Navegador(vistaInicio: 0,)),
            (route) => false,
        );

      } else {
        setState(() {
          _msjError = "Contraseña incorrecta";
        });
      }

    } catch (e) {

      /*
      // Cuadro de dialogo aparte
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("El usuario no existe"),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    color: Theme.of(context).colorScheme.inversePrimary,
                    child: const Text("Aceptar"),
                  )
                ],
              ),
            );
          }
      );
      */
      setState(() {
        _msjError = "El usuario no existe";
      });
    }
  }

  // funcion para guardar el usuario logueado
  Future<void> _guardarUsuario(String usuario) async {
    final SharedPreferences prefs = await _prefs;
    if(prefs != Null) {
      prefs.setString("usuario", usuario);
    }
  }

  Future<void> _sinUsuario() async {
    final SharedPreferences prefs = await _prefs;
    if(prefs != Null) {
      prefs.setString("usuario", "");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: ListView(
                  children: <Widget>[
                    const SizedBox(
                        height: 50
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.6,
                      child: Image.asset("assets/pruebas/logoJuego.png"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 300,
                      child: Column(  // Contenedor de inicio sesion
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Introduzca sus datos",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 40, right: 40),
                            child: TextField(
                              controller: _textUsuario,
                              obscureText: false,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Nombre de usuario"
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 40, right: 40),
                            child: TextField(
                              controller: _textContrasenia,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Contraseña"
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          // botones para iniciar sesion o solo entrar
                          Container(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                MaterialButton(
                                  color: Theme.of(context).colorScheme.inversePrimary,
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => const Navegador(vistaInicio: 0,)),
                                          (route) => false,
                                    );
                                    _sinUsuario();
                                  },
                                  child: const Text(
                                    "Entrar sin sesión",
                                  ),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                MaterialButton(
                                  color: Theme.of(context).colorScheme.inversePrimary,
                                  onPressed: () {
                                    _iniciarSesion();
                                  },
                                  child: const Text(
                                    "Iniciar Sesión",
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Mensaje de error debajo de el boton
                          const SizedBox(height: 20),
                          Text(
                            _msjError,
                            style: const TextStyle(
                                color: Colors.red
                            ),
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 40,
        width: 180,
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const NuevoUsuario(  // Vista para crear nuevo usuario
                      title: "Nuevo Usuario",
                  );
                }
            );
          },
          // Contenido del boton
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.add),
              const SizedBox(width: 10),
              Container(
                width: 2,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                "Nuevo Usuario",
                style: TextStyle(
                  fontSize: 16
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}