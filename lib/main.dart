import 'package:delta_commerce/core/constants/appTheme.dart';
import 'package:delta_commerce/features/detalhesAnuncio/detalhesAnuncio.dart';
import 'package:delta_commerce/routes.dart';
import 'package:delta_commerce/widgets/filter.dart';
import 'package:flutter/material.dart';
import 'features/home/anuncios.dart';

main() {
  runApp(
    MaterialApp(
      title: "delta commerce",
      // home: DetalhesAnuncio(),
      // home: Anuncios(),
      home: Filter(),
      debugShowCheckedModeBanner: false,
      theme: Apptheme.theme,
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  );
}
