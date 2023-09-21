import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';

import '../../../Features/HomeTest/Data/user.dart';
part 'apiservice.g.dart';

@RestApi(baseUrl: "https://gorest.co.in/public/v2/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("users")
  Future<List<User>> getData();
  //if id name in api dont same id in my code must @Path('id same api') like @JsonKey(name:'')
  @GET('users/{id}')
  Future<User> getUserDetils(@Path('id') int id);


  @POST("users")
  Future<User> createUser(@Body() User NewUser,@Header('Authorization') String token);

  @DELETE("users/{id}")
  Future<dynamic> deleteUser(@Path() int id ,@Header('Authorization') String token );


}

