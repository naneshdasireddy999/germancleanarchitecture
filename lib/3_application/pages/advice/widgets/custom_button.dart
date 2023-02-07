import 'package:dfg/3_application/core/manager/values_manager.dart';
import 'package:dfg/3_application/pages/advice/cubit/advice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AdviceCubit>();
    final themedata = Theme.of(context);
    return InkResponse(
      onTap: () {
        //this will just consult cubit method to get advice(here using state management)
        cubit.getadvice();
      },
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: themedata.colorScheme.secondary),
          child: Padding(
            //here iam using padding from  apppadding in values manager
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.hp10, vertical: AppPadding.vp15),
            child: Text(
              'get advice',
              //this will use centralized theme service
              style: themedata.textTheme.headline1,
            ),
          ),
        ),
      ),
    );
  }
}
