import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/realtime_data_page.dart';
import 'pages/additional_page.dart';
import 'pages/about_page.dart';

void main() {
  runApp(EggIncubatorApp());
}

class EggIncubatorApp extends StatelessWidget {
  const EggIncubatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Egg Incubator Monitor',
      theme: ThemeData(
        // Define brightness (light/dark mode)
        brightness: Brightness.light, // You can change this to Brightness.dark for dark mode

        // Use Material 3
        useMaterial3: true,

        // Color scheme with a seed color for consistency
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),

        // Customize the text styles
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black87, fontSize: 18),
          titleLarge: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),

        // AppBar customization (you can customize colors, icons, and more)
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepOrangeAccent,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),

        // Button theme for consistent button styling
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrangeAccent, // Button color
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // Define a default font family if you have custom fonts
        fontFamily: 'Roboto', // Use the custom font if you have added it
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/realtime': (context) => RealtimeDataPage(),
        '/additional': (context) => AdditionalPage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
