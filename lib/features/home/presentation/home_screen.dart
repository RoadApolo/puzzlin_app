// Importa el paquete de Material Design de Flutter.
import 'package:flutter/material.dart';

/// HomeScreen es un StatelessWidget simple para la pantalla de inicio temporal.
class HomeScreen extends StatelessWidget {
  // Constructor constante.
  const HomeScreen({super.key});

  @override
  // El método build describe la interfaz de usuario de este widget.
  Widget build(BuildContext context) {
    // Scaffold proporciona la estructura visual de la pantalla.
    return Scaffold(
      // AppBar es la barra superior de la aplicación.
      appBar: AppBar(
        title: const Text('Puzzlin - Inicio'), // Título de la barra.
        backgroundColor: const Color(0xFF4285F4), // Color de fondo de la barra (Azul Puzzlín).
        foregroundColor: Colors.white, // Color del texto y los iconos en la barra.
      ),
      // El cuerpo de la pantalla.
      body: const Center(
        // Centra el contenido en la pantalla.
        child: Text(
          '¡Bienvenido a Puzzlin!', // Mensaje de bienvenida.
          style: TextStyle(
            fontSize: 28, // Tamaño de fuente.
            fontWeight: FontWeight.bold, // Negrita.
            color: Color(0xFF34A853), // Color del texto (Verde Puzzlín).
          ),
        ),
      ),
    );
  }
}