import 'package:dio/dio.dart';
import 'package:uts_mobile/models/lipstick.dart';
// import 'package:uts_mobile/models/ramene.dart';

// // 2. menggunakan asyncronous untuk ambil data api
class RameneService {
//   static Future<Map<String, dynamic>> getDataRamen() async {
//     // 3. inisasikan sebuah package Dio
//     Dio dio = Dio();

//     /* 4. variable dio dapat diakses berbagai method salah
//   satunya get untuk mengambil data dari http request */
//     var response = await dio.get(
//         'https://my-does-app-5c4a7-default-rtdb.firebaseio.com/ramene.json');
//     print('status code : ${response.statusCode}');
//     var dataResponse = response.data;

//     return dataResponse;
//   }
// }

  static Future<List<Data>> getDataRamen() async {
    Dio dio = Dio();
    var res = await dio.get('http://192.168.50.26:3000/lipstick');

    List<Data> ramens =
        (res.data['data'] as List).map((v) => Data.fromJson(v)).toList();
    return ramens;
  }
}
