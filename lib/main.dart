import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const String _title ='Práctica 4';

    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const LogIn(),
    );
  }
}

class Carrito extends StatefulWidget {
  const Carrito({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {

  final List<List<String>> productos = [
    [
      "Arándanos",
      "https://spoonacular.com/cdn/ingredients_250x250/blueberries.jpg"
    ],
    [
      "Banana",
      "https://spoonacular.com/cdn/ingredients_250x250/bananas.jpg"
    ],
    [
      "Cerezas",
      "https://spoonacular.com/cdn/ingredients_250x250/cherries.jpg"
    ],
    [
      "Durazno",
      "https://spoonacular.com/cdn/ingredients_250x250/peaches.jpg"
    ],
    [
      "Frambuesas",
      "https://spoonacular.com/cdn/ingredients_250x250/raspberries.jpg"
    ],
    [
      "Frutillas",
      "https://spoonacular.com/cdn/ingredients_250x250/strawberries.jpg"
    ],
    [
      "Kiwi",
      "https://spoonacular.com/cdn/ingredients_250x250/kiwis.jpg"
    ],
    [
      "Limón",
      "https://spoonacular.com/cdn/ingredients_250x250/lemon.jpg"
    ],
    [
      "Manzana",
      "https://spoonacular.com/cdn/ingredients_250x250/apple.jpg",
    ],
    [
      "Naranja",
      "https://spoonacular.com/cdn/ingredients_250x250/orange.jpg"
    ],
    [
      "Pera",
      "https://spoonacular.com/cdn/ingredients_250x250/pear.jpg"
    ],
    [
      "Pomelo",
      "https://spoonacular.com/cdn/ingredients_250x250/grapefruit.jpg"
    ],
    [
      "Sandía",
      "https://spoonacular.com/cdn/ingredients_250x250/watermelon.jpg"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: productos.length,
          itemBuilder: (context, index) {
            final item = productos[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(item[1]),
              ),
              title: Text(
                item[0]
              )
            );
          },
        )
      ),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LogInState();

}

class _LogInState extends State<LogIn> {

  final _controllerContrasena = TextEditingController();
  final _controllerUsuario = TextEditingController();
  bool _submitted = false;
  bool _isObscure = true;

  @override
  void dispose() {
    _controllerContrasena.dispose();
    _controllerUsuario.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Práctica 4'),
      ),
      body: DecoratedBox(
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0,-0.5),
              child: SizedBox(
                width: 333,
                height: 484,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'Práctica 4',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30),
                              )),
                          Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'Iniciar Sesión',
                                style: TextStyle(fontSize: 20),
                              )),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: ValueListenableBuilder(
                              valueListenable: _controllerUsuario,
                              builder: (context, value, _) {
                                return TextField(
                                  controller: _controllerUsuario,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: 'Nombre de Usuario',
                                    errorText: _submitted ? _textoErrorUsuario : null,
                                  ),
                                );
                              }
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: ValueListenableBuilder(
                              valueListenable: _controllerContrasena,
                              builder: (context, value, _) {
                                return TextField(
                                  controller: _controllerContrasena,
                                  obscureText: _isObscure,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: 'Contraseña',
                                    errorText: _submitted ? _textoErrorContrasena : null,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isObscure ? Icons.visibility : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                    )
                                  ),
                                );
                              }
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              //forgot password screen
                            },
                            child: const Text('Olvidé la contraseña',),
                          ),
                          Container(
                              height: 50,
                              width: double.infinity,
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: ElevatedButton(
                                child: const Text('Iniciar Sesión'),
                                onPressed: _iniciarSesion,
                              )
                          ),
                          Row(
                            children: <Widget>[
                              const Text('¿No tenés una cuenta?'),
                              TextButton(
                                child: const Text(
                                  'Crear cuenta',
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  //signup screen
                                },
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ],
                      ))
                    ]
                  ),

                ),
              ),
            ),
            const Align(
              alignment: Alignment(0,0.95),
              child: Text(
                'Grupo 4 - UTN FRLP',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400
                )
              )
            )
          ],
          ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.gif'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  String? get _textoErrorContrasena {
    final text = _controllerContrasena.value.text;
    if (text.isEmpty) {
      return 'La contraseña no puede estar vacía.';
    } else {
      if (text.length < 7) {
        return 'La contraseña debe tener 7 o más caracteres.';
      }
    }
    return null;
  }

  String? get _textoErrorUsuario {
    final text = _controllerUsuario.value.text;
    if (text.isEmpty) {
      return 'El usuario no puede estar vacío.';
    } else {
      if (!text.contains('@')) {
        return 'El formato es inválido.';
      }
    }
    return null;
  }

  void _iniciarSesion() {
    final usuario = _controllerUsuario.value.text;
    final contrasena = _controllerContrasena.value.text;
    setState(() => _submitted = true);
    if (_textoErrorUsuario == null && _textoErrorContrasena == null){
      setState(() => _submitted = false);
      if (usuario == 'moviles@utn' && contrasena == 'utn1234') {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const Carrito(title: 'Carrito')),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Usuario o contraseña inválidos.'),
            actions: [
              TextButton(
                child: const Text('Aceptar'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        );
      }
    }
  }

}