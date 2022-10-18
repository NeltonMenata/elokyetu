// ignore_for_file: avoid_print

import 'package:elokyetu/Back4app/model/post/i_post_model.dart';
import 'package:elokyetu/Back4app/repository/post/i_post_repository.dart';
import 'package:elokyetu/models/gastronomia_model/post_gastronomia_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:elokyetu/app/app_controller/login_controller.dart';
import 'dart:io';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:video_player/video_player.dart';

class PostController extends GetxController {
  static final postController = Get.put(PostController());
  final scrollPost = ScrollController();
  final title = TextEditingController();
  final content = TextEditingController();
  final postGastr = PostGastronomiaImp();
  var objectIdUser = LoginController.userInformation!.objectId;
  File? filePost;
  int typeFile = 0;

  var isPost = false;

  static var isLoadPost = false.obs;

  final int _limitPost = 10;
  int _skipPost = 10;
  int _loadNumSkip = 0;

  bool _withOutPost = false;

  static final RxList<PostGastronomiaModel> _posts =
      RxList<PostGastronomiaModel>();
  List<PostGastronomiaModel> get posts => _posts.toList();

  //################ CARREGAMENTO DOS PRIMEIROS POSTS DO SISTEMA
  Future<void> initPost() async {
    isLoadPost.value = true;
    try {
      _posts.value = await postGastr.getListPost();
    } catch (e) {
      debugPrint(e.toString());
      isLoadPost.value = false;
    }

    isLoadPost.value = false;
  }

  VideoPlayerController? videoController;

  //############## PUBLICAR NOVO POST
  Future<void> addPost() async {
    isPost = true;
    update();
    if (content.text.isEmpty) {
      isPost = false;
      update();
      return;
    }

    final post = ParseObject("Post")
      ..set("user", ParseObject("Personal")..objectId = objectIdUser)
      ..set("category", "category")
      ..set("content", content.text);

    try {
      final response = await post.save();
      if (response.results == null || filePost == null) {
        Get.snackbar("Post", "Publicado com sucesso");
        filePost = null;
        typeFile = 1;
        isPost = false;
        title.clear();
        content.clear();
        update();
        return;
      }

      ParseFileBase parseFile;
      parseFile = ParseFile(filePost);
      await parseFile.save();
      typeFile = 2;
      post
        ..set("filePost", parseFile)
        ..set("typeFile", typeFile);
      await post.save();

      Get.snackbar("Post", "Publicado com sucesso");
      filePost = null;
      typeFile = 0;
      isPost = false;
      title.clear();
      content.clear();
      update();
    } catch (e) {
      print(e);
    }
  }

  //###################

  Future<void> selectFilePost() async {
    var fileResult = await FilePicker.platform.pickFiles(type: FileType.image);
    if (fileResult == null) return;
    var extension = fileResult.files.first.extension.toString();
    if (extension == "mp4") {
      File _video = File(fileResult.files.first.path!);
      videoController = VideoPlayerController.file(_video);
      await videoController!.initialize();
      //await videoController!.play();
      typeFile = 3;
    } else {
      typeFile = 2;
    }

    filePost = File(fileResult.files.first.path!);

    update();
  }

  //############ SCROLL CONTROLLER DE POSTS ########

  void postUp() {
    final start = scrollPost.position.minScrollExtent;
    scrollPost.animateTo(start,
        duration: const Duration(seconds: 2), curve: Curves.easeIn);
    print(start);

    //scrollPost.jumpTo(0.0);
  }

  //################ Inicializador do Controller
  @override
  void onInit() {
    initLivePost();
    scrollPost.addListener(() {
      if (scrollPost.position.atEdge) {
        if (scrollPost.position.pixels == 0) {
        } else {
          if (_isLoadPosts || _withOutPost) {
          } else {
            Get.snackbar("Mais Posts no Elokyetu",
                "Carregando mais posts sobre gastronomia!");
            loadPosts();
          }
        }
      }
    });
    super.onInit();
  }

  //############### Posts Novos no Sistema
  bool _isLoadPosts = false;
  Future<void> loadPosts() async {
    _isLoadPosts = true;
    _loadNumSkip++;
    final queryPost = QueryBuilder(ParseObject("Post"))
      ..includeObject(["user"])
      ..orderByDescending("createdAt")
      ..setAmountToSkip(_skipPost * _loadNumSkip)
      ..setLimit(_limitPost);

    try {
      final response = await queryPost.find();
      if (response.isNotEmpty) {
        //### AVERIGUAR

        _posts.addAll(response
            .map((e) => PostGastronomiaModel.fromJson(e.toPointer()))
            .toList());
        _isLoadPosts = false;
        print("Resultados encontrados");
      } else {
        _isLoadPosts = false;
        _withOutPost = true;
        print("Sem resultados novos");
      }
      {
        _isLoadPosts = false;
      }
    } catch (e) {
      _isLoadPosts = false;
      print(e);
    }
  }

  //############### Carregar os Posts Novos Manualmente
  Future<void> loadNewsPost() async {
    Get.snackbar("Novos Posts", "Carregando novos posts!");
    _skipPost = _limitPost;
    _loadNumSkip = 0;
    _withOutPost = false;

    final queryPost = QueryBuilder(ParseObject("Post"))
      ..includeObject(["user"])
      ..orderByDescending("createdAt")
      ..whereLessThanOrEqualTo("createdAt", DateTime.now())
      ..setLimit(_limitPost);
    try {
      final response = await queryPost.find();
      if (response.isNotEmpty) {
        _posts.clear();

        //### AVERIGUAR
        _posts.addAll(
            response.map((e) => PostGastronomiaModel.fromJson(e.toPointer())));
        postUp();

        print("Novos Posts Carregados");
      }
    } catch (e) {
      print(e);
    }
  }

  //############## Implementação de Live Query - Tempo Real
  LiveQuery livePost = LiveQuery();
  late Subscription subLivePost;
  Future<void> initLivePost() async {
    final queryPost = QueryBuilder(ParseObject("Post"));
    subLivePost = await livePost.client.subscribe(queryPost);
    subLivePost.on(LiveQueryEvent.create, (ParseObject parse) {
      _withOutPost = false;
      print("Post Novo Criado");
      print(parse);
    });
  }
}

class PostGastronomiaImp implements IPostRepository {
  @override
  Future<List<PostGastronomiaModel>> getListPost(
      {int limitPost = 10,
      int skipPost = 10,
      int loadNumSkip = 0,
      category = ""}) async {
    final _post = QueryBuilder(ParseObject("Post"))
      ..includeObject(["user"])
      ..orderByDescending("createdAt")
      ..setLimit(limitPost);
    var response = await _post.find();
    debugPrint(response.toString());

    var serialize = response.map((e) {
      print("##############################");

      print("##############################");
      print(e["typeFile"]);
      if (e["typeFile"] == 1) {
        return PostGastronomiaModel(
            content: e["content"],
            typeFile: e["typeFile"],
            //filePost: [e["filePost"]["url"]],
            postUserName: e["user"]["nome"],
            postUserImgPerfil: e["user"]["imgPerfil"]["url"],
            likes: 437,
            createdAt: e["createdAt"]);
      } else {
        return PostGastronomiaModel(
            content: e["content"],
            typeFile: e["typeFile"],
            filePost: [e["filePost"]["url"]],
            postUserName: e["user"]["nome"],
            postUserImgPerfil: e["user"]["imgPerfil"]["url"],
            likes: 128,
            createdAt: e["createdAt"]);
      }

      //return PostGastronomiaModel.fromJson(e.toJson());
    }).toList();
    return serialize;
  }
}
