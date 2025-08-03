import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:delta_commerce/core/constants/appText.dart';
import 'package:delta_commerce/core/constants/spacing.dart';
import 'package:delta_commerce/core/utils/responsive.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Responsive.hp(context, 15)),
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
                              FiltroItem(),
                              SizedBox(width: Spacing.SpacingM),
                              FiltroItem(),
                              SizedBox(width: Spacing.SpacingM),
                              FiltroItem(),
                              SizedBox(width: Spacing.SpacingM),
                              FiltroItem(),
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
                            print("Filtrando...");
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
              Itemanuncio(),
              SizedBox(height: 16,),
              Itemanuncio(),
              SizedBox(height: 16,),
              Itemanuncio(),
              SizedBox(height: 16,),
              Itemanuncio(),
              SizedBox(height: 16,),
              Itemanuncio(),
              SizedBox(height: 16,),
              Itemanuncio(),
              SizedBox(height: 16,),
              Itemanuncio(),
              SizedBox(height: 16,),
              Itemanuncio(),
              SizedBox(height: 16,),
              Itemanuncio(),
              SizedBox(height: 16,),
            ],
          ),
        ),
      ),
    );
  }
}
