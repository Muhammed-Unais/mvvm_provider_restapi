import 'package:flutter/material.dart';
import 'package:mvvm_sampler/components/app_loading.dart';
import 'package:mvvm_sampler/users_list/view_models/user_view_model.dart';
import 'package:mvvm_sampler/utils/navigation_utils.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, adduser);
              
            },
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _ui(userViewModel),
        ],
      ),
    );
  }

  _ui(UserViewModel userViewModel) {
    if (userViewModel.loading) {
      return const AppLoading();
    }
    if (userViewModel.userError != null) {
      return Container();
    }
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          final userData = userViewModel.userlist[index];
          return ListTile(
            title: Text(
              userData.name,
              style: const TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              userData.email,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              userViewModel.setSaprateUser(userData);
              Navigator.pushNamed(context, detailsRoute);
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: userViewModel.userlist.length,
      ),
    );
  }
}
