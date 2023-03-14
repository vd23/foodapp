import 'package:amazon_clone_app/commom/widgets/custom_button.dart';
import 'package:amazon_clone_app/commom/widgets/custom_textfield.dart';
import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _sigUpFormKey = GlobalKey<FormState>();
  final _sigInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Welcome',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          ListTile(
            tileColor: _auth == Auth.signup
                ? const Color.fromARGB(255, 249, 247, 247)
                : GlobalVariables.greyBackgroundColor,
            title: const Text(
              'Create Account',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Radio(
              activeColor: GlobalVariables.secondryColor,
              value: Auth.signup,
              groupValue: _auth,
              onChanged: (Auth? val) {
                setState(() {
                  _auth = val!;
                });
              },
            ),
          ),
          if (_auth == Auth.signup)
            Container(
              padding: const EdgeInsets.all(8),
              color: const Color.fromARGB(255, 252, 252, 252),
              child: Form(
                key: _sigUpFormKey,
                child: Column(
                  children: [
                    CustomTextfield(
                      controller: _nameController,
                      hintText: ' Name',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(
                      controller: _emailController,
                      hintText: ' Email',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(
                      controller: _passwordController,
                      hintText: ' Password',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      text: 'Sign Up',
                      onTap: () {
                        if (_sigUpFormKey.currentState!.validate()) {
                          signUpUser();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ListTile(
            tileColor: _auth == Auth.signup
                ? GlobalVariables.backgroundColor
                : GlobalVariables.greyBackgroundColor,
            title: const Text(
              'Sign-In',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Radio(
              activeColor: GlobalVariables.secondryColor,
              value: Auth.signin,
              groupValue: _auth,
              onChanged: (Auth? val) {
                setState(() {
                  _auth = val!;
                });
              },
            ),
          ),
          if (_auth == Auth.signin)
            Container(
              padding: const EdgeInsets.all(8),
              color:const Color.fromARGB(255, 255, 254, 254),
              child: Form(
                key: _sigInFormKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(
                      controller: _emailController,
                      hintText: 'Enter Email',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(
                      controller: _passwordController,
                      hintText: 'Enter Password',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      text: 'Sign In',
                      onTap: () {
                        if (_sigInFormKey.currentState!.validate()) {
                          signInUser();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    )));
  }
}
