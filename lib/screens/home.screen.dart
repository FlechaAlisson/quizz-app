import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/controllers/user.controller.dart';
import 'package:quizz/screens/qr_scanner.screen.dart';
import 'package:quizz/utils/appColors.utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    UserController user = Provider.of<UserController>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppColors.primary,
              ),
              child: _profileWidget(user),
              height: 100,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              ///
              SizedBox(height: 16),
            ],
          ),
        ),
        floatingActionButton: _floatingButton(),
      ),
    );
  }

  Padding _profileWidget(UserController user) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ///
          _nameText(user),

          const SizedBox(width: 35),

          _imageContainer(user)
        ],
      ),
    );
  }

  FloatingActionButton _floatingButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const QrScannerScreen(),
          ),
        );
      },
      backgroundColor: AppColors.primary,
      child: const Icon(Icons.photo_camera),
    );
  }

  Column _nameText(UserController user) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///
          Text.rich(
            TextSpan(
              text: 'Olá, ',
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.background,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: user.data?.name ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 2),

          const Text(
            'Responda e ganhe mais cupons',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.background,
            ),
          ),
        ],
      );

  ClipRRect _imageContainer(UserController user) => ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          user.data?.photoUrl ?? '',
          height: 75,
        ),
      );
}
