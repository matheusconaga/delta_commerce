import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:delta_commerce/core/constants/spacing.dart';
import 'package:delta_commerce/core/utils/responsive.dart';
import 'package:delta_commerce/features/home/view_model/filterVM.dart';
import 'package:delta_commerce/routes.dart';
import 'package:delta_commerce/widgets/actionButton.dart';
import 'package:delta_commerce/widgets/filtroItem.dart';
import 'package:delta_commerce/widgets/itemAnuncio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final filterVM = Provider.of<FilterVM>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.primary,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
        toolbarHeight: Responsive.hp(context, 8),
      ),

      body: Column(
        children: [
          // FILTROS FORA DA APPBAR
          Container(
            height: 56,
            color: Appcolors.light,
            padding: EdgeInsets.symmetric(horizontal: Spacing.SpacingM),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...filterVM.selecionadosCategorias.map((cat) => Padding(
                          padding: EdgeInsets.only(right: Spacing.SpacingM),
                          child: FiltroItem(
                            title: cat,
                            onRemove: (title) {
                              filterVM.removerFiltro(title);
                            },
                          ),
                        )),
                        ...filterVM.selecionadosRegiao.map((regiao) => Padding(
                          padding: EdgeInsets.only(right: Spacing.SpacingM),
                          child: FiltroItem(
                            title: regiao,
                            onRemove: (title) {
                              filterVM.removerFiltro(title);
                            },
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
                ActionButton(
                  color: Appcolors.accent,
                  icon: Icons.filter_alt,
                  func: () {
                    Navigator.pushNamed(context, Rotas.filter);
                  },
                ),
              ],
            ),
          ),

          Divider(height: 1, color: Colors.grey.shade300),

          // LISTA DE ANÚNCIOS
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 16),
                child: Column(
                  children: List.generate(9, (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ItemAnuncio(),
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
