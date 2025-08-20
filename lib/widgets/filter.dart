import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:delta_commerce/core/constants/spacing.dart';
import 'package:delta_commerce/features/home/view_model/filterVM.dart';
import 'package:delta_commerce/routes.dart';
import 'package:delta_commerce/widgets/actionButton.dart';
import 'package:delta_commerce/widgets/appButton.dart';
import 'package:delta_commerce/widgets/dropFilter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  @override
  void initState() {
    super.initState();
    Provider.of<FilterVM>(context, listen: false).carregarEstadosECidades();
  }

  @override
  Widget build(BuildContext context) {

    final filterVM = Provider.of<FilterVM>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Filtros"),),
        actions: [
          ActionButton(
              icon: Icons.close_rounded,
              func: (){
                Navigator.pop(context);
              }
          ),
        ],
      ),
      body: SingleChildScrollView(
        primary: true,
          child: Column(
            children: [
              SizedBox(height: Spacing.SpacingG,),
             Center(
               child:  DropFilter(
                 titulo: "Categorias",
                 filtros: filterVM.categorias,
                 selecionados: filterVM.selecionadosCategorias,
                 onChanged: filterVM.atualizarSelecionadosCategorias,

               ),
             ),
              SizedBox(height: Spacing.SpacingP,),
              Center(
                child:  DropFilter(
                  titulo: "Região",
                  filtros: filterVM.categoriasRegiao,
                  selecionados: filterVM.selecionadosRegiao,
                  onChanged: (novosSelecionados) {
                    filterVM.atualizarSelecionados(novosSelecionados);
                  },
                ),
              ),
            ],
          ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Spacing.SpacingG),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Appbutton(title: "Aplicar filtros", func: (){
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Rotas.home,
                      (route) => false,
                  arguments: {
                    'regioes': filterVM.selecionadosRegiao,
                    'categorias': filterVM.selecionadosCategorias,
                  },
                );

              },),
              SizedBox(height: Spacing.SpacingM),
              Appbutton(
                title: "Limpar filtros",
                func: () {
                  filterVM.limparFiltros();
                },
                sec: true,
              ),

            ],
          ),
        ),
      ),

    );
  }
}
