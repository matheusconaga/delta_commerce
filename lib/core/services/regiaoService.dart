import 'package:http/http.dart' as http;
import "dart:convert";

class RegiaoService{

  String url = "https://servicodados.ibge.gov.br/api/v1/localidades/estados/";

  Future<List<Map<String, dynamic>>> retornaEstado() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      final List<Map<String, dynamic>> retorno =
      data.map((e) => e as Map<String, dynamic>).toList();

      retorno.sort((a, b) => a['nome'].compareTo(b['nome']));

      print("Estados carregados:");
      for (var estado in retorno) {
        print("${estado['id']} - ${estado['nome']} (${estado['sigla']})");
      }

      return retorno;

    } else {
      throw Exception("Erro ao carregar os estados");
    }
  }

  Future<List<Map<String, dynamic>>> retornaCidadesPorEstado(int idEstado) async {
    final urlCidades = "https://servicodados.ibge.gov.br/api/v1/localidades/estados/$idEstado/municipios";

    final response = await http.get(Uri.parse(urlCidades));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<Map<String, dynamic>> cidades =
      data.map((e) => e as Map<String, dynamic>).toList();

      cidades.sort((a, b) => a['nome'].compareTo(b['nome']));


      print("Cidades do estado ${idEstado}:");
      for (var cidade in cidades) {
        print(cidade['nome']);
      }

      return cidades;
    } else {
      throw Exception("Erro ao carregar as cidades");
    }
  }


}