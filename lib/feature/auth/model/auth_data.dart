import 'package:dio/dio.dart';

class AuthData {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await dio.post(
        "https://elwekala.onrender.com/user/login",
        data: {"email": email, "password": password},
      );

      print(response.data);
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        return e.response!.data;
      }

      return {"state": "error", "message": "Unknown error"};
    }
  }

  Future<Map<String, dynamic>> register({
    required String name,
    required String phone,
    required String gender,
    required String nationalId,
    required String email,
    required String password,
  }) async {
    try {
      var response = await dio.post(
        "https://elwekala.onrender.com/user/register",
        data: {
          "name": name,
          "phone": phone,
          "gender": gender,
          "nationalId": nationalId,
          "email": email,
          "password": password,
        },
      );
      print(response.data);
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        return e.response!.data;
      }
      return {"state": "error", "message": "Unknown error"};
    }
  }
}


          // Positioned(
          //   top: 50,
          //   right: 20,
          //   child: TextButton(
          //     style: TextButton.styleFrom(backgroundColor: Color(0xffE8ECED)),
          //     onPressed: () {
          //       Navigator.pushReplacement(
          //         context,
          //         MaterialPageRoute(builder: (context) => Loginscreen()),
          //       );
          //     },
          //     child: Text("skip"),
          //   ),
          // ),






