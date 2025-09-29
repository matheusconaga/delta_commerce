import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:delta_commerce/core/constants/appText.dart';
import 'package:delta_commerce/core/constants/spacing.dart';
import 'package:delta_commerce/core/utils/responsive.dart';
import 'package:delta_commerce/core/utils/validators.dart';
import 'package:delta_commerce/widgets/appButton.dart';
import 'package:delta_commerce/widgets/appLink.dart';
import 'package:delta_commerce/widgets/formInput.dart';
import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: Responsive.width(context) * 0.8,
              color: Appcolors.white,
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
                    child: Text(
                      "Recuperar Conta",
                      style:
                      Apptext.Heading1.copyWith(color: Appcolors.primary),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: Spacing.SpacingPP),
                    child: Text(
                      "Insira o e-mail e enviaremos um link para recuperar sua conta",
                      textAlign: TextAlign.center,
                      style: Apptext.Body1.copyWith(color: Appcolors.grey),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: Spacing.SpacingM, bottom: Spacing.SpacingG),
                          child: FormInput(
                            icon: const Icon(Icons.email),
                            title: "E-mail",
                            controller: _emailController,
                            validator: Validators.validarEmail,
                          ),
                        ),
                        Appbutton(
                          title: "Enviar link de recuperação",
                          func: (){
                          },
                          // onPressed: () {
                          //   if (_formKey.currentState!.validate()){
                          //     _forgotPwd(context);
                          //   }
                          // },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: Spacing.SpacingXG),
                          child: AppLink(
                            title: "Voltar pro Login",
                            func: () {
                              Navigator.pushReplacementNamed(context, "/login");
                            },
                          ),
                        ),
                      ],
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
