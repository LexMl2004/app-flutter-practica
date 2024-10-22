import 'package:flutter/material.dart';
import '../models/usuario.dart';

class WelcomeScreen extends StatelessWidget {
  final Usuario usuario;

  WelcomeScreen({required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bienvenid@ a la APP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Bienvenid@', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text('Login: ${usuario.login}', style: TextStyle(fontSize: 18)),
            Text('Nombre completo: ${usuario.nombre}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
