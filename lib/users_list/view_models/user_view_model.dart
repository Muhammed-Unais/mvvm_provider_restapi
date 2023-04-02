import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mvvm_sampler/users_list/models/user_error.dart';
import 'package:mvvm_sampler/users_list/models/user_model.dart';
import 'package:mvvm_sampler/users_list/repo/api_status.dart';
import 'package:mvvm_sampler/users_list/repo/user_services.dart';

class UserViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userlist = [];
  UserError? _userError;
  UserModel? _saparateUser;
  UserModel? _addingnewUser;

  bool get loading => _loading;

  List<UserModel> get userlist => _userlist;

  UserError? get userError => _userError;

  UserModel? get saparateUser => _saparateUser;

  UserModel? get addingnewUser => _addingnewUser;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setUserdata(List<UserModel> userModel) {
    _userlist = userModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  setSaprateUser(UserModel userModel) {
    _saparateUser = userModel;
  }

   setAddnewUser() async{
    if (!isValid()) {
      log("=================dfmlkf===========================dkjk============");
      return;
    }
    _userlist.add(addingnewUser!);
    log("==================45567");
    notifyListeners();
    return true;
  }

  isValid() {
    if (addingnewUser?.name == null || addingnewUser!.name.isEmpty) {
      return false;
    }
    if (addingnewUser?.email == null || _addingnewUser!.email.isEmpty) {
      return false;
    }
    return true;
  }

  getUser() async {
    setLoading(true);
    final response = await UserServices.getUser();
    if (response is Success) {
      setUserdata(response.response as List<UserModel>);
    }

    if (response is Failure) {
      UserError userError =
          UserError(code: response.code, message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }

  UserViewModel() {
    getUser();
  }
}
