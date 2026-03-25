import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:my_app/feature/auth/model/auth_data.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthData authData = AuthData();

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());

      final response = await authData.login(email: email, password: password);
      print("RESPONSE: $response");

      final user = response['user'];

      if (user != null && user['token'] != null) {
        emit(AuthSuccess(data: response));
      } else {
        emit(
          AuthError(
            error:
                response['message']?.toString() ??
                response['error']?.toString() ??
                "Login failed",
          ),
        );
      }
    } catch (e) {
      print("LOGIN ERROR: $e");
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> register(
    String name,
    String phone,
    String gender,
    String nationalId,
    String email,
    String password,
  ) async {
    try {
      emit(AuthLoading());
      final response = await authData.register(
        name: name,
        phone: phone,
        gender: gender,
        nationalId: nationalId,
        email: email,
        password: password,
      );
      final user = response["user"];
      if (user != null && user["token"] != null) {
        emit(AuthSuccess(data: response));
      } else {
        emit(
          AuthError(
            error:
                response['message']?.toString() ??
                response["error"]?.toString() ??
                "Register failed",
          ),
        );
      }
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }
}

// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:my_app/feature/auth/model/auth_data.dart';

// part 'auth_state.dart';

// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(AuthInitial());

//   final AuthData authData = AuthData();

//   // 🔹 LOGIN
//   Future<void> login(String email, String password) async {
//     try {
//       emit(AuthLoading());

//       final response = await authData.login(email: email, password: password);

//       print("========== LOGIN RESPONSE ==========");
//       print(response);
//       print("===================================");

//       final token = response['user']?['token'] ?? response['token'];

//       if (token != null) {
//         emit(AuthSuccess(data: response));
//       } else {
//         emit(
//           AuthError(
//             error:
//                 response['message']?.toString() ??
//                 response['error']?.toString() ??
//                 "Login failed",
//           ),
//         );
//       }
//     } catch (e) {
//       print("LOGIN ERROR: $e");
//       emit(AuthError(error: e.toString()));
//     }
//   }

//   // 🔹 REGISTER
//   Future<void> register(
//     String name,
//     String phone,
//     String gender,
//     String nationalId,
//     String email,
//     String password,
//   ) async {
//     try {
//       emit(AuthLoading());

//       final response = await authData.register(
//         name: name,
//         phone: phone,
//         gender: gender,
//         nationalId: nationalId,
//         email: email,
//         password: password,
//       );

//       // 🔥 أهم حاجة هنا
//       print("========== REGISTER RESPONSE ==========");
//       print(response);
//       print("=======================================");

//       final token = response['user']?['token'] ?? response['token'];

//       if (token != null) {
//         emit(AuthSuccess(data: response));
//       } else {
//         emit(
//           AuthError(
//             error:
//                 response['message']?.toString() ??
//                 response['error']?.toString() ??
//                 "Register failed",
//           ),
//         );
//       }
//     } catch (e) {
//       print("REGISTER ERROR: $e");
//       emit(AuthError(error: e.toString()));
//     }
//   }
// }
