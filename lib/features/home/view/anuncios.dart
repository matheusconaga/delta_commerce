import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:delta_commerce/core/constants/spacing.dart';
import 'package:delta_commerce/core/utils/responsive.dart';
import 'package:delta_commerce/routes.dart';
import 'package:delta_commerce/widgets/actionButton.dart';
import 'package:delta_commerce/widgets/filtroItem.dart';
import 'package:delta_commerce/widgets/itemAnuncio.dart';
import 'package:flutter/material.dart';

class Anuncios extends StatefulWidget {
  const Anuncios({super.key});

  @override
  State<Anuncios> createState() => _AnunciosState();
}

class _AnunciosState extends State<Anuncios> {

  List<String> regioesSelecionadas = [];
  List<String> categoriasSelecionadas = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};
    setState(() {
      regioesSelecionadas = args['regioes'] != null ? List<String>.from(args['regioes']) : [];
      categoriasSelecionadas = args['categorias'] != null ? List<String>.from(args['categorias']) : [];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Responsive.hp(context, 20)),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Parte de cima: logo ou título
              Padding(
                padding: EdgeInsets.only(top: 40, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/logo_delta.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    Row(
                      children: [
                        ActionButton(
                          func: () {
                            print("nada!");
                          },
                          icon: Icons.search,
                        ),
                        SizedBox(width: Spacing.SpacingM),
                        ActionButton(
                          func: () {
                            print("drawer");
                          },
                          icon: Icons.menu,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Parte de baixo: filtro
              Padding(
                padding: EdgeInsets.only(top: Spacing.SpacingP),
                child: Container(
                  height: 56,
                  color: Appcolors.light,
                  child: Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(left: Spacing.SpacingM),
                          child: Row(
                            children: [
                              ...categoriasSelecionadas.map((cat) => Padding(
                                padding: EdgeInsets.only(right: Spacing.SpacingM),
                                child: FiltroItem(title: cat,onRemove: (cat){
                                  setState(() {
                                    categoriasSelecionadas.remove(cat);
                                  });
                                },),
                              )),

                              ...regioesSelecionadas.map((regiao) => Padding(
                                padding: EdgeInsets.only(right: Spacing.SpacingM),
                                child: FiltroItem(title: regiao, onRemove: (regiao){
                                  setState(() {
                                    regioesSelecionadas.remove(regiao);
                                  });
                                },),
                              )),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(right: Spacing.SpacingM),
                        child: ActionButton(
                          color: Appcolors.accent,
                          icon: Icons.filter_alt_outlined,
                          func: () {
                            Navigator.pushNamed(context, Rotas.filter);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey.shade300,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 16,),
              ItemAnuncio(),
              SizedBox(height: 16,),
              ItemAnuncio(),
              SizedBox(height: 16,),
              ItemAnuncio(),
              SizedBox(height: 16,),
              ItemAnuncio(),
              SizedBox(height: 16,),
              ItemAnuncio(),
              SizedBox(height: 16,),
              ItemAnuncio(),
              SizedBox(height: 16,),
              ItemAnuncio(),
              SizedBox(height: 16,),
              ItemAnuncio(),
              SizedBox(height: 16,),
              ItemAnuncio(),
              SizedBox(height: 16,),
            ],
          ),
        ),
      ),
    );
  }
}
