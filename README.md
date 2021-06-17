In this project we implemented Database using flutter floor package, Networking using flutter Dio package and managed state using GetX package. 

Here is some of its view...

# Initializing our services

```
void main() {
  initServices();
  runApp(MyApp());
}

initServices() async {
  await Get.putAsync<RestClient>(() => RestClient().init());
  await Get.putAsync<AppDb>(() => AppDb.init());
}
```

# Networking

Calling and handling errors

```
Future<dynamic> request(
      String url, Method method, Map<String, dynamic>? params) async {
    Response response;

    try {
      if (method == Method.POST) {
        response = await _dio.post(url, data: params);
      } else if (method == Method.DELETE) {
        response = await _dio.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio.patch(url);
      } else {
        response = await _dio.get(
          url,
          queryParameters: params,
        );
      }

      if (response.statusCode == 200) {

        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something Went Wrong");
      }
    } on SocketException catch(e) {
      throw Exception("No Internet Connection");
    } on FormatException {
      throw Exception("Bad Response Format!");
    } on DioError catch (e){
      throw Exception(e);
    } catch (e) {
      throw Exception("Something Went Wrong");
    }
  }
```

Calling from controller

```
loadData() async {
    final map = Map<String, dynamic>();
    map['page'] = page;

    try {
      final result = await restClient.request("url", Method.GET, map);

      if (result != null) {
        if (result is d.Response) {
          var data = BloodDonor.fromJson(result.data).data;
          if (data != null) {
            donors.addAll(data.data);
            isToLoadMore = true;
            change(donors, status: RxStatus.success());
          } else {
            isToLoadMore = false;
          }
        }
      } else {
        isToLoadMore = false;
      }
    } on Exception catch (e) {
      Get.showSnackbar(GetBar(
        message: "$e",
        duration: Duration(milliseconds: 3000),
      ));
    }
  }
```

# Database

```
@Database(version: 1, entities: [Person])
abstract class AppDb extends FloorDatabase {
  PersonDao get personDao;

  static Future<AppDb> init() async {
    AppDb instance = await $FloorAppDb.databaseBuilder("db_name").build();
    return instance;
  }
}
```
