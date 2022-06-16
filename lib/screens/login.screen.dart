import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/controllers/user.controller.dart';
import 'package:quizz/widget/button.widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController user = Provider.of<UserController>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Quizz App'),
            Center(
              child: SizedBox(
                width: 300,
                child: PrimaryButton(
                  text: 'Login',
                  onTap: () {
                    user.googleLogin();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
