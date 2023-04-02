import 'package:flutter/material.dart';
import 'package:mvvm_sampler/users_list/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

class UserDetailsScren extends StatelessWidget {
  const UserDetailsScren({super.key});

  @override
  Widget build(BuildContext context) {
    final userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details Screen",
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              userViewModel.saparateUser!.name,
            ),
            subtitle: Text(
              userViewModel.saparateUser!.email,
            ),
          )
        ],
      ),
    );
  }
}
