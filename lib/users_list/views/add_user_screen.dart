import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_sampler/users_list/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async{
              log("=================pppppppppppppppp===========================dkjk============");
              bool userAdded = await userViewModel.setAddnewUser();
              if (!userAdded) {
                 
                return;
              }
              log("=================ppppppppppppppppdkjk============");
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: "Name",
              ),
              onChanged: (value) {
                userViewModel.addingnewUser?.name = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: "email",
              ),
              onChanged: (value) {
                userViewModel.addingnewUser?.email = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
