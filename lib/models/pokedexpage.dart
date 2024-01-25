// Druet Jonathan
// Cette classe représente une page du Pokédex dans l'application. Elle affiche une liste de Pokémon avec quelques détails.

// Importation des packages nécessaires.
import 'package:flutter/material.dart';
import 'package:projet_test/models/apiCall.dart'; // Importe les fonctions pour les appels à l'API.
import 'package:projet_test/myMenu.dart'; // Importe le widget du menu personnalisé.

// Classe PokedexPage, un StatelessWidget pour afficher la page du Pokédex.
class PokedexPage extends StatelessWidget {
  final String title;

  // Constructeur de la classe.
  PokedexPage({super.key, required this.title});

  // Méthode build, qui définit la structure de la page du Pokédex.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MyMenu(), // Affiche le menu personnalisé.
          Expanded(
            child: FutureBuilder<List<dynamic>?>(
              future:
                  getByOffset(), // Appel à la fonction pour récupérer une liste de Pokémon.
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Affiche un indicateur de chargement si les données sont en cours de chargement.
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Affiche un message d'erreur s'il y a une erreur lors du chargement des données.
                  return Text('Erreur: ${snapshot.error}');
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  // Si les données sont disponibles et non vides, affiche la liste de Pokémon.
                  List<dynamic>? pokemons = snapshot.data;
                  return Container(
                    child: Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: List.generate(pokemons!.length, (index) {
                        return Container(
                          width: 250,
                          height: 150,
                          child: Card(
                            elevation: 5,
                            child: Column(
                              children: [
                                Text(pokemons[index]['name']),
                                FutureBuilder(
                                  future: getOnePokemon(index +
                                      1), // Appel à la fonction pour récupérer les détails d'un Pokémon.
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      // Affiche un indicateur de chargement si les détails sont en cours de chargement.
                                      return CircularProgressIndicator();
                                    } else if (snapshot.hasError) {
                                      // Affiche un message d'erreur s'il y a une erreur lors du chargement des détails.
                                      return Text('Erreur: ${snapshot.error}');
                                    } else if (snapshot.hasData &&
                                        snapshot.data!.isNotEmpty) {
                                      // Si les détails sont disponibles et non vides, affiche les informations du Pokémon.
                                      List<dynamic>? details = snapshot.data;
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              'Type: ${details![0]['types'][0]['type']['name']}'),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.network(details![0]
                                                  ['sprites']['front_default']),
                                              Image.network(details![0]
                                                  ['sprites']['back_default']),
                                            ],
                                          ),
                                        ],
                                      );
                                    } else {
                                      // Affiche un message si aucune donnée n'est disponible pour les détails.
                                      return const Text(
                                          'Aucune donnée disponible');
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                } else {
                  // Affiche un message si aucune donnée n'est disponible.
                  return const Text('Aucune donnée disponible');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
