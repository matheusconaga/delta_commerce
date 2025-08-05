import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({
    required this.icon,
    required this.func,
    this.color,
    super.key
    });

    final IconData icon;
    final Function() func;
    final Color? color;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        widget.icon,
        size: 35,
        color: widget.color != null ? widget.color : Appcolors.white,
      ),
      onTap:widget.func,
    );
  }
}