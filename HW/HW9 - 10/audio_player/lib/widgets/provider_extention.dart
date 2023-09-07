import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

extension ProviderExtension on Widget {
  Widget createWithProvider<T extends Bloc>() {
    return BlocProvider<T>(
      create: (context) => GetIt.instance.get(),
      child: this,
    );
  }

  Widget createWithMultiProviders<T extends Bloc>(
      List<BlocProvider> providers) {
    return MultiBlocProvider(
      providers: providers,
      child: this,
    );
  }
}
