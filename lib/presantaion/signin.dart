import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screening2/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:screening2/constants/const.dart';
import 'package:screening2/repositorys/auth_repo.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(authrepo: AuthRepo()),
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SiginSuccesstate) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Signin success'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context);
            } else if (state is AuthInitial) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Initial state'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          child: SignUpForm(),
        ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  final TextEditingController signupnamecontroller = TextEditingController();
  final TextEditingController signuppasscontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? selectedProfession;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Create Account',
                    style: headingstyle,
                  ),
                  const SizedBox(height: 20),
                  SignUpFormField(
                    controller: signupnamecontroller,
                    labelText: 'Username',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  SignUpFormField(
                    controller: signuppasscontroller,
                    labelText: 'Password',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  SignUpFormField(
                    controller: emailcontroller,
                    labelText: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  SignUpFormField(
                    controller: phonecontroller,
                    labelText: 'Phone',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Profession',
                      border: OutlineInputBorder(),
                    ),
                    value: selectedProfession,
                    items: const [
                      DropdownMenuItem(
                        child: Text('Doctor'),
                        value: 'Doctor',
                      ),
                      DropdownMenuItem(
                        child: Text('Engineer'),
                        value: 'Engineer',
                      ),
                      DropdownMenuItem(
                        child: Text('Teacher'),
                        value: 'Teacher',
                      ),
                    ],
                    onChanged: (value) {
                      selectedProfession = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your profession';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        final name = signupnamecontroller.text.trim();
                        final password = signuppasscontroller.text.trim();
                        context.read<AuthBloc>().add(SignunEvent(
                              password: password,
                              username: name,
                            ));
                      }
                    },
                    child: const Text('Sign Up'),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Already have an account? Sign in'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final String? Function(String?)? validator;

  const SignUpFormField({
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}
