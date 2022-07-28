import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class BasePartialBuild<T extends BaseViewModel> extends HookViewModelWidget<T> {

  final Function(BuildContext, T) builder;

  BasePartialBuild({Key? key, required this.builder, reactive: false}) : super(key: key, reactive: reactive);

  @override
  Widget buildViewModelWidget(BuildContext context, T viewModel) => this.builder(context, viewModel);

}

class ReactivePartialBuild<T extends ReactiveViewModel> extends HookViewModelWidget<T> {

  final Function(BuildContext, T) builder;

  ReactivePartialBuild({Key? key, required this.builder, reactive: true}) : super(key: key, reactive: reactive);

  @override
  Widget buildViewModelWidget(BuildContext context, T viewModel) => this.builder(context, viewModel);

}