import 'dart:convert';

import 'package:crud_http/domain/models/pets.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PeticionesPets {
  static Future<List<Pets>> getListPets() async {
    var url = Uri.parse(
        "https://desarolloweb2021a.000webhostapp.com/APINOTES/listaPets.php");

    final response = await http.get(url);

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista, response.body);
  }

  static List<Pets> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    //print(pasar[0]['mensaje']);
    return pasar.map<Pets>((json) => Pets.desdeJson(json)).toList();
  }
}
