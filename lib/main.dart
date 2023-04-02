import 'package:flutter/material.dart';
import 'package:mvvm_sampler/users_list/views/add_user_screen.dart';
import 'package:mvvm_sampler/users_list/views/home_screen.dart';
import 'package:mvvm_sampler/users_list/view_models/user_view_model.dart';
import 'package:mvvm_sampler/users_list/views/user_details_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserViewModel(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
          ),
        ),
        initialRoute: "/home",
        routes: {
          "/home":(context) => const MyHomePage(title: "'MVVM Sample Project'"),
          "/details":(context) => const UserDetailsScren(),
          "/adduser":(context) => const AddUserScreen()
        }
      ),
    );
  }
}
