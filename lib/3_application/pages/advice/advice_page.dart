import 'package:dfg/3_application/core/manager/values_manager.dart';
import 'package:dfg/3_application/core/services/theme_service.dart';
import 'package:dfg/3_application/pages/advice/cubit/advice_cubit.dart';
import 'package:dfg/3_application/pages/advice/widgets/advice_error.dart';
import 'package:dfg/3_application/pages/advice/widgets/advice_initial.dart';
import 'package:dfg/3_application/pages/advice/widgets/advice_loaded.dart';
import 'package:dfg/3_application/pages/advice/widgets/advice_loading.dart';
import 'package:dfg/3_application/pages/advice/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    final controller = Provider.of<ThemeService>(context);
    final cubit = context.watch<AdviceCubit>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
              value: controller.isdarkmode,
              onChanged: (_) {
                //this action will change or toggle the theme
                controller.toggletheme();
              })
        ],
        centerTitle: true,
        title: Text(
          'Advicer',
          //using centralized theme
          style: themedata.textTheme.headline1,
        ),
      ),
      body: Padding(
        //here iam using padding from  apppadding in values manager
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.hp50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: cubit.state is AdviceInitialstate
                    ? const AdviceInitial()
                    : cubit.state is Adviceloadingstate
                        ? const AdviceLoading()
                        : cubit.state is Adviceloadedstate
                            ? const AdviceLoaded()
                            : const AdviceError()),
            const SizedBox(height: 200, child: Center(child: CustomButton()))
          ],
        ),
      ),
    );
  }
}
