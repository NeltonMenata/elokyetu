import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:elokyetu/screens/login_view/login_view.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:rxdart/rxdart.dart';

class HomeController extends GetxController {
  static final controller = Get.put(HomeController());

  // - VARIAVEIS
  static ParseUser? user;
  static ParseObject? userInformation;
  final listPosts = [].obs;
  final List<String> nome = [];
  final nome1 = [].obs;
  final StreamController<List<String>> posts = BehaviorSubject();
  LiveQuery liveQuery = LiveQuery();
  late Subscription subscription;

  // - FIM DE VARIAVEIS

  // FUNÇOES
  void addNome(String value) {
    nome.add(value);
    print(nome.length);
    posts.sink.add(nome);
    update();
  }

  delNome() async {
    await Get.dialog(AlertDialog(
      title: const Text("Apagar"),
      content: const Text("Desejas apagar a ultima sms enviada?"),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Não")),
        TextButton(
            onPressed: () {
              nome.removeLast();
              posts.sink.add(nome);
              Get.back();
            },
            child: const Text("Sim")),
      ],
    ));
    if (nome.length < 1) return;

    print(nome.length);
    update();
  }

  Future<List<ParseObject>> allPosts(String objectIdPersonal) async {
    final query = QueryBuilder(ParseObject("Post"))
      ..orderByDescending("createdAt")
      ..whereEqualTo(
          "author", ParseObject("Personal")..objectId = objectIdPersonal);
    return await query.find();
  }

  void finishidSession(BuildContext context) async {
    ParseUser? user = await ParseUser.currentUser();
    if (user == null) return;
    final response = await user.logout();
    if (response.success) {
      await GetStorage().write("email", null);
      await GetStorage().write("senha", null);
      Get.offAll(LoginView());
    } else {
      showError(context, response.error!.message);
    }
  }

  void showSuccess(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Sucesso"),
              content: const Text("Conta de Usuário criado com sucesso"),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.off(LoginView());
                    },
                    child: const Text("OK"))
              ],
            ));
  }

  void showError(BuildContext context, String erro) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Insucesso"),
              content: const Text(
                  "Erro ao terminar sessão: Verifica a tua Internet"),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("OK"))
              ],
            ));
  }

  void postsStart() async {}

  void startLiveQuery() async {
    final queryPosts = QueryBuilder(ParseObject("Post"))
      ..orderByDescending("createdAt");
    subscription = await liveQuery.client.subscribe(queryPosts);
    subscription.on(LiveQueryEvent.create, (ParseObject value) {
      listPosts.add(value);
    });
  }
  // FIM DE FUNÇOES

  // INICIALIZADORES
  @override
  void onInit() async {
    //final user = await ParseUser.currentUser() as ParseUser;
    //final queryUser = QueryBuilder(ParseObject("Personal"))
    //  ..whereEqualTo("user", ParseObject("User")..objectId = user.objectId);
    //final response =  await queryUser.first();
    //userInformation = response;
    startLiveQuery();
    super.onInit();
  }

  @override
  void onClose() {
    posts.close();
    super.onClose();
  }
}
