import 'package:ammar/pages/login_page.dart';
import 'package:ammar/widgets/button.dart';
import 'package:flutter/material.dart';

enum Type {
  Merchant,
  Client,
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode nameNode = FocusNode();
  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  bool _hidePassword = true;
  Type type;

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
                  'Sign Up',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 32),
                TextFormField(
                  controller: nameController,
                  focusNode: nameNode,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    nameNode.unfocus();
                    emailNode.requestFocus();
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter a valid name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),
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
                SizedBox(height: 8),
                DropdownButton(
                  hint: Text('Type'),
                  icon: Icon(Icons.keyboard_arrow_down),
                  value: type,
                  onChanged: (value) {
                    setState(() {
                      type = value;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      child: Text('Merchant'),
                      value: Type.Merchant,
                    ),
                    DropdownMenuItem(
                      child: Text('Client'),
                      value: Type.Client,
                    ),
                  ],
                  isExpanded: true,
                ),
                SizedBox(height: 32),
                Button(
                  text: 'Sign Up',
                  onTap: () {
                    _formKey.currentState.validate();
                  },
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Already have an account?'),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => LoginPage()));
                      },
                      child: Text(
                        'Sign In',
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
