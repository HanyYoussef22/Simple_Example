import 'package:api/Features/HomeTest/Data/repo/homeRepoImplem.dart';
import 'package:api/Features/HomeTest/Data/user.dart';
import 'package:api/core/utils/api_servise/api_resilt/api_result.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.homeRepo) : super(UserInitial());
  HomeRepoImplem homeRepo;
  List<User> ListUser = [];

  Future<void> getUser() async {
    await homeRepo.getData().then((ListUser) {
      emit(UserLoading());
      ListUser.fold((failure) {
        emit(UserFailer(failure.errorMessage.toString()));
      }, (r) {
        emit(UserSecusse(r));
        this.ListUser = r;
      });
    });
  }

  Future<void> getUserDetils(int id) async {
    await homeRepo.getUserDetils(id).then((ListUser) {
      emit(UserLoading());
      ListUser.fold((failure) {
        emit(UserFailer(failure.errorMessage.toString()));
      }, (r) {
        emit(UserDetilsSecusse(r));
      });
    });
  }

  Future<void> creatUser(User newUser) async {
    await homeRepo.createUser(newUser).then((newUser) {
      emit(UserLoading());
      newUser.fold((failure) {
        emit(UserFailer(failure.errorMessage.toString()));
      }, (r) {
        emit(creatUserSecusse(r));
      });
    });
  }

  Future<void> deleteUser(int userId) async {
    await homeRepo.deleteUser(userId).then((data) {
      emit(UserLoading());
      data.fold((failure) {
        emit(UserFailer(failure.errorMessage.toString()));
      }, (r) {
        emit(UserDelete(data));
      });
    });
  }
}
