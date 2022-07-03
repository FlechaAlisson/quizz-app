import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:quizz/controllers/user.controller.dart';
import 'package:quizz/utils/appColors.utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: AppColors.background,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///
              const Text(
                'Nome app',
                style: TextStyle(
                  color: AppColors.body,
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  decoration: TextDecoration.none,
                ),
              ),

              const SizedBox(height: 32),

              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .75,
                  child: _loginButton(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    UserController user = Provider.of<UserController>(context);
    return InkWell(
      onTap: () async {
        await user.googleLogin();
        Phoenix.rebirth(context);
      },
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.shape,
          borderRadius: BorderRadius.circular(5),
          border: const Border.fromBorderSide(
            BorderSide(
              color: AppColors.stroke,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 56,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: AppColors.stroke,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 2, right: 2),
                child: Image.asset('images/google.png'),
              ),
            ),
            const Expanded(
              flex: 4,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Enter with Google',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
