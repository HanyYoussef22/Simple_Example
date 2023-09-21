import 'package:api/Features/HomeTest/Data/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/custem/custem_text_formFiled.dart';
import '../view_model/user_cubit.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController IDController = TextEditingController();
    TextEditingController NameController = TextEditingController();
    TextEditingController GenderController = TextEditingController();
    TextEditingController EmailController = TextEditingController();
    TextEditingController StateController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            // if (state is UserSecusse) {
            //   var user = state.user; // Get the user object from the state
            //   return ListView.builder(
            //     itemCount: user.length,
            //     itemBuilder: (context, index) {
            //       final userDetail = [
            //         "ID: ${user[index].id}",
            //         "Name: ${user[index].name ?? 'N/A'}",
            //         "Email: ${user[index].email ?? 'N/A'}",
            //         "Gender: ${user[index].gender ?? 'N/A'}",
            //         "Status: ${user[index].status ?? 'N/A'}",
            //       ];
            //
            //       return buildUserDetail(userDetail);
            //     },
            //   );
            // }
            if (state is UserLoading) {
              // Handle other states (e.g., loading or error) if needed
              return Center(
                child:
                CircularProgressIndicator(), // Show loading indicator or error message
              );
            }
            if (state is UserFailer) {
              // Handle other states (e.g., loading or error) if needed
              return Center(
                child:
               Text('${state.errMasge}')
              );
            }
            if (state is creatUserSecusse) {
              final userfDetail = [
                "ID: ${state.user.id}",
                "Name: ${state.user.name ?? 'N/A'}",
                "Email: ${state.user.email ?? 'N/A'}",
                "Gender: ${state.user.gender ?? 'N/A'}",
                "Status: ${ state.user.status?? 'N/A'}",
              ];
              return buildUserDetail(userfDetail);

            }
            if (state is UserDelete) {
              final userfDetail = [
                " ${state.data} ",
                // "Name: ${state.user.name ?? 'N/A'}",
                // "Email: ${state.user.email ?? 'N/A'}",
                // "Gender: ${state.user.gender ?? 'N/A'}",
                // "Status: ${ state.user.status?? 'N/A'}",
              ];
              return buildUserDetail(userfDetail);

            }
            else {
              return Column(
                children: [
                  // customField(controller: IDController, name: 'Enter Id ', validate:IdValidate),
                  customField(
                      controller: NameController,
                      name: 'Enter ID Uswe To Delete  ',
                      validate: IdValidate),
                  customField(
                      controller: GenderController,
                      name: 'Enter Gender ',
                      validate: IdValidate),
                  customField(
                      controller: EmailController,
                      name: 'Enter Email ',
                      validate: IdValidate),
                  // customField(
                  //     controller: StateController,
                  //     name: 'Enter State ',
                  //     validate: IdValidate),
                  Spacer(),
                  submitButton(
                      submitText: 'delete user',
                      onTap: () {
                        BlocProvider.of<UserCubit>(context).creatUser(User(
                            email: EmailController.text,
                            gender: GenderController.text,
                            name: NameController.text,
                            status: 'Active'));
                        // BlocProvider.of<UserCubit>(context).deleteUser(int.parse(IDController.text));
                      }),
                ],
              );
            }
          }),
      ),
    );
  }

  Widget buildUserDetail(List<String> details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: details
          .map((detail) => ListTile(
                title: Container(
                    height: 50, color: Colors.green, child: Text(detail)),
              ))
          .toList(),
    );
  }
}

String? IdValidate(text) {
  if (text!.isEmpty || text.trim().isEmpty) {
    return 'You must write Your Password';
  }
  if (text.length < 2) {
    return 'Password Enter Valid ';
  }
  return null;
}
