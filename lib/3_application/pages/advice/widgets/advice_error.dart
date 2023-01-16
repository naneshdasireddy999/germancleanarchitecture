import 'package:dfg/3_application/pages/advice/cubit/advice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdviceError extends StatelessWidget {
  const AdviceError({super.key});

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    final cubit = context.watch<AdviceCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          size: 48,
          color: Colors.redAccent,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          cubit.errormessage,
          style: themedata.textTheme.headline1,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
