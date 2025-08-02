import 'package:delta_commerce/core/constants/appTheme.dart';
import 'package:flutter/material.dart';
import 'features/home/anuncios.dart';

main(){
  runApp(
    MaterialApp(
title: "delta commerce",
home: Anuncios(),
debugShowCheckedModeBanner: false,
theme: Apptheme.theme,
    ),
  );
}