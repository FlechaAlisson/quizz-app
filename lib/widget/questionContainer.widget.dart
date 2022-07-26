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
  Widget build(BuildContext context) {
    final QuestionController survey = Provider.of<QuestionController>(context);

    return survey.listQuestions!.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.background,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ///
                Text(
                  survey.listQuestions![survey.currentQuestion - 1].question ??
                      '@Question',
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontSize: 24,
                  ),
                ),

                const SizedBox(height: 35),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.secondary,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: survey
                            .listQuestions![survey.currentQuestion - 1]
                            .options!
                            .length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: _itemBuilder,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final QuestionController survey = Provider.of<QuestionController>(context);
    return Column(
      children: [
        GestureDetector(
          onTap: () => survey.answer(index),
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: survey.listQuestions![survey.currentQuestion - 1].answer ==
                      index
                  ? AppColors.primary.withOpacity(0.15)
                  : Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  survey.listQuestions![survey.currentQuestion - 1]
                      .options![index].option!,
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontSize: 24,
                  ),
                ),
                Icon(
                  survey.listQuestions![survey.currentQuestion - 1].answer ==
                          index
                      ? CupertinoIcons.circle_fill
                      : CupertinoIcons.circle,
                  color: survey.listQuestions![survey.currentQuestion - 1]
                              .answer ==
                          index
                      ? AppColors.primary
                      : AppColors.secondary,
                )
              ],
            ),
          ),
        ),
        if (index !=
            (survey.listQuestions?[survey.currentQuestion - 1].options
                        ?.length ??
                    0) -
                1)
          Container(
            color: AppColors.secondary,
            height: 1,
          )
      ],
    );
  }
}
