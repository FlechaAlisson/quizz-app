import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quizz/model/cupom.model.dart';
import 'package:quizz/utils/appColors.utils.dart';

void showCupomModal(BuildContext context, CupomModel? cupom) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) => CupomModal(cupom: cupom),
  );
}

class CupomModal extends StatelessWidget {
  const CupomModal({Key? key, required this.cupom}) : super(key: key);
  final CupomModel? cupom;

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(32, 28, 32, 22),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(11),
            topRight: Radius.circular(11),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///
            Text(
              cupom?.storeName ?? '',
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 8),

            Text('Válido até ${cupom?.valid}'),

            const SizedBox(height: 16),

            QrImage(
              data: "https://questionable.jesuisjedi.com/${cupom?.idHash}",
              version: QrVersions.auto,
              size: 200.0,
            ),

            const SizedBox(height: 32),

            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Text(
                'Fechar',
                style: TextStyle(
                  fontSize: 21,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      );
}
