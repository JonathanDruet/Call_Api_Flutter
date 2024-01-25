// Druet Jonathan
// Ce code Flutter représente un widget de menu avec une animation d'ouverture et de fermeture.
// Le menu affiche une liste de liens, chaque lien redirigeant vers une page spécifique de l'application.

// Importation des packages Flutter nécessaires.
import 'package:flutter/material.dart';
import 'package:projet_test/main.dart';
import 'package:projet_test/models/Link.dart';
import 'package:projet_test/models/pokedexpage.dart';
import 'constants.dart'
    show
        linkList; // Importe une liste de liens depuis un fichier constants.dart.

// Classe MyMenu, un StatefulWidget pour gérer l'état du menu.
class MyMenu extends StatefulWidget {
  const MyMenu({Key? key}) : super(key: key);

  @override
  _MyMenuState createState() => _MyMenuState();
}

// État de MyMenu, gérant la visibilité du menu.
class _MyMenuState extends State<MyMenu> {
  bool menuIsActive =
      false; // Indique si le menu est actuellement ouvert ou fermé.

  // La méthode build définit la structure du widget de menu.
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Conteneur principal du menu.
        Container(
          color: const Color.fromARGB(255, 255, 220, 174),
          child: Column(
            children: [
              // En-tête du menu avec le logo.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      15,
                    ), // Rajoute un padding dans toutes les directions.
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
              // Conteneur animé qui affiche la liste des liens.
              AnimatedContainer(
                duration: const Duration(
                    milliseconds:
                        300), // Durée de l'animation en millisecondes.
                curve: Curves.easeInOut, // Courbe d'animation.
                height: menuIsActive ? 100 : 0, // Hauteur conditionnelle.

                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Boucle sur la liste de liens pour les afficher dans le menu.
                        for (Link link in linkList) ...[
                          GestureDetector(
                            onTap: () {
                              // Gestion de la navigation en fonction de la cible du lien.
                              if (link.target == '/home') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(
                                      title: link.linkName,
                                    ),
                                  ),
                                );
                              } else if (link.target == '/pokedex') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PokedexPage(
                                      title: link.linkName,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(link.linkName),
                                )
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Bouton de bascule du menu.
        Positioned(
          top: 25,
          right: 0,
          child: GestureDetector(
            onTap: () {
              toggleMenu(); // Appelle la fonction pour basculer l'état du menu.
            },
            child: SizedBox(
              width: 30,
              height: 30,
              child: menuIsActive
                  ? const Icon(Icons
                      .close) // Affiche une icône de fermeture si le menu est ouvert.
                  : const Icon(Icons
                      .menu), // Affiche une icône de menu si le menu est fermé.
            ),
          ),
        ),
      ],
    );
  }

  // Fonction pour basculer l'état du menu.
  void toggleMenu() {
    setState(() {
      menuIsActive = !menuIsActive; // Inverse la valeur de menuIsActive
    });
  }
}
