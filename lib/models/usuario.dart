class Usuario{

   String _idUser = "";
   String _name = "";
   String _email = "";
   String _senha = "";
   String _confirmarSenha = "";
   String _telefone = "";


   String get telefone => _telefone;

  set telefone(String value) {
    _telefone = value;
  }

  String get confirmarSenha => _confirmarSenha;

  set confirmarSenha(String value) {
    _confirmarSenha = value;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get idUser => _idUser;

  set idUser(String value) {
    _idUser = value;
  }


}