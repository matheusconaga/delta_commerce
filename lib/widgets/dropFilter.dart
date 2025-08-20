import 'package:flutter/material.dart';
import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:delta_commerce/core/constants/appText.dart';
import 'package:delta_commerce/core/constants/spacing.dart';
import 'package:delta_commerce/core/utils/responsive.dart';

class DropFilter extends StatefulWidget {
  final String titulo;
  final Map<String, List<String>> filtros;
  final List<String> selecionados;
  final Function(List<String>) onChanged;

  const DropFilter({
    super.key,
    required this.titulo,
    required this.filtros,
    required this.selecionados,
    required this.onChanged,
  });

  @override
  State<DropFilter> createState() => _DropFilterState();
}

class _DropFilterState extends State<DropFilter> {
  bool expandido = false;

  void _atualizarSelecionados(String item, bool checked) {
    final novosSelecionados = List<String>.from(widget.selecionados);
    if (checked) {
      novosSelecionados.add(item);
    } else {
      novosSelecionados.remove(item);
    }
    widget.onChanged(novosSelecionados);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Appcolors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => setState(() => expandido = !expandido),
            child: Container(
              padding: EdgeInsets.all(Spacing.SpacingM),
              decoration: BoxDecoration(
                border: Border(
                  bottom: expandido
                      ? BorderSide(color: Appcolors.grey)
                      : BorderSide.none,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.selecionados.isEmpty
                          ? widget.titulo
                          : "${widget.titulo} (${widget.selecionados.length} selecionadas)",
                      style: Apptext.Button1.copyWith(color: Appcolors.dark),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    expandido
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: Appcolors.grey,
                  )
                ],
              ),
            ),
          ),

          if (expandido)
            Container(
              constraints: BoxConstraints(
                maxHeight: Responsive.hp(context, 100),
              ),
              child: Scrollbar(
                thumbVisibility: true,
                child: ListView(
                  shrinkWrap: true,
                  children: widget.filtros.entries.map((entry) {
                    final categoria = entry.key;
                    final subcategorias = entry.value;

                    return ExpansionTile(
                      tilePadding: EdgeInsets.symmetric(horizontal: Spacing.SpacingM),
                      title: Text(
                        categoria,
                        style: Apptext.Button2.copyWith(color: Appcolors.grey),
                      ),
                      children: subcategorias.map((sub) {
                        final selecionado = widget.selecionados.contains(sub);
                        return CheckboxListTile(
                          value: selecionado,
                          onChanged: (bool? checked) {
                            if (checked != null) {
                              _atualizarSelecionados(sub, checked);
                            }
                          },
                          title: Text(sub),
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.symmetric(horizontal: Spacing.SpacingM),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
