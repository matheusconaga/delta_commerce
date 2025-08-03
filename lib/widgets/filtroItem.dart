import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:delta_commerce/core/constants/appText.dart';
import 'package:delta_commerce/core/constants/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiltroItem extends StatefulWidget {
  const FiltroItem({super.key});

  @override
  State<FiltroItem> createState() => _FiltroItemState();
}

class _FiltroItemState extends State<FiltroItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Appcolors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(Spacing.SpacingPP),
        child: Row(
          children: [
            Text(
              "Notebook",
              style: Apptext.Body1.copyWith(color: Appcolors.accent),
            ),
            SizedBox(width: Spacing.SpacingP),
            GestureDetector(
              onTap: () {
                print("Removendo item");
              },
              child: Icon(Icons.remove_circle_outline, color: Appcolors.danger),
            ),
          ],
        ),
      ),
    );
  }
}
