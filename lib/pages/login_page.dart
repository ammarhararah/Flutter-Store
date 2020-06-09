import 'package:ammar/pages/register_page.dart';
import 'package:ammar/widgets/button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 32),
                Text(
                  'Login',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 32),
                TextFormField(
                  controller: emailController,
                  focusNode: emailNode,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    emailNode.unfocus();
                    passwordNode.requestFocus();
                  },
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if ((value?.isEmpty ?? true) || !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: passwordController,
                  focusNode: passwordNode,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock_open,
                      color: Theme.of(context).primaryColor,
                    ),
                    suffixIcon: IconButton(
                      padding: const EdgeInsets.only(right: 16),
                      icon: Icon(
                        _hidePassword
                            ? Icons.remove_red_eye
                            : Icons.panorama_fish_eye,
                        color: Theme.of(context).primaryColor,
                      ),
                      splashColor: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          _hidePassword = !_hidePassword;
                        });
                      },
                    ),
                  ),
                  onFieldSubmitted: (_) {
                    passwordNode.unfocus();
                    _formKey.currentState.validate();
                  },
                  obscureText: _hidePassword,
                  validator: (value) {
                    if ((value?.isEmpty ?? true) || value.length < 6) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32),
                Button(
                  text: 'Login',
                  onTap: () {
                    _formKey.currentState.validate();
                  },
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Don\'t have an account?'),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => RegisterPage()));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
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
    );
  }
}
