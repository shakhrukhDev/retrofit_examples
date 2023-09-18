
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:retrofit_examples/presentation/models/post_model.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class ApiService{

  factory ApiService(Dio dio) = _ApiService;

  @GET('posts')
  Future<List<PostModel>> getPosts();
}