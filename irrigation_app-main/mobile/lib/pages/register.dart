import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irrigation_app/pages/login.dart';
import 'package:irrigation_app/provider/user_provider.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/bg_1.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.6),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: size.height * 0.3,
                      child: Image.asset(
                        'assets/images/LOGO_1152x2.png',
                        height: 200,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Takulandilani',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildTextField(
                      controller: _userController.usernameController,
                      icon: Icons.person_2_rounded,
                      hintText: 'Username',
                      obscureText: false,
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _userController.passwordController,
                      icon: Icons.lock,
                      hintText: 'Password',
                      obscureText: true,
                      inputAction: TextInputAction.done,
                      inputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          await _userController.authenticate();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(139, 195, 74, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 32),
                          child: Obx(
                            () => _userController.isLoggingIn.value
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text(
                                    'Sign In',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 4),
                        TextButton(
                          onPressed: () {
                            // Implement create an account functionality
                            Get.to(() => LoginPage());
                          },
                          child: const Text(
                            'Create a Farm',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(139, 195, 74, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required IconData icon,
      required String hintText,
      required TextInputAction inputAction,
      required TextInputType inputType,
      required bool obscureText}) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      obscureText: obscureText,
      textInputAction: inputAction,
      style: TextStyle(color: Colors.grey[500]),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.grey[500],
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
        filled: true,
        fillColor: const Color.fromARGB(255, 23, 23, 23),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
