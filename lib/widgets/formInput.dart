import 'package:delta_commerce/core/utils/responsive.dart';
import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:delta_commerce/core/constants/appText.dart';
import 'package:flutter/material.dart';


class FormInput extends StatefulWidget {
  const FormInput({
    required this.controller,
    required this.title,
    this.obscure = false,
    this.icon,
    this.type = TextInputType.text,
    this.maxLines = 1,
    this.validator,
    this.onSaved,
    super.key,
  });

  final TextEditingController controller;
  final String title;
  final bool obscure;
  final Icon? icon;
  final TextInputType type;
  final int? maxLines;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {

  bool _obscure = true;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscure;
    _controller = widget.controller;
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.wp(context, 80),
      child: TextFormField(
        validator: widget.validator,
        obscureText: _obscure,
        controller: _controller,
        keyboardType: widget.type,
        maxLines: widget.obscure ? 1 : widget.maxLines,
        onSaved: widget.onSaved,
        style: Apptext.Body1.copyWith(color: Appcolors.grey),
        decoration: InputDecoration(
          labelText: widget.title,
          labelStyle: Apptext.Body1,
          floatingLabelStyle: Apptext.Body1.copyWith(
            color: Appcolors.primary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          errorStyle: Apptext.Body2.copyWith(color: Appcolors.danger),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: widget.icon != null
              ? Icon(
            widget.icon!.icon,
            color: Appcolors.grey,
          )
              : null,
          hintStyle: const TextStyle(color: Appcolors.grey),
          contentPadding: const EdgeInsets.fromLTRB(12,8,12,8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Appcolors.primary,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Appcolors.grey,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Appcolors.danger,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Appcolors.danger,
              width: 2,
            ),
          ),
          suffixIcon: widget.obscure
              ? IconButton(
            onPressed: () {
              setState(() {
                _obscure = !_obscure;
              });
            },
            icon: Icon(
              _obscure ? Icons.visibility_off : Icons.visibility,
              color: Appcolors.primary,
            ),
          ) : null,
        ),
      ),
    );
  }
}