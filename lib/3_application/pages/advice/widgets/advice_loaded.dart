import 'package:dfg/3_application/pages/advice/cubit/advice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdviceLoaded extends StatelessWidget {
  const AdviceLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AdviceCubit>();
    final themedata = Theme.of(context);
    return Center(
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: themedata.colorScheme.onPrimary),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Text(
              cubit.myadvice.advice,
              style: themedata.textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
