import 'package:flutter/material.dart';
//Widgets
import 'package:chattery/widgets/custom_input_field.dart';
import 'package:chattery/widgets/rounded_button.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late double _deviceHeight;
  late double _deviceWidth;

  final _loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth * 0.03, vertical: _deviceHeight * 0.02),
        height: _deviceHeight * 0.98,
        width: _deviceWidth * 0.97,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _pageTitle(),
            SizedBox(height: _deviceHeight*0.04,),
            _loginForm(),
            SizedBox(height: _deviceHeight*0.05,),
            _loginButton(),
            SizedBox(height: _deviceHeight*0.02,),
            _registerAccountLink(),
          ],
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return Container(
      height: _deviceHeight * 0.10,
      child: Text(
        'Chattery',
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      height: _deviceHeight * 0.18,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextFormField(
                onSaved: (_value) {},
                regEx:
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                hintText: "Email",
                obscureText: false),
            CustomTextFormField(
                onSaved: (_value) {},
                regEx:
                r".{8,}",
                hintText: "Password",
                obscureText: true),
          ],
        ),
      ),
    );
  }
  Widget _loginButton(){
    return RoundedButton(name: "Login", height: _deviceHeight*0.065, width: _deviceWidth*0.65, onPressed: (){});
  }
  Widget _registerAccountLink(){
    return GestureDetector(
      onTap: (){},
      child: Container(
        child: Text(
          'Don\'t have an account?',style: TextStyle(color: Colors.purple[200]),
        ),
      ),
    );
  }
}
