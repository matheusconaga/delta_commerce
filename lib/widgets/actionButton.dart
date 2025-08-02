import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:delta_commerce/core/constants/spacing.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({
    required this.icon,
    required this.func,
    super.key
    });

    final IconData icon;
    final Function() func;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(right: Spacing.SpacingM),
      child: GestureDetector(
        child: Icon(
          widget.icon,
          size: 35,
          color: Appcolors.white,
          ),
        onTap:widget.func,
      ),
    );
  }
}