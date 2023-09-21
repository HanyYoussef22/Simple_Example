
import 'package:flutter/material.dart';

import '../../../../../../core/utils/style/styles.dart';

class TitelScreen extends StatelessWidget {
  final String Text1;
  final String Text2;

  const TitelScreen({super.key, required this.Text1, required this.Text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Text1,
          style: Styles.titleStyle30,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          Text2,
          style: Styles.titleStyle18o,
        ),
      ],
    );
  }
}
