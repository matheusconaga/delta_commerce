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

  getEstados(){

    var estados = _regiao.retornaEstado();
    print(estados);

  }



}