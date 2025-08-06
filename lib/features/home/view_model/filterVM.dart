import 'package:delta_commerce/core/services/regiaoService.dart';
import 'package:flutter/cupertino.dart';

class FilterVM extends ChangeNotifier{

  RegiaoService _regiao = RegiaoService();

  final Map<String, List<String>> categorias = {
    "Moda": ["Roupas Masculinas", "Roupas Femininas", "Calçados", "Acessórios"],
    "Eletrônicos": ["Celulares", "Notebooks", "TVs", "Fones de ouvido"],
    "Beleza": ["Maquiagem", "Cabelos", "Perfumes", "Cuidados com a pele"],
  };

  List<String> selecionadosCategorias = [];

  Map<String, List<String>> categoriasRegiao = {};
  Map<String, String> cidadeParaSigla = {};
  List<String> selecionadosRegiao = [];

  bool carregando = false;

  Future<void> carregarEstadosECidades() async {
    carregando = true;
    notifyListeners();

    final estados = await _regiao.retornaEstado();
    Map<String, List<String>> temp = {};

    for (var estado in estados) {
      int id = estado['id'];
      String nomeEstado = estado['nome'];
      String siglaEstado = estado['sigla'];
      String nomeFormatado = "$nomeEstado - $siglaEstado";

      final cidades = await _regiao.retornaCidadesPorEstado(id);
      List<String> nomesCidades = [];

      for (var cidade in cidades) {
        final nomeCidade = cidade['nome'];
        nomesCidades.add("$nomeCidade - $siglaEstado");
      }

      nomesCidades.sort();
      temp[nomeFormatado] = nomesCidades;
    }

    categoriasRegiao = temp;
    carregando = false;
    notifyListeners();
  }


  void atualizarSelecionados(List<String> novos) {
    selecionadosRegiao = novos;
    notifyListeners();
  }

  void limparFiltros() {
    selecionadosCategorias.clear();
    selecionadosRegiao.clear();
    notifyListeners();
  }

  void removerFiltro(String filtro) {
    if (selecionadosCategorias.contains(filtro)) {
      selecionadosCategorias.remove(filtro);
    }

    if (selecionadosRegiao.contains(filtro)) {
      selecionadosRegiao.remove(filtro);
    }

    notifyListeners();
  }



}