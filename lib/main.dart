import 'package:delta_commerce/core/constants/appTheme.dart';
import 'package:delta_commerce/features/auth/view/cadastro.dart';
import 'package:delta_commerce/features/auth/view/login.dart';
import 'package:delta_commerce/features/detalhesAnuncio/detalhesAnuncio.dart';
import 'package:delta_commerce/features/home/view_model/filterVM.dart';
import 'package:delta_commerce/routes.dart';
import 'package:delta_commerce/widgets/filter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/home/view/anuncios.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FilterVM()),
      ],
      child: MaterialApp(
        title: "delta commerce",
        // home: DetalhesAnuncio(),
        home: Cadastro(),
        // home: Filter(),
        debugShowCheckedModeBanner: false,
        theme: Apptheme.theme,

        initialRoute: "/",
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    ),

  );
}
