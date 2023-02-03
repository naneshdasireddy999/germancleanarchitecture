import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdviceLoading extends StatelessWidget {
  const AdviceLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Center(
      child: CircularProgressIndicator(
        //color is using from centralized theme
        color: themedata.colorScheme.secondary,
      ),
    );
  }
}
