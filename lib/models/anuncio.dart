class Anuncio {
  String _id = "";
  Map<String, String> _categoria = {};
  Map<String, String> _regiao = {};
  String _titulo = "";
  String _preco = "";
  String _descricao = "";
  List<String> _fotos = [];

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'categoria': _categoria,
      'regiao': _regiao,
      'titulo': _titulo,
      'preco': _preco,
      'descricao': _descricao,
      'fotos': _fotos,
    };
  }

  Anuncio.fromMap(Map<String, dynamic> map) {
    _id = map['id'] ?? "";
    _categoria = Map<String, String>.from(map['categoria'] ?? {});
    _regiao = Map<String, String>.from(map['regiao'] ?? {});
    _titulo = map['titulo'] ?? "";
    _preco = map['preco'] ?? "";
    _descricao = map['descricao'] ?? "";
    _fotos = List<String>.from(map['fotos'] ?? []);
  }

  Anuncio();

  String get id => _id;
  set id(String value) => _id = value;

  Map<String, String> get categoria => _categoria;
  set categoria(Map<String, String> value) => _categoria = value;

  Map<String, String> get regiao => _regiao;
  set regiao(Map<String, String> value) => _regiao = value;

  String get titulo => _titulo;
  set titulo(String value) => _titulo = value;

  String get preco => _preco;
  set preco(String value) => _preco = value;

  String get descricao => _descricao;
  set descricao(String value) => _descricao = value;

  List<String> get fotos => _fotos;
  set fotos(List<String> value) => _fotos = value;
}
