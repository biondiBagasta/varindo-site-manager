
import 'package:dio/dio.dart';
import 'package:varindo_estate_management/cubit/server_cubit.dart';
import 'package:varindo_estate_management/locator.dart';
import 'package:varindo_estate_management/model/adamulti/kategori_with_menu_response.dart';

class AdamultiService {

  final _dio = Dio();

  final dummyToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwidXNlcm5hbWUiOiJiaW9uZGlfYmFnYXN0YSIsInBhc3N3b3JkIjoiJDJiJDEyJFV1Mjlpd05nbnphYjFOQ0VFN1JGSmV3ZmNjVmx0aE5pUWhXb2JqVVd5VUh0eW5JSy9CMVJLIiwiY3JlYXRlZF9hdCI6IjIwMjMtMDktMDVUMDU6MjE6MjYuMDAwWiIsInVwZGF0ZWRfYXQiOiIyMDI0LTAxLTE2VDA1OjI3OjI3LjAwMFoiLCJpYXQiOjE3MjczMTYyMzN9.9yJuz2JCjzcOPdXdusQEPMSTwLskIiZ59Yw0F1-_wGY";
  

  Future<KategoriWithMenuResponse> getFavoriteMenu(String platform) async {
    final response = await _dio.get("${locator.get<ServerCubit>().state.baseUrlAuth}/setting-menu-kategori/favorite-menu/$platform", options: Options(
      headers: {
        'Content-Type': 'application/json',
      }
    ));

    return KategoriWithMenuResponse.fromJson(response.data);
  }

  Future<List<KategoriWithMenuResponse>> getAllMenuByKategoriExclude(int id, int id2, String platform) async {

    final response = await _dio.get("${locator.get<ServerCubit>().state.baseUrlAuth}/setting-menu-kategori/with-menu/platform-specific/exclude/$id/$id2/$platform", options: Options(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $dummyToken'
      }
    ));

    return (response.data as List).map((e) => KategoriWithMenuResponse.fromJson(e)).toList();
  }
}