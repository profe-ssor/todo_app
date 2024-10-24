import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart'; // Import the email_validator package

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // Login Credentials
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // appBar: AppBar(
      //   title: Padding(
      //     padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      //     child: const Text(
      //       'Sign Up Here',
      //       style: TextStyle(
      //           color: Colors.white70,
      //           fontSize: 28.0,
      //           fontWeight: FontWeight.bold,
      //           letterSpacing: 2.0
      //       ),
      //       ),
      //   ),
      //     backgroundColor: Colors.blueGrey,
      //   centerTitle: true,
      // ),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
          child: Form(
            
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Sign Up Here',
            style: TextStyle(
               
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0
            ),
            ),
           const SizedBox(height: 16.0),
                Container(
                  
                  width: double.infinity,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!EmailValidator.validate(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value != password) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        confirmPassword = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle sign-up logic
                      print('Email: $email');
                      print('Password: $password');
                      Navigator.pushNamed(context, '/login');
                    }
                  },
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('Already have an account? Log in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
