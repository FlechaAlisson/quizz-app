import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'package:quizz/controllers/question.controller.dart';
import 'package:quizz/controllers/user.controller.dart';
import 'package:quizz/screens/home.screen.dart';
import 'package:quizz/utils/appColors.utils.dart';
import 'package:quizz/widget/button.widget.dart';
import 'package:quizz/widget/questionContainer.widget.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key, required this.page}) : super(key: key);

  final int page;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final QuestionController survey = Provider.of<QuestionController>(
        context,
        listen: false,
      );

      survey.loadSurvey();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final QuestionController survey = Provider.of<QuestionController>(context);
    return Container(
      decoration: const BoxDecoration(color: AppColors.background),
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
                ///
                Text(
                  'Pergunta ${survey.currentQuestion}:',
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w700,
                    fontSize: 35,
                  ),
                ),

                const SizedBox(height: 32),

                const QuestionContainer(),

                const SizedBox(height: 32),

                Center(
                    child: PrimaryButton(
                  text: 'próximo',
                  onTap: _nextStep,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _nextStep() {
    final QuestionController survey =
        Provider.of<QuestionController>(context, listen: false);
    if (survey.isLastQuestion()) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Você recebeu um cupom!"),
          content: const Text(
              "Parabéns, você realizou a nossa pesquisa e como recompensa recebeu um cupom com desconto."),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await _doPost();
                Phoenix.rebirth(context);
              },
              child: Container(
                color: AppColors.primary,
                padding: const EdgeInsets.all(14),
                child: const Text(
                  "Continuar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      survey.nextQuestion();
    }
  }

  _doPost() {
    final QuestionController survey =
        Provider.of<QuestionController>(context, listen: false);

    UserController user = Provider.of<UserController>(context, listen: false);

    survey.postSurvey(user.data?.id ?? '');
  }
}
