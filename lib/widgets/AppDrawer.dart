import 'package:flutter/material.dart';
import 'package:delta_commerce/core/constants/appText.dart';
import 'package:delta_commerce/core/constants/appColors.dart';

class AppDrawer extends StatelessWidget {
  final bool isLoggedIn;
  final String? userName;
  final String? userEmail;

  const AppDrawer({
    super.key,
    this.isLoggedIn = false,
    this.userName,
    this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isLoggedIn ? "Olá, $userName!" : "Bem-vindo!",
                    style: Apptext.Heading3,
                  ),
                  Text(
                    isLoggedIn ? userEmail ?? "" : "Faça login para acessar mais opções",
                    style: Apptext.Body2.copyWith(color: Appcolors.grey),
                  ),
                ],
              ),
            ),

            // Sempre aparece
            ListTile(
              leading: const Icon(Icons.home, color: Appcolors.grey,),
              title: Text("Home", style: Apptext.Button2.copyWith(color: Appcolors.grey)),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            // Se NÃO estiver logado
            if (!isLoggedIn) ...[
              ListTile(
                leading: const Icon(Icons.login),
                title: Text("Entrar / Logar", style: Apptext.Button2.copyWith(color: Appcolors.grey)),
                onTap: () {
                  Navigator.pop(context);
                  // Navegar para tela de login
                },
              ),
            ],

            // Se ESTIVER logado
            if (isLoggedIn) ...[
              ListTile(
                leading: const Icon(Icons.post_add, color: Appcolors.grey,),
                title: Text("Meus anúncios", style: Apptext.Button2.copyWith(color: Appcolors.grey)),
                onTap: () {
                  Navigator.pop(context);
                  // Navegar para anúncios do usuário
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite_border),
                title: Text("Favoritos", style: Apptext.Button2.copyWith(color: Appcolors.grey)),
                onTap: () {
                  Navigator.pop(context);
                  // Navegar para favoritos
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Appcolors.danger,),
                title: Text("Deslogar", style: Apptext.Button2.copyWith(color: Appcolors.danger),),
                onTap: () {
                  Navigator.pop(context);
                  // Executar logout
                },
              ),
            ],
          ],
        ),
    );
  }
}
