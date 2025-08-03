import 'package:delta_commerce/core/constants/appText.dart';
import 'package:delta_commerce/widgets/actionButton.dart';
import 'package:delta_commerce/widgets/itemAnuncio.dart';
import 'package:flutter/material.dart';

class Anuncios extends StatefulWidget {
  const Anuncios({super.key});

  @override
  State<Anuncios> createState() => _AnunciosState();
}

class _AnunciosState extends State<Anuncios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Container(
    width: 50,
    height: 50,
    child: Image.asset("assets/images/logo_delta.png", fit: BoxFit.cover,),
  ),
  actions: [
    ActionButton(
      func: (){
        print("nada!");
      },
      icon: Icons.search,
    ),
    ActionButton(
      func: (){
        print("drawer");
      },
      icon: Icons.menu,
    ),
  ],
),
body: Center(
  child: SingleChildScrollView(
child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(height: 16,),
      Itemanuncio(),
      SizedBox(height: 12,),
      Itemanuncio(),
      SizedBox(height: 12,),
      Itemanuncio(),
    SizedBox(height: 12,),
      Itemanuncio(),
      SizedBox(height: 12,),
      Itemanuncio(),
      SizedBox(height: 12,),
      Itemanuncio(),
      SizedBox(height: 12,),
      Itemanuncio(),
    ],
  ),
  ),
),
    );
  }
}