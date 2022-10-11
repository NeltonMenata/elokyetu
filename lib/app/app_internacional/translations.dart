import 'package:get/get.dart';

class Traduction extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "pt_PT": {
          "ola mundo": "Olá Mundo",
          "cliente": "Cliente",
          "bom dia": "bom dia",
          "saúde": "saúde",
          "gastronomia": "gastronomia",
          "arte": "arte",
          "vida e estilo": "vida e estilo",
          "perfil do usuario":
              "perfil do usuario", // não esta a traduzir, n sei o porque

          // welcome escrenn

          "Nossa Ligação": "Nossa Ligação",
          "Nosso Link": "Nosso Link",
          "Nossa União": "Nossa União",
          "Olá seja bem-vindo": "Olá seja bem-vindo",
          "EXPLORAR": "EXPLORAR",
          "LOGIN": "LOGIN"
        },
        "en_US": {
          "ola mundo": "Hello World",
          "cliente": "Client",
          "bom dia": "good morning",
          "saúde": "health",
          "gastronomia": "gastronomy",
          "arte": "art",
          "vida e estilo": "life and style",
          "perfil do usuario": "perfil User"
        },
        "fr_FR": {
          "ola mundo": "bonjour le monde",
          "cliente": "Client",
          "bom dia": "bonjour",
          "saúde": "santé",
          "gastronomia": "gastronomie",
          "arte": "art",
          "vida e estilo": "vie et style",
          "perfil do usuario": "perfil User"
        },
      };
}
