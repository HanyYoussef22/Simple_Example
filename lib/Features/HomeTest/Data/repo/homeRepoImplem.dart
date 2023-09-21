import 'package:api/Features/HomeTest/Data/user.dart';
import 'package:api/core/utils/api_servise/apiservice.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/api_servise/errors/failures.dart';
import 'homeRepo.dart';

class HomeRepoImplem implements HomeRepo {
  HomeRepoImplem(this.apiService);

  ApiService apiService;

  @override
  Future<Either<Failure, List<User>>> getData() async {
    try {
      // var response = await apiService.getData();
      // return response
      //     .map((userObject) => User.fromJson(userObject.toJson()))
      //     .toList();
      var resilt = await apiService.getData();
      return right(resilt);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getUserDetils(int id) async {
    try {
      // var response = await apiService.getUserDetils(id);
      // return User.fromJson(response.toJson());
      var resilt = await apiService.getUserDetils(id);
      return right(resilt);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> createUser(User newUser) async {
    try {
      var resilt = await apiService.createUser(newUser,
          'Bearer 95e030e7f18f829c69c8385bac6b36c9e9f6491263cac24f50b1b654f60a66af');
      return right(resilt);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteUser(int id) async {
    try {
      var resilt = await apiService.deleteUser(id,
          'Bearer 95e030e7f18f829c69c8385bac6b36c9e9f6491263cac24f50b1b654f60a66af');
      return right(resilt);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
