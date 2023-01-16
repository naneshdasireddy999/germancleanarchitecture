import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdviceInitial extends StatelessWidget {
  const AdviceInitial({super.key});

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Center(
      child: Text(
        'your advice is waiting for you',
        style: themedata.textTheme.headline1,
      ),
    );
  }
}
