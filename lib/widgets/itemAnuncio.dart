import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:delta_commerce/core/constants/appText.dart';
import 'package:delta_commerce/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class Itemanuncio extends StatefulWidget {
  const Itemanuncio({super.key});

  @override
  State<Itemanuncio> createState() => _ItemanuncioState();
}

class _ItemanuncioState extends State<Itemanuncio> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("Item clicado!");
      },
      child: Container(
      width: Responsive.wp(context, 90),
      height: Responsive.hp(context, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Appcolors.light,
        border: Border.all(color: Appcolors.white, width: 1),
        boxShadow: [
          BoxShadow(
            color: Appcolors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
    child: Padding(
  padding: const EdgeInsets.all(12),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset(
        "assets/images/logo_delta.png",
        width: Responsive.hp(context, 16),
        height: Responsive.hp(context, 16),
        fit: BoxFit.cover,
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Notebook ASUS VivoBook Go 15", style: Apptext.Heading3),
            Text("R\$ 1.700,59", style: Apptext.Heading3.copyWith(color: Appcolors.grey)),
            Text("Parnaíba-PI", style: Apptext.Body1.copyWith(color: Appcolors.grey)),
            Text("31/07/2025 • 08:20", style: Apptext.Body1.copyWith(color: Appcolors.grey)),
          ],
        ),
      ),
      Column(
children: [
  GestureDetector(
          onTap: (){
            print("favorites");
          },
          child: Icon(
            Icons.bookmark_outline_rounded,
            size: 35,
            color: Appcolors.accent,
            ),
        ),
],
      ),
    ],
  ),
),
    ),
    );
  }
}