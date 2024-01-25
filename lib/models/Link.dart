// Druet Jonathan
// Cette classe représente un objet "Lien" avec un nom de lien et une cible associée.
// Elle contient également une méthode pour créer un widget de lien textuel.

// Importation des packages Flutter nécessaires.
import 'package:flutter/material.dart';

// Classe Link, définissant un lien avec un nom et une cible.
class Link {
  final String linkName; // Nom du lien.
  final String target; // Cible associée au lien.

  // Constructeur de la classe.
  Link({required this.linkName, required this.target});

  // Méthode pour créer un widget de lien textuel en fonction de l'URL spécifiée.
  Widget buildLink(String url) {
    return Text(
      url,
      style: const TextStyle(
        color: Colors.blue, // Couleur du texte en bleu.
        decoration: TextDecoration.underline, // Souligné.
      ),
    );
  }
}
