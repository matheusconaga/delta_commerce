import 'package:delta_commerce/core/constants/spacing.dart';
import 'package:delta_commerce/core/utils/responsive.dart';
import 'package:delta_commerce/core/utils/validators.dart';
import 'package:delta_commerce/widgets/appButton.dart';
import 'package:delta_commerce/widgets/appLink.dart';
import 'package:delta_commerce/widgets/formInput.dart';
import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:delta_commerce/core/constants/appText.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: Responsive.wp(context, 80),
              // color: Appcolors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo_delta.png",
                    width: 100,
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: Spacing.SpacingP),
                    child: Column(
                      children: [
                        Text(
                          "Bem-vindo ao Delta",
                          style: Apptext.Heading1.copyWith(color: Appcolors.primary),
                        ),
                        Text(
                          "Commerce",
                          style: Apptext.Heading1.copyWith(color: Appcolors.accent),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: Spacing.SpacingPP),
                    child: Text(
                      "Insira o e-mail e a senha para continuar",
                      style: Apptext.Body1.copyWith(color: Appcolors.grey),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: Spacing.SpacingG),
                          child: FormInput(
                            icon: const Icon(Icons.email),
                            title: "E-mail",
                            controller: _emailController,
                            validator: Validators.validarEmail,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: Spacing.SpacingG),
                          child: FormInput(
                            icon: const Icon(Icons.lock),
                            title: "Senha",
                            obscure: true,
                            controller: _passwordController,
                            validator: Validators.validarSenha,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: Spacing.SpacingGG),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: AppLink(
                              title: "Esqueceu a senha?",
                              func: () {
                                Navigator.pushReplacementNamed(context, "/forgot");
                              },
                            ),
                          ),
                        ),
                        Appbutton(
                          title: "Login",
                          func: () {
                            // if (_formKey.currentState!.validate()){
                            //   _logarUsuario(context);
                            // }
                          },
                        ),
                      ],
                    ) ,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: Spacing.SpacingXG),
                    child: Text(
                      "Ainda não possui conta?",
                      style: Apptext.Body1.copyWith(color: Appcolors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: Spacing.SpacingPP),
                    child: AppLink(
                      title: "Criar nova conta",
                      func: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
