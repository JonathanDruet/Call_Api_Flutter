// Druet Jonathan
// Ce code Flutter représente une application simple avec une page d'accueil contenant un menu.
// Le menu est défini dans un fichier séparé appelé myMenu.dart.

// Importation des packages Flutter nécessaires.
import 'package:flutter/material.dart';
import 'package:projet_test/myMenu.dart';

// Fonction principale pour lancer l'application Flutter.
void main() {
  runApp(const MyApp());
}

// Classe principale de l'application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // La méthode build définit la structure globale de l'application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Homepage',
      home: MyHomePage(title: 'Accueil'),
    );
  }
}

// Page d'accueil de l'application.
class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  // La méthode build définit la structure de la page d'accueil.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [MyMenu()], // Affiche le menu défini dans MyMenu.
      ),
    );
  }
}
