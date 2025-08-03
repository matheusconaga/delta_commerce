import 'package:delta_commerce/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class ImageAnuncio extends StatefulWidget {
  const ImageAnuncio({super.key});

  @override
  State<ImageAnuncio> createState() => _ImageAnuncioState();
}

class _ImageAnuncioState extends State<ImageAnuncio> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.wp(context, 60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        "assets/images/notebook.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
