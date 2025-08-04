import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:delta_commerce/core/constants/appText.dart';
import 'package:delta_commerce/core/constants/spacing.dart';
import 'package:delta_commerce/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class Appbutton extends StatefulWidget {
  const Appbutton({
    required this.title,
    this.isImage = false,
    this.isIcon =false,
    super.key
  });

  final String title;
  final bool isImage;
  final bool isIcon;

  @override
  State<Appbutton> createState() => _AppbuttonState();
}

class _AppbuttonState extends State<Appbutton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.wp(context, 90),
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Appcolors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: (){
          print("Botao clicado!");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(widget.isIcon)...[
              Icon(Icons.add, size: 30, color: Appcolors.light,),
              SizedBox(width: Spacing.SpacingP,),
            ],
            if(widget.isImage)...[
        Image.asset("assets/images/whatsapp.png",width: 30,height: 30,),
          SizedBox(width: Spacing.SpacingP,),
        ],
            Text(widget.title,style: Apptext.Button1.copyWith(color: Appcolors.light),),
          ],
        ),
      ),
    );
  }
}
