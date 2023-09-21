part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
class UserLoading extends UserState {}
class UserSecusse extends UserState {
  final List<User> user;
  UserSecusse(this.user);

}
class UserDetilsSecusse extends UserState {
  final User user;
  UserDetilsSecusse(this.user);

}
class creatUserSecusse extends UserState {
  final User user;
  creatUserSecusse(this.user);

}
class UserDelete extends UserState {
  final dynamic data;
  UserDelete(this.data);
}
class UserFailer extends UserState {
  final String errMasge;
  UserFailer(this.errMasge);


}

