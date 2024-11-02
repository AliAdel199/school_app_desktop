
import 'package:flutter/material.dart';
import 'package:school_app_desktop/constant.dart';

import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      String email = _emailController.text;
      String password = _passwordController.text;
      Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
      print('Logging in with email $email');
    }
  }

  void _navigateToPasswordRecovery() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PasswordRecoveryScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/loginbg.jpg"),fit: BoxFit.cover)),
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Adaptive width for larger screens
              double maxWidth = constraints.maxWidth > 600 ? 500 : constraints.maxWidth * 0.8;
        
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    width: maxWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                         BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(Icons.lock_outline, size: 100, color:secondaryColor),
                        const SizedBox(height: 24),
                        const Text(
                          'Welcome Back!',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Login to your account',
                          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                        ),
                        const SizedBox(height: 32),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: _navigateToPasswordRecovery,
                            child: const Text('Forgot Password?'),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(backgroundColor: secondaryColor,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Login', style: TextStyle(fontSize: 18,color: Color(0xffeeeeee))),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PasswordRecoveryScreen extends StatefulWidget {
  @override
  _PasswordRecoveryScreenState createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _recoverPassword() {
    if (_formKey.currentState?.validate() ?? false) {
      String email = _emailController.text;
      print('Sending password recovery to $email');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recover Password'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Container(
              width: 500,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(Icons.email_outlined, size: 100, color:secondaryColor),
                  const SizedBox(height: 24),
                  const Text(
                    'Recover Your Password',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Enter your email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _recoverPassword,
                    style: ElevatedButton.styleFrom(backgroundColor: secondaryColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Recover Password', style: TextStyle(fontSize: 18,color: Color(0xffeeeeee)),),
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
