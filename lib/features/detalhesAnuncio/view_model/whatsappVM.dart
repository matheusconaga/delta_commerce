import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsappVM extends ChangeNotifier{

  void abrirWhatsApp(String phone, String productTitle) async {
    String message = Uri.encodeComponent("Olá! Tenho interesse no produto $productTitle.");
    final url = Uri.parse("https://wa.me/$phone?text=$message");

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Não foi possível abrir o WhatsApp';
    }

    notifyListeners();

  }


}