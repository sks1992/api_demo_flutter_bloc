import 'package:bloc_flutter_api_demo/data/model/post_model.dart';
import 'package:bloc_flutter_api_demo/data/repository/api/api.dart';
import 'package:dio/dio.dart';

class PostRepository {
  API api = API();

  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      return postMaps.map((e) => PostModel.fromJson(e)).toList();
    } catch (ex) {
      throw ex;
    }
  }
}
