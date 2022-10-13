import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:elokyetu/screens/bottom_bar/tabb_screen.dart';
//import 'package:kyeto/app/app_provider/provider_data.dart';
//import 'package:kyeto/app/app_views/users_views/controllers/user_controller.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class LoginController extends GetxController {
  static ParseUser? user;
  static ParseObject? userInformation;

  var edNome = TextEditingController();
  var edPassatempo = TextEditingController();
  var edProfissao = TextEditingController();

  bool isSavingEditPerfil = false;

  void login(String email, String senha, BuildContext context,
      {bool isCreate = false}) async {
    try {
      if (email.trim().isEmpty || senha.trim().isEmpty) return;
      final currentUser = await ParseUser.currentUser() as ParseUser?;
      if (currentUser != null) {
        await currentUser.logout();
      }
      final parseUser = ParseUser(email, senha, null);
      final response = await parseUser.login();
      final queryUser = QueryBuilder(ParseObject("Personal"))
        ..whereEqualTo("user", parseUser);
      userInformation = await queryUser.first();

      if (response.success && response.results != null) {
        user = response.results!.first;
        await GetStorage().write("email", user!.emailAddress);
        await GetStorage().write("senha", user!.password);
        if (isCreate == true) return;
        Get.offAll(
          TabsScreen(),
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
              content: const Text(
                  "Erro ao entrar na conta: Verifique seu email, senha ou conexão com a Internet!"),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("OK"))
              ],
            ));
  }

  void showResult(BuildContext context, String sms) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Resultado da Operação"),
              content: Text(sms),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("OK"))
              ],
            ));
  }

  static Widget perfilImgFound(ParseFileBase? url) {
    return url == null
        ? const Icon(
            Icons.person_rounded,
            size: 50,
          )
        : ClipRRect(
            // aqui so altereio clip para ficar tudo circular
            borderRadius: BorderRadius.circular(65),
            child: Image.network(
              url["url"],
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          );
  }

  static Widget perfilImg() {
    print("Imagem do Perfil Chamada");
    return userInformation!["imgPerfil"] == null ||
            userInformation!["imgPerfil"]["url"] == null
        ? const Icon(
            Icons.person_rounded,
            size: 50,
          )
        : ClipRRect(
            // aqui so alterei o clip para ficar tudo circular
            borderRadius: BorderRadius.circular(65),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(userInformation!["imgPerfil"]["url"]),
                  fit: BoxFit.cover,
                ),
              ),
              height: double.infinity,
              // child: Image.network(
              //   userInformation!["imgPerfil"]["url"],
              //   fit: BoxFit.cover,
              //   height: double.infinity,
              // ),
            ),
          );
  }

  File? imgFile;
  Future<void> selectImgPerfil() async {
    PickedFile? picker =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    if (picker == null) return;
    isSavingEditPerfil = true;
    update();
    imgFile = File(picker.path);

    ParseFileBase parseFile;
    parseFile = ParseFile(imgFile);
    await parseFile.save();

    userInformation!.set("imgPerfil", parseFile);
    await userInformation!.save();
    isSavingEditPerfil = false;
    Get.snackbar("Perfil", "Imagem guardada com sucesso!");
    update();
  }

  Future<void> saveEditing(BuildContext context) async {
    userInformation!
      ..set(
          "nome",
          edNome.text.isEmpty
              ? userInformation!["nome"].toString()
              : edNome.text)
      ..set(
          "profissao",
          edProfissao.text.isEmpty
              ? userInformation!["profissao"].toString()
              : edProfissao.text)
      ..set(
          "passatempo",
          edPassatempo.text.isEmpty
              ? userInformation!["passatempo"].toString()
              : edPassatempo.text);

    //var parseFile = ParseFile(imgPerfil);
    try {
      isSavingEditPerfil = true;
      update();
      var response = await userInformation!.save();
      if (response.results != null && response.success) {
        isSavingEditPerfil = false;
        //#########################
        edNome.clear();
        edPassatempo.clear();
        edProfissao.clear();
        //imgFile = null;
        //#########################
        update();
        showResult(context, "Usuário editado com sucesso");
      } else {
        print("Erro ao salvar: ${response.results}");
        showResult(context, "Erro ao editar o Usuário!");
      }
    } catch (e) {
      print("Erro ao salvar: $e");
      showResult(context, "Erro ao editar o Usuário!");
    }
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    edNome.clear();
    edPassatempo.clear();
    edProfissao.clear();
    imgFile = null;
    super.onClose();
  }
}
