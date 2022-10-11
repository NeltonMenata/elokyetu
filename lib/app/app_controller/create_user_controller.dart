import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elokyetu/screens/perfil_user/perfil_user.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'login_controller.dart';

class CreateUserController extends GetxController {
  static final controller = Get.put(CreateUserController());

  void createUser(String nome, String email, String senha, String date,
      BuildContext context) async {
    try {
      if (nome.isEmpty ||
          email.isEmpty ||
          senha.isEmpty ||
          date.isEmpty ||
          date.length < 10) {
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
        var newDate = date.replaceAll(".", "");
        var day = newDate[0] + newDate[1];
        var month = newDate[2] + newDate[3];
        var year = newDate[4] + newDate[5] + newDate[6] + newDate[7];
        final parseInformation = ParseObject("Personal");
        parseInformation.setACL(parseACL);
        parseInformation.set(
            "user", (response.results![0] as ParseUser).toPointer());
        parseInformation.set("nome", nome);
        parseInformation.set(
            "nascimento",
            DateTime(
              int.tryParse(year) ?? 1900,
              int.tryParse(month) ?? 01,
              int.tryParse(day) ?? 01,
            ));

        final personalSave = await parseInformation.save();
        final personalObjectId =
            personalSave.results![0].get("objectId") as String;
        LoginController.user = response.results!.first;
        LoginController.userInformation = personalSave.results!.first;
        final findRelation = ParseObject("Find")
          ..set("proxy", ParseObject("Personal")..objectId = personalObjectId);

        await findRelation.save();
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Sucesso"),
                  content: const Text("Conta de Usuário criado com sucesso"),
                  actions: [
                    TextButton(
                        onPressed: () async {
                          Get.offAll(
                            EditarPerfil(
                              isCreate: true,
                            ),
                          );
                        },
                        child: const Text("OK"))
                  ],
                ));
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
