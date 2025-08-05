import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:delta_commerce/core/constants/spacing.dart';
import 'package:delta_commerce/features/home/view_model/filterVM.dart';
import 'package:delta_commerce/widgets/actionButton.dart';
import 'package:delta_commerce/widgets/appButton.dart';
import 'package:delta_commerce/widgets/dropFilter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {

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
          child: Column(
            children: [
              SizedBox(height: Spacing.SpacingG,),
              DropFilter(
                titulo: "Categorias",
                filtros: filterVM.categorias,
                selecionados: filterVM.selecionadosCategorias,
                onChanged: (novosSelecionados) {
                  setState(() {
                    filterVM.selecionadosCategorias = novosSelecionados;
                  });
                  print("Selecionados: ${filterVM.selecionadosCategorias}");
                },
              ),
              SizedBox(height: Spacing.SpacingP,),
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
              Appbutton(title: "Aplicar filtros"),
              SizedBox(height: Spacing.SpacingM),
              Appbutton(title: "Limpar filtros", sec: true,),
            ],
          ),
        ),
      ),

    );
  }
}
