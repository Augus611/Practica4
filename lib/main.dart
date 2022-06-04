import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    const String _title ='Práctica 4';

    return MaterialApp(
      title: _title,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: const LogIn(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Apretaste el botón\nesta cantidad de veces:',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
              builder: (context) => const MyHomePage(title: 'Carrito')),
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