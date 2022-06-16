import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:quizz/controllers/user.controller.dart';
import 'package:quizz/model/user/user.model.dart';
import 'package:quizz/screens/login.screen.dart';
import 'package:quizz/screens/question_page.screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  initState() {
    UserController user = Provider.of<UserController>(context, listen: false);
    UserModel? userModel;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userModel = user.getUserData();

      if (userModel == null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const QuestionPage(
              page: 1,
            ),
          ),
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
