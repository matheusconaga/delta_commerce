import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:delta_commerce/core/constants/appText.dart';
import 'package:delta_commerce/core/constants/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FiltroItem extends StatefulWidget {
  const FiltroItem({
    required this.title,
    required this.onRemove,
    super.key,
  });

  final String title;
  final void Function(String title) onRemove;


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
              widget.title,
              style: Apptext.Body1.copyWith(color: Appcolors.accent),
            ),
            SizedBox(width: Spacing.SpacingP),
            GestureDetector(
              onTap: () {
                widget.onRemove(widget.title);
              },
              child: Icon(Icons.remove_circle_outline, color: Appcolors.danger),
            ),
          ],
        ),
      ),
    );
  }
}
