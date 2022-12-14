// ignore_for_file: avoid_print
import 'package:elokyetu/Back4app/model/post/i_post_model.dart';
import 'package:elokyetu/Back4app/repository/post/i_post_repository.dart';
import 'package:elokyetu/models/gastronomia_model/post_gastronomia_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elokyetu/app/app_controller/login_controller.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:video_player/video_player.dart';

class PostGastronomyController extends GetxController {
  static final postController = Get.put(PostGastronomyController());
  final scrollPost = ScrollController();
  final postGastr = PostGastronomiaImp();
  var objectIdUser = LoginController.userInformation!.objectId;

  var isLoadPost = false;

  final int _limitPost = 10;
  int _skipPost = 10;
  int _loadNumSkip = 0;

  bool _withOutPost = false;

  final RxList<IPostModel> _posts = RxList<PostGastronomiaModel>();
  List<IPostModel> get posts => _posts.toList();

  //################ CARREGAMENTO DOS PRIMEIROS POSTS DO SISTEMA
  Future<void> initPost() async {
    try {
      isLoadPost = true;
      update();
      _posts.value = await postGastr.getListPost();
      isLoadPost = false;
      update();
      //print(_posts);
    } catch (e) {
      debugPrint(e.toString());
      isLoadPost = false;
      update();
    }

    isLoadPost = false;
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

    try {
      final response = await postGastr.loadListPost(
          limitPost: _limitPost,
          loadNumSkip: _loadNumSkip,
          skipPost: _skipPost,
          category: "gastronomy");
      if (response.isNotEmpty) {
        //### AVERIGUAR
        print("POSTS NOVOS NO SISTEMA");
        print(response);

        _posts.addAll(response);
        _isLoadPosts = false;
        update();
        print("Resultados encontrados");
      } else {
        _isLoadPosts = false;
        _withOutPost = true;
        print("Sem resultados novos");
        Get.snackbar("Carregamento de Posts", "Sem posts novos no momento!!");
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

    // Pular os posts novo com o mesmo n??mero de posts carregados
    _skipPost = _limitPost;

    // Define a pagina????o de posts como 0 para os novos posts
    _loadNumSkip = 0;

    // Variavel _withOutPost (sem posts) torna-se false para poder carregar os posts no loadListPost()!!
    _withOutPost = false;

    try {
      final response = await postGastr.newListPost(
          limitPost: _limitPost, category: "gastronomy");
      if (response.isNotEmpty) {
        _posts.clear();

        //### AVERIGUAR
        _posts.addAll(response);
        postUp();
        update();
        print("Novos Posts Carregados");
      }
    } catch (e) {
      print(e);
    }
  }

  //############## Implementa????o de Live Query - Tempo Real
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
      category = "gastronomy"}) async {
    final _post = QueryBuilder(ParseObject("Post"))
      ..includeObject(["user"])
      ..orderByDescending("createdAt")
      ..setLimit(limitPost);
    try {
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
              objectId: e["objectId"],
              createdAt: e["createdAt"]);
        } else {
          return PostGastronomiaModel(
              content: e["content"],
              typeFile: e["typeFile"],
              filePost: [e["filePost"]["url"]],
              postUserName: e["user"]["nome"],
              objectId: e["objectId"],
              postUserImgPerfil: e["user"]["imgPerfil"]["url"],
              likes: 128,
              createdAt: e["createdAt"]);
        }

