// Importa el paquete de Material Design de Flutter, necesario para la mayoría de los widgets de UI.
import 'package:flutter/material.dart';
// ELIMINA O COMENTA ESTA LÍNEA: import 'package:flutter_svg/flutter_svg.dart';
// Importa el paquete para trabajar con futuros (Future.delayed) y temporizadores.
import 'dart:async';
// Importa la pantalla de inicio a la que navegaremos después del splash.
// Asume que la pantalla de inicio estará en features/home/presentation/home_screen.dart
import 'package:puzzlin_app/features/home/presentation/home_screen.dart';


/// SplashScreen es un StatefulWidget porque necesita controlar el estado
/// para la navegación después de un tiempo definido.
class SplashScreen extends StatefulWidget {
  // Constructor constante para el widget, clave opcional.
  const SplashScreen({super.key});

  @override
  // Crea el estado mutable para este StatefulWidget.
  _SplashScreenState createState() => _SplashScreenState();
}

/// _SplashScreenState es la clase que gestiona el estado de SplashScreen.
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState(); // Llama a la implementación de initState de la superclase.
    // Llama a la función que maneja la navegación a la pantalla de inicio
    // después de un retardo inicial.
    _navigateToHome();
  }

  /// Método privado para manejar la navegación después del splash.
  void _navigateToHome() {
    // Configura un temporizador para ejecutar una función después de un retardo específico.
    // La duración actual es de 3 segundos. Puedes ajustar este valor si lo necesitas.
    Future.delayed(const Duration(seconds: 4), () {
      // IMPORTANTÍSIMO: Verificar si el widget sigue montado en el árbol de widgets
      // antes de intentar usar su BuildContext para la navegación.
      // Esto resuelve la advertencia "Don't use 'BuildContext' across async gaps."
      if (!mounted) {
        return; // Si el widget ya no está montado, salimos para evitar errores.
      }

      // Navega a la HomeScreen.
      // pushReplacement se usa para reemplazar la ruta actual en la pila de navegación,
      // lo que significa que el usuario no podrá volver a la Splash Screen con el botón de atrás.
      Navigator.pushReplacement(
        context, // El contexto del widget actual, necesario para la navegación.
        MaterialPageRoute(
          builder: (context) => const HomeScreen(), // Define la ruta a la HomeScreen.
        ),
      );
    });
  }

  @override
  // El método build describe la parte de la interfaz de usuario de este widget.
  Widget build(BuildContext context) {
    // Scaffold proporciona una estructura básica para la interfaz de usuario de Material Design.
    return Scaffold(
      // El widget `body` representa el contenido principal de la pantalla.
      // `Center` se utiliza para centrar su contenido (el `Column` en este caso)
      // tanto horizontal como verticalmente en la pantalla.
      body: Center(
        // `Container` es un widget versátil que se puede usar para pintar, posicionar o dimensionar.
        // Aquí lo usamos principalmente para definir el color de fondo de la pantalla de splash.
        // El color `0xFFFBF4E4` es un ejemplo de un tono suave y agradable para niños.
        // Puedes cambiarlo al color exacto que usaste en tu diseño de Figma (el valor hexadecimal).
        // Ejemplo de cómo usar un color de Figma: `color: const Color(0xFFFBBC05),` (Amarillo Puzzlín)
        child: Container(
          // Forzar al Container a ocupar todo el ancho y alto disponible.
          width: double.infinity, // Ocupa todo el ancho.
          height: double.infinity, // Ocupa todo el alto.
          color: const Color(0xFFFBF4E4), // Color de fondo del splash.
          // `Column` organiza sus hijos en una columna vertical.
          child: Column(
            // `mainAxisAlignment.center` alinea los hijos en el centro del eje principal (vertical).
            mainAxisAlignment: MainAxisAlignment.center,
            // `crossAxisAlignment.stretch` hace que los hijos se estiren para llenar el ancho disponible.
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Muestra el logo de la aplicación.
              // CAMBIADO: Usando Image.asset para PNG en lugar de SvgPicture.asset
              Image.asset(
                'assets/images/icons/puzzlin_logo.png', // <--- RUTA DE TU LOGO PNG
                width: 400, // Ancho deseado para el logo. Ajusta según tu diseño en Figma.
                height: 400, // Alto deseado para el logo. Ajusta según tu diseño en Figma.
                // Opcional: `fit` controla cómo se ajusta la imagen dentro de su espacio.
                // `BoxFit.contain` asegura que la imagen sea completamente visible sin cortar.
                fit: BoxFit.contain,
              ),
              // `SizedBox` crea un espacio vacío con dimensiones específicas.
              // Aquí, crea un espacio vertical de 20 píxeles entre el logo y cualquier otro elemento.
              const SizedBox(height: 20),
              // Opcional: Puedes añadir un `Text` widget debajo del logo si tienes un eslogan
              // o algún texto que quieras mostrar en la pantalla de splash.
              // Si no lo necesitas, puedes comentar o eliminar este bloque.
              // const Text(
              //   '¡A armar la diversión!', // Reemplaza con tu eslogan o mensaje
              //   textAlign: TextAlign.center, // Centra el texto horizontalmente.
              //   style: TextStyle(
              //     fontSize: 24, // Tamaño de la fuente del texto.
              //     fontWeight: FontWeight.bold, // Peso de la fuente (negrita).
              //     color: Colors.deepPurple, // Color del texto.
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}