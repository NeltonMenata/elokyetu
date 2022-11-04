import 'package:elokyetu/Back4app/model/post/i_post_model.dart';

abstract class IPostRepository {
  Future<List<IPostModel>> getListPost(
      {int limitPost, int skipPost, int loadNumSkip, String category});

  Future<List<IPostModel>> loadListPost(
      {int limitPost, int skipPost, int loadNumSkip, String category});

  Future<List<IPostModel>> newListPost({int limitPost, String category});

  Future<int> getLikes(String idPost);

  Future<int> getCountComment(String idPost);

  Future<void> addLikes(String idUser, String idPost);

  Future<bool> myLike(String idUser, String idPost);
}
