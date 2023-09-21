import 'package:api/Features/HomeTest/Data/user.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/api_servise/errors/failures.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<User>>>getData();
  Future<Either<Failure,User>>getUserDetils(int id);
  Future<Either<Failure,User>>createUser(User nweUser);
  Future<Either<Failure,dynamic>>deleteUser(int id);
}


// Future<Either<Failure,List<ModelBook>>>