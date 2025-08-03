import 'package:delta_commerce/core/constants/appTheme.dart';
import 'package:delta_commerce/features/detalhesAnuncio/detalhesAnuncio.dart';
import 'package:flutter/material.dart';
import 'features/home/anuncios.dart';

main(){
  runApp(
    MaterialApp(
title: "delta commerce",
home: DetalhesAnuncio(),
debugShowCheckedModeBanner: false,
theme: Apptheme.theme,
    ),
  );
}