import 'package:dfg/3_application/pages/advice/advice_page.dart';
import 'package:dfg/3_application/pages/advice/cubit/advice_cubit.dart';
import 'package:dfg/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Approutes {
  static final tc = sl<AdviceCubit>();

  static Map<String, Widget Function(BuildContext)> myroutes() {
    return {
      '/': (context) => BlocProvider<AdviceCubit>.value(
            value: tc,
            child: const AdvicePage(),
          ),
    };
  }
}