        //return PostGastronomiaModel.fromJson(e.toJson());
      }).toList();
      print(serialize);
      if (serialize.isEmpty) {
        Get.snackbar("Resultado da Busca",
            "Nenhum post encontrado no Sistema. Seja o primeiro a publicar (+)");
      }
      return serialize;
    } catch (e) {
      Get.defaultDialog(content: Text("Erro: " + e.toString()));
      return [];
    }
  }

  @override
  Future<List<PostGastronomiaModel>> loadListPost(
      {int limitPost = 10,
      int skipPost = 10,
      int loadNumSkip = 0,
      category = "gastronomy"}) async {
    final queryPost = QueryBuilder(ParseObject("Post"))
      ..includeObject(["user"])
      ..orderByDescending("createdAt")
      ..setAmountToSkip(skipPost * loadNumSkip)
      ..setLimit(limitPost);
    try {
      var response = await queryPost.find();
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
              objectId: e["objectId"],
              createdAt: e["createdAt"]);
        } else {
          return PostGastronomiaModel(
              content: e["content"],
              typeFile: e["typeFile"],
              filePost: [e["filePost"]["url"]],
              postUserName: e["user"]["nome"],
              objectId: e["objectId"],
              postUserImgPerfil: e["user"]["imgPerfil"]["url"],
              likes: 128,
              createdAt: e["createdAt"]);
        }

        //return PostGastronomiaModel.fromJson(e.toJson());
      }).toList();
      print(serialize);
      return serialize;
    } catch (e) {
      Get.defaultDialog(content: Text(e.toString()));
      return [];
    }
  }

  @override
  Future<List<PostGastronomiaModel>> newListPost(
      {int limitPost = 10, String category = "gastronomy"}) async {
    final queryPost = QueryBuilder(ParseObject("Post"))
      ..includeObject(["user"])
      ..orderByDescending("createdAt")
      ..whereLessThanOrEqualTo("createdAt", DateTime.now())
      ..setLimit(limitPost);
    try {
      var response = await queryPost.find();
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
              objectId: e["objectId"],
              createdAt: e["createdAt"]);
        } else {
          return PostGastronomiaModel(
              content: e["content"],
              typeFile: e["typeFile"],
              filePost: [e["filePost"]["url"]],
              postUserName: e["user"]["nome"],
              objectId: e["objectId"],
              postUserImgPerfil: e["user"]["imgPerfil"]["url"],
              likes: 128,
              createdAt: e["createdAt"]);
        }

        //return PostGastronomiaModel.fromJson(e.toJson());
      }).toList();
      print(serialize);
      return serialize;
    } catch (e) {
      Get.defaultDialog(content: Text(e.toString()));
      return [];
    }
  }

  @override
  Future<void> addLikes(String idUser, String idPost) async {
    final isMyLike = await myLike(idUser, idPost);
    if (isMyLike) {
      final post = ParseObject("Post")
        ..objectId = idPost
        ..removeRelation("like", [ParseObject("Personal")..objectId = idUser]);

      try {
        await post.save();
      } catch (e) {
        print(e.toString());
      }
    } else {
      final post = ParseObject("Post")
        ..objectId = idPost
        ..addRelation("like", [ParseObject("Personal")..objectId = idUser]);

      try {
        final response = await post.save();
        print(response.results?[0]["like"]);
      } catch (e) {
        Get.defaultDialog(content: Text(e.toString()));
      }
    }

    /* final like = ParseObject("Like")
      ..set("user", ParseObject("Personal")..objectId = idUser)
      ..set("post", ParseObject("Post")..objectId = idPost);
    final queryLike = QueryBuilder(like)
      ..whereEqualTo("user", ParseObject("Personal")..objectId = idUser)
      ..whereEqualTo("post", ParseObject("Post")..objectId = idPost);
    var response = await queryLike.find();
    if (!response.isEmpty) {
      print("N??O SALVA O LIKE");
      print(response);
      await response[0].delete();
    } else {
      print("SALVA O LIKE");

      await like.save();
    }
 */
    /* Get.defaultDialog(
        content: Column(
          children: [
            Text(response.results.toString()),
            const LinearProgressIndicator()
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("OK"))
        ]); */

    /* final queryLike = QueryBuilder(like);

    final response = await queryLike.first();
    if (response != null) {
      await response.delete();
      final count = await queryLike.count();
      return count.count;
    } else {
      await like.save();
      final count = await queryLike.count();
      return count.count;
    } */
  }

  @override
  Future<int> getLikes(String idPost) async {
    final queryLikes = QueryBuilder(ParseObject("Personal"))
      ..whereRelatedTo("like", "Post", idPost);
    final response = await queryLikes.count();
    if (response.success && response.results?.isNotEmpty != null) {
      return response.count;
    }
    return 0;
  }

  @override
  Future<bool> myLike(String idUser, String idPost) async {
    final queryLike = QueryBuilder(ParseObject("Personal")..objectId = idUser)
      ..whereRelatedTo("like", "Post", idPost);
    final response = await queryLike.query();
    if (response.success && response.results != null) {
      final personal = response.results as List<ParseObject>;
      final foundPersonal = personal.where((like) {
        return like.objectId == idUser;
      }).toList();
      if (foundPersonal.isEmpty) {
        return false;
      } else {
        return true;
      }
    }
    {
      print("FALSE - SEM LIKE");
      print(response);
      return false;
    }
    /* final queryLike = QueryBuilder(ParseObject("Like"))
      ..whereEqualTo("user", ParseObject("Personal")..objectId = idUser)
      ..whereEqualTo("post", ParseObject("Post")..objectId = idPost);
    var response = await queryLike.find();
    if (response.isEmpty) {
      //print("FALSE");
      return false;
    } else {
      //print("TRUE");
      return true;
    } */
  }

  @override
  Future<int> getCountComment(String idPost) async {
    final queryComment = QueryBuilder(ParseObject("Comment"))
      ..whereEqualTo("post", ParseObject("Post")..objectId = idPost);
    final response = await queryComment.count();
    return response.count;
  }
}
