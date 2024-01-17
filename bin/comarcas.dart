import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

void main(List<String> args) {

   if (args.isEmpty) {
    print(
        "Error: No se han introducido los parámetros <comarques|infocomarca> i <provincia|comarca>");
    exit(1);
  }

  var suborden = args[0];
  var parametro = args.sublist(1).join(' ');

  switch (suborden) {
    case 'comarques':
      getComarcas(parametro);
      break;
    case 'infocomarca':
      getInfoComarca(parametro);
      break;
    case 'totescomarques':
      getAllComarcas();
      break;
    case 'totesprovincies':
      getAllProvincias();
    default:
      print(
          'Error: Parámetro Suborden no reconocido. Use "comarques" o "infocomarca".');
      exit(1);
  }
}

class Comarca {
  String comarca;
  String? capital;
  String? poblacio;
  String? img;
  String? desc;
  double? latitud;
  double? longitud;

  Comarca(this.comarca,
      {this.capital,
      this.poblacio,
      this.img,
      this.desc,
      this.latitud,
      this.longitud});

  Comarca.fromJSON(Map<String, dynamic> json)
      : comarca = json['comarca'],
        capital = json['capital'],
        poblacio = json['poblacio '],
        img = json['img'],
        desc = json['desc'],
        latitud = json['latitud'],
        longitud = json['longitud'];

  @override
  String toString() {
    return '''
    nombre: $comarca
    capital: ${capital ?? 'N/A'}
    población: ${poblacio ?? 'N/A'}
    imagen: ${img ?? 'N/A'}
    descripción: ${desc ?? 'N/A'}
    coordenadas: (${latitud ?? 'N/A'}, ${longitud ?? 'N/A'})
    ''';
  }
}

Future<void> getComarcas(String provincia) async {
  var response = await http.get(Uri.parse(
      'https://node-comarques-rest-server-production.up.railway.app/api/comarques/$provincia'));

  if (response.statusCode == 200) {
    final List<dynamic> comarcas = json.decode(response.body);
    for (var comarca in comarcas) {
      print(comarca.toString());
    }
  } else if (response.statusCode == 404) {
    print('Error: No se ha encontrado la provincia ${provincia} ');
    print("Introduce el comando: 'dart run comarcas totesprovincies' para mostrar todas las provincias.");

  } else {
    print('Error: Código de respuesta: ${response.statusCode}');
  }
}

Future<void> getInfoComarca(String comarca) async {
  var response = await http.get(Uri.parse(
      'https://node-comarques-rest-server-production.up.railway.app/api/comarques/infoComarca/$comarca'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final comarcaInfo = Comarca.fromJSON(data);
    print(comarcaInfo);
  } else if (response.statusCode == 404) {
    print('Error: No se ha encontrado la comarca ${comarca} ');
    print("Introduce el comando: 'dart run comarcas totescomarques' para mostrar todas las comarcas.");
  } else {
    print('Error: Código de respuesta: ${response.statusCode}');
  }
}

Future<void> getAllComarcas() async {
  var responseCS = await http.get(Uri.parse(
      'https://node-comarques-rest-server-production.up.railway.app/api/comarques/Castelló'));

  var responseV = await http.get(Uri.parse(
      'https://node-comarques-rest-server-production.up.railway.app/api/comarques/València'));

  var responseA = await http.get(Uri.parse(
      'https://node-comarques-rest-server-production.up.railway.app/api/comarques/Alacant'));

  if (responseCS.statusCode == 200) {
    final List<dynamic> comarcasCS = json.decode(responseCS.body);
    for (var comarca in comarcasCS) {
      print(comarca.toString());
    }
  } else {
    print('Error: Código de respuesta: ${responseCS.statusCode}');
  }

  if (responseV.statusCode == 200) {
    final List<dynamic> comarcasV = json.decode(responseV.body);
    for (var comarca in comarcasV) {
      print(comarca.toString());
    }
  } else {
    print('Error: Código de respuesta: ${responseV.statusCode}');
  }

  if (responseA.statusCode == 200) {
    final List<dynamic> comarcasA = json.decode(responseA.body);
    for (var comarca in comarcasA) {
      print(comarca.toString());
    }
  } else {
    print('Error: Código de respuesta: ${responseA.statusCode}');
  }

}

Future<void> getAllProvincias() async{
  print('Castelló');
  print('València');
  print('Alacant');
}
