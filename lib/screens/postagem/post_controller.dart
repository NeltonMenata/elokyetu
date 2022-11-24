import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:video_player/video_player.dart';

import '../../app/app_controller/login_controller.dart';

class PostController extends GetxController {
  //OBJECTID DO USER CURRENT
  var objectIdUser = LoginController.userInformation!.objectId;

  static final controller = Get.put(PostController());
  final title = TextEditingController();
  final content = TextEditingController();
  File? filePost;
  int typeFile = 0;
  var isPost = false;

  //############## PLAY VIDEO
  VideoPlayerController? videoController;
  bool isVideoPlay = false;
  void playVideo() {
    if (isVideoPlay) {
      videoController?.pause();
    } else {
      videoController?.play();
    }
    isVideoPlay = !isVideoPlay;
  }

  Future<void> disposeVideo() async {
    await videoController?.dispose();
    videoController = null;
  }

  //###################
  //##############

  //############## PUBLICAR NOVO POST
  Future<void> addPost({String category = "gastronomy"}) async {
    isPost = true;
    update();
    if (content.text.isEmpty) {
      isPost = false;
      update();
      return;
    }

    final post = ParseObject("Post")
      ..set("user", ParseObject("Personal")..objectId = objectIdUser)
      ..set("category", category)
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

  Future<void> selectFilePost() async {
    disposeVideo();
    var fileResult = await FilePicker.platform
        .pickFiles(type: FileType.media, allowMultiple: true);
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
}
