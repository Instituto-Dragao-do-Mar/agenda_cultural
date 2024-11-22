import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agendacultural/app/core/constants/constants.dart';
import 'package:agendacultural/app/core/htpp_client/http_client.dart';
import 'package:agendacultural/app/modules/splash/domain/adapter/category.dart';

class CategoryController extends HttpClient {
  Future<List<Category>> getCategories() async {
    List<Category> list = [];

    String url = "${baseUrlApi}categorias";

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        var ret = jsonDecode(response.body);
        list = (ret['categorias'] as List).map((e) {
          return Category.fromJson(e);
        }).toList();
      } else {
        setErrorMessage("Categoria ${response.body}");
      }
    } catch (_) {
      setErrorMessage("Categoria ${_.toString()}");
    }

    return list;
  }
}
