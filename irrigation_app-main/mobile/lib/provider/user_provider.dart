import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irrigation_app/model/user_model.dart';
import 'package:irrigation_app/services/user_service.dart';
import 'package:irrigation_app/utils/preferences.dart';

class UserController extends GetxController {
  final RxBool isLoggingIn = false.obs;
  final UserService _userService = UserService();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Rx<UserInfo> userInformation =
      UserInfo(Username: "", ID: "", Role: "", Password: "").obs;

  Future<void> authenticate() async {
    try {
      if (usernameController.value.text == "" ||
          passwordController.value.text == '') {
        Get.snackbar('Form Error', 'All fields are required');
        return;
      }
      isLoggingIn.value = true;
      Map body = {
        "username": usernameController.value.text,
        "password": passwordController.value.text,
      };
      final user = await _userService.login(body);
      if (user != null) {
        final userInfo = UserInfo.fromJson(user['userInfo']).toJson();

        setItem('userInfo', jsonEncode(userInfo));
        setIsLoggedIn('isLoggedIn', true);
        await getSharedPrefUserInfo();
        // Get.off(() => const DashboardPage());
      } else {
        Get.snackbar('Login Failed', 'Invalid email or password',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoggingIn.value = false;
    }
  }

  Future<void> getSharedPrefUserInfo() async {
    final info = await getItem('userInfo');
    if (info != null) {
      Map<String, dynamic> valueMap = jsonDecode(info);
      UserInfo userInfo = UserInfo.fromJson(valueMap);
      userInformation.value = userInfo;
    }
  }
}
