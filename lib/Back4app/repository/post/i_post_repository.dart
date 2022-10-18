import 'package:elokyetu/Back4app/model/post/i_post_model.dart';

abstract class IPostRepository {
  Future<List<IPostModel>> getListPost(
      {int limitPost, int skipPost, int loadNumSkip, String category});
}
