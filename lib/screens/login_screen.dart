import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import '../models/usuario.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final List<Usuario> _usuarios = [
    Usuario(nombre: "Lex Marquez", login: "lex", password: "123", email: "lex@mail.com"),
    Usuario(nombre: "Mario Gomez", login: "mario", password: "456", email: "mario@mail.com"),
  ];

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  int _intentos = 0;

  void _login() {
    String login = _loginController.text;
    String password = _passwordController.text;

    if (login.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, complete todos los campos')),
      );
      return;
    }

    Usuario? usuario = _usuarios.firstWhere(
      (u) => u.login == login && u.password == password,
      orElse: () => Usuario(nombre: '', login: '', password: '', email: ''),
    );

    if (usuario.login.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeScreen(usuario: usuario),
        ),
      );
    } else {
      setState(() {
        _intentos++;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login o contraseña incorrecta')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio de sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Inicio de sesión', style: TextStyle(fontSize: 24)),
            TextField(
              controller: _loginController,
              decoration: InputDecoration(labelText: 'Login'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Entrar'),
            ),
            SizedBox(height: 20),
            Text('Intentos fallidos: $_intentos'),
          ],
        ),
      ),
    );
  }
}
