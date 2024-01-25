import 'dart:convert';
import 'package:http/http.dart' as http;

// Link pokeAPI

String basicLinkPokeApi =
    "https://pokeapi.co/api/v2/pokemon?offset=$currentOffset&limit=$limitPokeAPI";
String linkForOnePokemon = "https://pokeapi.co/api/v2/pokemon/";

int limitPokeAPI = 100;
int offsetToAdd = 100;
int currentOffset = 0;

// Définition de la fonction asynchrone qui renvoie une Future<List<dynamic>?>
Future<List<dynamic>?> getByOffset() async {
  try {
    // Envoi d'une requête GET à l'API Poke avec l'URL spécifiée
    final response = await http.get(Uri.parse(basicLinkPokeApi));

    // Vérification si la réponse HTTP a réussi (statut 200)
    if (response.statusCode == 200) {
      // Décodage du corps de la réponse JSON en une map Dart
      Map<String, dynamic> data = json.decode(response.body);

      // Extraction de la liste de résultats (pokémons) de la map
      List<dynamic>? results = data['results'];

      // Retourne la liste des résultats (pokémons)
      return results;
    } else {
      // Si la réponse HTTP n'a pas réussi, lance une exception avec le code de statut
      throw Exception('Échec du chargement des données: $response.statusCode');
    }
  } catch (e) {
    // Gestion des erreurs potentielles lors de l'envoi de la requête ou du traitement de la réponse
    print("Erreur : $e");

    // Retourne une liste vide en cas d'erreur
    return [];
  }
}

// Fonction pour récupérer les données d'un Pokémon en fonction de son ID.
Future<List<dynamic>?> getOnePokemon(int id) async {
  try {
    // Envoi d'une requête GET à l'URL spécifiée pour récupérer les données du Pokémon.
    final response =
        await http.get(Uri.parse(linkForOnePokemon + id.toString()));

    // Vérification du code de statut de la réponse.
    if (response.statusCode == 200) {
      // Si le code de statut est 200, cela signifie que la requête a réussi.
      // Conversion du corps de la réponse (JSON) en une carte (Map) de données.
      Map<String, dynamic> data = json.decode(response.body);

      // Retourne une liste contenant la carte de données (un seul élément dans la liste).
      return [data];
    } else {
      // Si le code de statut n'est pas 200, lance une exception avec le code de statut de la réponse.
      throw Exception('Échec du chargement des données: $response.statusCode');
    }
  } catch (e) {
    // En cas d'erreur pendant la requête, imprime l'erreur et retourne une liste vide.
    print("Erreur : $e");
    return [];
  }
}
