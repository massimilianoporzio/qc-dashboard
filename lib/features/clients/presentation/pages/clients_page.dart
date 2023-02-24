import 'package:flutter/material.dart';

import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/widgets/custom_text.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark,
      child: const Center(
        child: CustomText(text: 'Clients'),
      ),
    );
  }
}
