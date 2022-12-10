import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:elokyetu/screens/perfil_user/perfil_user.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:path_provider/path_provider.dart';

import 'login_controller.dart';

class CreateUserController extends GetxController {
  static final controller = Get.put(CreateUserController());

  void createUser(String nome, String email, String senha, DateTime date,
      BuildContext context) async {
    try {
      if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
        showError(context, "Preencha todos os campos correctamente!");
        return;
      }

      final parseUser = ParseUser(email, senha, email);
      final response = await parseUser.create();
      await parseUser.login();
      if (response.success) {
        final userId = response.results![0].get("objectId") as String;
        final parseACL = ParseACL();
        parseACL.setReadAccess(userId: userId);
        parseACL.setWriteAccess(userId: userId);

        parseACL.setPublicReadAccess(allowed: true);
        final parseInformation = ParseObject("Personal");
        parseInformation.setACL(parseACL);
        parseInformation.set(
            "user", (response.results![0] as ParseUser).toPointer());
        parseInformation.set("nome", nome);
        parseInformation.set("nascimento", date);

        //Carrega a imagem da pasta assets como um arquivo ByteData
        ByteData byte = await rootBundle.load("assets/img_perfil.png");

        //Converte o bytedata como Uint8List
        Uint8List image =
            byte.buffer.asUint8List(byte.offsetInBytes, byte.lengthInBytes);
        //Cria um directorio temporario
        var tempDir = await getTemporaryDirectory();
        //Cria um ficheiro vazio no caminho temporario
        var file = await File("${tempDir.path}/img_perfil.png").create();
        //Escreve a imagem no ficheiro temporario criado
        file.writeAsBytesSync(image);

        final pfile = ParseFile(file);
        await pfile.save();

        //Set a variavel de imagem de perfil
        LoginController.loginController.imgFile = file;

        parseInformation.set("imgPerfil", pfile);

        final personalSave = await parseInformation.save();
        final personalObjectId =
            personalSave.results![0].get("objectId") as String;
        LoginController.user = response.results!.first;
        LoginController.userInformation = personalSave.results!.first;
        final findRelation = ParseObject("Find")
          ..set("proxy", ParseObject("Personal")..objectId = personalObjectId);

        await findRelation.save();
        Get.offAll(
          () => EditarPerfil(
            isCreate: true,
          ),
        );
      } else {
        showError(context, response.error!.message);
      }
    } catch (error) {
      showError(context, error.toString());
    }
  }

  void showError(BuildContext context, String erro) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Insucesso"),
              content: Text("Erro ao criar conta: $erro"),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("OK"))
              ],
            ));
  }
}
