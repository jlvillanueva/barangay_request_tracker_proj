// ignore_for_file: strict_top_level_inference, use_build_context_synchronously

import 'package:barangay_request_tracker/src/constants/functions.dart';
import 'package:barangay_request_tracker/src/features/auth/logic/cubit/cubit_auth.dart';
import 'package:barangay_request_tracker/src/features/auth/logic/models/input/mod_auth_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/';
  static route() => MaterialPageRoute(builder: (_) => const LoginScreen());


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Barangay Request Tracker',
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value) {
                  function.hashMD5(value).then((hashed) {
                    setState(() {
                      password = hashed;
                    });
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () async {
                  // Call AuthCubit to authenticate
                  final bloc = context.read<AuthCubit>();
                  if (username.isEmpty && password.isEmpty) {
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Username and Password cannot be empty.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    });
                    return;
                  } else {
                    await bloc.authenticate(AuthFields(username: username, password: password));
                  }
                },
                child: const Text('Login'),
              ),
            ),
          ],
        ),
    );
  }
}