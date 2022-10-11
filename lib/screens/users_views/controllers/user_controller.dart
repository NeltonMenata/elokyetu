import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elokyetu/app/app_controller/login_controller.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserController extends GetxController {
  bool isUsersFound = false;

  bool isUsersProxy = false;
  List<ParseObject> usersFound = [];
  List<ParseObject> usersProxy = [];
  String _objectIdFind = "";

  String _objectIdUser = LoginController.userInformation!["objectId"];

  Future<List<ParseObject>> _usersFound() async {
    print(_objectIdUser);
    final find = QueryBuilder(ParseObject("Find"))
      ..whereEqualTo("proxy",
          (ParseObject("Personal")..objectId = _objectIdUser).toPointer());

    final response = await find.first();
    if (response != null) {
      _objectIdFind = response.objectId!;
      final users = QueryBuilder(ParseObject("Personal"))
        ..whereRelatedTo("found", "Find", response.objectId!);
      final usersResponse = await users.find();

      return usersResponse;
    }
    return [];
  }

  Future<List<ParseObject>> _usersProxy() async {
    List<String> usersFoundId = usersFound.map((e) => e.objectId!).toList();
    if (usersFound.length > 0) {
      final users = QueryBuilder(ParseObject("Personal"))
        ..whereNotEqualTo("objectId", _objectIdUser)
        ..whereNotContainedIn("objectId", usersFoundId)
        ..setLimit(30);
      final usersResponse = await users.find();
      /*usersResponse.removeWhere((element) {
      if (element.objectId == _objectIdUser) return true;
      return false;
    });*/
      return usersResponse;
    } else {
      final users = QueryBuilder(ParseObject("Personal"))
        ..whereNotEqualTo("objectId", _objectIdUser)
        ..setLimit(30);
      final usersResponse = await users.find();

      return usersResponse;
    }
  }

  void startUsers() async {
    usersFound = [];
    usersProxy = [];

    usersFound = await _usersFound();
    isUsersFound = true;
    usersProxy = await _usersProxy();
    isUsersProxy = true;

    update();
  }

  //ADICIONA UM NOVO USUARIO
  void addUser(String objectIdAdd, ParseObject userAdd) async {
    try {
      Get.snackbar("Usuário", "Adicionando o usuário encontrado!");
      if (_objectIdFind.isEmpty) return;
      //_objectIdFind = apiResponse.objectId!;

      final _addUser = ParseObject("Find")
        ..objectId = _objectIdFind
        ..addRelation("found", [
          (ParseObject("Personal")..set("objectId", objectIdAdd)).toPointer()
        ]);
      final response = await _addUser.save();

      if (response.success && response.results != null) {
        // Adicionando o usuario na lista do usuario q adicionou
        final find = QueryBuilder(ParseObject("Find"))
          ..whereEqualTo("proxy",
              (ParseObject("Personal")..objectId = objectIdAdd).toPointer());

        final apiResponse = await find.first();
        if (apiResponse == null) return;
        final _addUser2 = ParseObject("Find")
          ..objectId = apiResponse.objectId!
          ..addRelation("found", [
            (ParseObject("Personal")..set("objectId", _objectIdUser))
                .toPointer()
          ]);
        final response2 = await _addUser2.save();
        if (!response2.success && response2.results == null) return;

        /*
            ####
            */
        Get.snackbar("Sucesso", "Usuario salvo com sucesso");
        usersFound.add(userAdd);
        usersProxy.removeWhere((element) {
          if (element.objectId == objectIdAdd) {
            return true;
          }
          return false;
        });
        update();
      } else {
        Get.defaultDialog(
            title: "Erro",
            content: const Text(
                "Erro ao salvar o usuario, verifique a sua internet!"),
            textConfirm: "OK",
            onConfirm: () {
              Get.back();
            });
      }
    } catch (erro) {
      print(erro);
    }
  }
  //######### LIVES QUERYS - VARIAVEIS ############//

  LiveQuery liveUsersFound = LiveQuery();
  late Subscription subUsersFound;

  LiveQuery liveUsersProxy = LiveQuery();
  late Subscription subUsersProxy;
  //######### FIM - VARIAVEIS ############//

  //######### LIVES QUERYS - FUNÇOES ############//
  Future<void> startLiveUsersFound() async {
    final queryLiveUsers = QueryBuilder(ParseObject("Find"))
      ..whereEqualTo("objectId", _objectIdFind);
    subUsersFound = await liveUsersFound.client.subscribe(queryLiveUsers);

    subUsersFound.on(LiveQueryEvent.update, (ParseObject value) {
      //print("######## Live QUery - Actualização #######");

      usersFoundLive(
          value.objectId!, "######## Live QUery - Actualização #######");
    });
/*
    subUsersFound.on(LiveQueryEvent.create, (ParseObject value) {
      //print("######## Live QUery - Criação #######");
      print("######## Live QUery - Criação #######" + value.toString());
      print("##########################");
      print(value["found"]);
      usersFoundLive(value.objectId!, "######## Live QUery - Criação #######");
    });*/
  }

  Future<void> usersFoundLive(String _objectId, String valor) async {
    List<String?> oldFoundUser = [];
    oldFoundUser = usersFound.map((e) => e.objectId).toList();
    final queryFind = QueryBuilder(ParseObject("Personal"))
      ..whereRelatedTo("found", "Find", _objectId)
      ..whereNotContainedIn("objectId", oldFoundUser);

    final newFoundUser = await queryFind.find();
    usersFound.addAll(newFoundUser);
    update();

    //final response = await queryFind.first();
    //print("***********************************");
    //print(response);
    //print("***********************************");

    //print(valor);
  }

  Future<void> startLiveUsersProxy() async {
    final queryLiveUsers = QueryBuilder(ParseObject("Personal"));

    subUsersFound = await liveUsersFound.client.subscribe(queryLiveUsers);

    subUsersFound.on(LiveQueryEvent.create, (ParseObject value) {
      usersProxyLive(value);
    });
  }

  Future<void> usersProxyLive(ParseObject newUser) async {
    usersProxy.add(newUser);
    update();
  }

//######### FIM - FUNÇOES ############//
  @override
  void onInit() async {
    startUsers();
    startLiveUsersFound();
    super.onInit();
  }

  @override
  void onClose() {
    liveUsersFound.client.unSubscribe(subUsersFound);
    liveUsersProxy.client.unSubscribe(subUsersProxy);
    super.onClose();
  }
}


/*

//var controllerLogin = Get.find<LoginController>();
  Future<List<ParseObject>> users() async {
    var objectIdUser = LoginController.userInformation!.objectId;
    final findClass = QueryBuilder(ParseObject("Find"))
      ..whereEqualTo("proxy", ParseObject("Personal")..objectId = objectIdUser);
    var find = await findClass.first() as ParseObject;
    var objectIdFind = find.objectId ?? "";

    final userQuery = QueryBuilder(ParseObject("Personal"));
    userQuery.whereRelatedTo("found", "Find", objectIdFind);
    var result = await userQuery.find();
    var result3 = result.map((e) => e.objectId).toList();
    final userFound = QueryBuilder(ParseObject("Personal"));

    userFound.whereNotContainedIn("objectId", result3);
    var result2 = await userFound.find();

    if (result.isEmpty) {
      return [];
    }

    return result2;
  }


*/
