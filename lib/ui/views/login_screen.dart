import 'package:flutter/material.dart';
import 'package:provider_architecture/core/enums/view_state.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      onModelReady: (model) { /* Call something on the model */ },
        builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginHeader(controller: _controller, validationMessage: model.errorMessage,),
              model.state == ViewState.Busy
                  ? CircularProgressIndicator()
                  : FlatButton(
                  onPressed: () async{
                    var loginSuccess = await model.login(userIdValue: _controller.text);
                    if(loginSuccess){
                    //  If the login was successful we'd navigate to the home screen
                      Navigator.pushNamed(context, '/');
                    }
                  },
                  child: Text(
                      "Login",
                    style: TextStyle(color: Colors.black),
                  ),
              )
            ],
          ),
        ),
    );
  }
}