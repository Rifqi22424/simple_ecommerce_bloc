import 'package:flutter/material.dart';

import '../consts/app_styles.dart';

class ThanksDialog extends StatelessWidget {
  const ThanksDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      title: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_outline,
            color: Colors.blue,
            size: 60,
          ),
          SizedBox(height: 10),
          Text(
            "Thankyou!",
            textAlign: TextAlign.center,
            style:AppStyles.h4
          ),
        ],
      ),
      content: const Text(
        "Your order has been received and we will process it immediately.",
        textAlign: TextAlign.center,
        style: AppStyles.paragraph
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            backgroundColor: Colors.blue,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Close",
            style: AppStyles.whiteH6
          ),
        ),
      ],
    );
  }
}
