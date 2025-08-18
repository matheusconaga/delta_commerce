import 'package:delta_commerce/core/constants/appColors.dart';
import 'package:delta_commerce/core/constants/appText.dart';
import 'package:delta_commerce/core/constants/spacing.dart';
import 'package:delta_commerce/core/utils/responsive.dart';
import 'package:delta_commerce/features/detalhesAnuncio/view_model/whatsappVM.dart';
import 'package:delta_commerce/widgets/appButton.dart';
import 'package:delta_commerce/widgets/imageAnuncio.dart';
import 'package:flutter/material.dart';

class DetalhesAnuncio extends StatefulWidget {
  const DetalhesAnuncio({super.key});

  @override
  State<DetalhesAnuncio> createState() => _DetalhesAnuncioState();
}

class _DetalhesAnuncioState extends State<DetalhesAnuncio> {
  
  WhatsappVM whatsappVM = WhatsappVM();
  
  
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Anúncio",
          style: Apptext.Heading2.copyWith(color: Appcolors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: Spacing.SpacingM,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ImageAnuncio(),
                            ImageAnuncio(),
                            ImageAnuncio(),
                            ImageAnuncio(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: Responsive.wp(context, 90),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("31/07/2025 • 08:20", style: Apptext.Body1),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: Spacing.SpacingP),
                          Text(
                            "Notebook ASUS VivoBook Go 15",
                            style: Apptext.Heading2,
                          ),
                          SizedBox(height: Spacing.SpacingP),
                          Text(
                            "R\$ 1.700,59",
                            style: Apptext.Heading1.copyWith(
                              color: Appcolors.accent,
                            ),
                          ),
                          SizedBox(height: Spacing.SpacingP),
                          Text("Parnaíba-PI", style: Apptext.Body1),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        vertical: Spacing.SpacingM,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Text("Descrição:", style: Apptext.Heading3),
                    SizedBox(height: Spacing.SpacingP),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam porttitor metus sed magna interdum, vel porta felis scelerisque. Sed lorem tortor, convallis quis eros ut, convallis faucibus purus. ",
                      style: Apptext.Body1,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(Spacing.SpacingGG),
          child: Appbutton(
            func: (){
              whatsappVM.abrirWhatsApp("5586981451876", "Notebook ASUS VivoBook Go 15");
            },
            isImage: true,
            title: "Chat com Whatsapp",
          ),
        ),
      ),
    );
  }
}
