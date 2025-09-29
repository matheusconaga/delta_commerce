import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:delta_commerce/core/constants/spacing.dart';
import 'package:delta_commerce/core/utils/responsive.dart';
import 'package:delta_commerce/features/home/view_model/filterVM.dart';
import 'package:delta_commerce/routes.dart';
import 'package:delta_commerce/widgets/AppDrawer.dart';
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
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // <-- chave


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filterVM = Provider.of<FilterVM>(context);

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: AppDrawer(
        userName: "Matheus",
        userEmail: "matheus@gmail.com",
      ),
      appBar : AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Appcolors.primary,
        title: Image.asset("assets/images/logo_delta.png", width: 50, height: 50),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => print("Pesquisar"),
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
          ),
        ],
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
              controller: _scrollController,
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
