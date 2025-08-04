import 'package:delta_commerce/core/constants/appText.dart';
import 'package:delta_commerce/core/constants/spacing.dart';
import 'package:delta_commerce/widgets/actionButton.dart';
import 'package:delta_commerce/widgets/appButton.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Aqui fica os filtros", style: Apptext.Heading2,),
            ],
          ),
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
              Appbutton(title: "limpar filtros"),
            ],
          ),
        ),
      ),

    );
  }
}
