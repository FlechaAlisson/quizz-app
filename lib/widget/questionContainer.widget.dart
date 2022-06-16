import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/controllers/question.controller.dart';

import 'package:quizz/utils/appColors.utils.dart';

class QuestionContainer extends StatefulWidget {
  const QuestionContainer({Key? key}) : super(key: key);

  @override
  State<QuestionContainer> createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {
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

    return survey.listQuestions!.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primaryBackgroundColor,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    survey.listQuestions![0].question ?? '@Question',
                    style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontSize: 24,
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: survey.listQuestions![0].options!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: _itemBuilder,
                  ),
                ],
              ),
            ),
          );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final QuestionController survey = Provider.of<QuestionController>(context);
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryGreenColor,
              width: 2,
            ),
            color: survey.listQuestions![0].answer == index
                ? AppColors.primaryGreenColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                survey.listQuestions![0].options![index].option!,
                style: TextStyle(
                  color: survey.listQuestions![0].answer == index
                      ? Colors.white
                      : AppColors.primaryGreenColor,
                  fontSize: 24,
                ),
              ),
              Icon(
                survey.listQuestions![0].answer == index
                    ? CupertinoIcons.check_mark_circled
                    : CupertinoIcons.circle,
                color: survey.listQuestions![0].answer == index
                    ? Colors.white
                    : AppColors.primaryGreenColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
