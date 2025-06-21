// Importa el paquete de Material Design de Flutter.
import 'package:flutter/material.dart';
// Importa la SplashScreen que acabamos de crear.
import 'package:puzzlin_app/features/splash/presentation/splash_screen.dart';
// Importa tu archivo de tema si lo tuvieras, por ahora usaremos un tema básico.
// import 'package:puzzlin_app/core/themes/app_theme.dart';

void main() {
  // `runApp` inicia la aplicación Flutter.
  runApp(const MyApp());
}

/// MyApp es el widget raíz de la aplicación.
class MyApp extends StatelessWidget {
  // Constructor constante.
  const MyApp({super.key});

  @override
  // El método build describe la interfaz de usuario de este widget.
  Widget build(BuildContext context) {
    // MaterialApp es un widget que envuelve una serie de widgets que implementan
    // la aplicación utilizando Material Design.
    return MaterialApp(
      // Oculta el banner de "DEBUG" en la esquina superior derecha.
      debugShowCheckedModeBanner: false,
      // Título de la aplicación, visible en el selector de tareas del dispositivo.
      title: 'Puzzlin',
      // Define el tema de la aplicación. Por ahora, un tema básico.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Color primario de la paleta de Material.
        // Puedes definir un esquema de color más detallado aquí más adelante.
        // colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF4285F4)), // Azul Puzzlin
        // useMaterial3: true, // Si quieres usar Material Design 3.
      ),
      // La pantalla inicial de la aplicación es la SplashScreen.
      home: const SplashScreen(),
    );
  }
}