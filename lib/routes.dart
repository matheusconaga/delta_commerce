import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:delta_commerce/core/constants/appText.dart';
import 'package:delta_commerce/core/constants/spacing.dart';
import 'package:delta_commerce/features/auth/view/cadastro.dart';
import 'package:delta_commerce/features/auth/view/forgot.dart';
import 'package:delta_commerce/features/auth/view/login.dart';
import 'package:delta_commerce/features/detalhesAnuncio/detalhesAnuncio.dart';
import 'package:delta_commerce/features/home/view/anuncios.dart';
import 'package:delta_commerce/widgets/filter.dart';
import 'package:flutter/material.dart';

class RouteGenerator{

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case Rotas.home:
        return MaterialPageRoute(builder: (_) => Anuncios());
      case Rotas.filter:
        return MaterialPageRoute(builder: (_) => Filter());
      case Rotas.login:
        return MaterialPageRoute(builder: (_) => Login());
      case Rotas.cadastro:
        return MaterialPageRoute(builder: (_) => Cadastro());
      case Rotas.forgot:
        return MaterialPageRoute(builder: (_) => Forgot());
      case Rotas.detalhes:
        return MaterialPageRoute(builder: (_) => DetalhesAnuncio());
      default:
        return _erroRota();
    }
  }

  static Route<dynamic> _erroRota(){
    return MaterialPageRoute(builder: (context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Pagina não encontrada"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Pagina não encontrada!", style: Apptext.Heading2,),
              SizedBox(height: Spacing.SpacingM,),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed((context), Rotas.home);
                },
                child: Text("Voltar para tela de anúncios!", style: Apptext.Button1.copyWith(color: Appcolors.primary),),
              ),
            ],
          ),
        ),
      );
    });

}

}
class Rotas {
  static const String home = '/anuncios';
  static const String filter = '/anuncios/filter';
  static const String login = '/login';
  static const String cadastro = '/cadastro';
  static const String forgot = '/forgot';

  static const String detalhes = '/detalhes';



}