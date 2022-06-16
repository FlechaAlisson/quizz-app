import 'package:flutter/material.dart';
import 'package:quizz/utils/appColors.utils.dart';
import 'package:quizz/widget/button.widget.dart';
import 'package:quizz/widget/questionContainer.widget.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({Key? key, required this.page}) : super(key: key);

  final int page;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: <Color>[
            AppColors.primaryGradientColor,
            AppColors.secondaryGrandientColor,
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          toolbarHeight: 0,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(32),
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Pergunta $page:',
                  style: TextStyle(
                    color: AppColors.primaryWhiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 35,
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: AppColors.primaryWhiteColor,
                ),
                const SizedBox(height: 32),
                const QuestionContainer(),
                const SizedBox(height: 32),
                Center(
                    child: PrimaryButton(
                  text: 'próximo',
                  onTap: () {},
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
