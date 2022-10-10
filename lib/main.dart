import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_news/cubit/cubit.dart';
import 'package:my_app_news/cubit/state.dart';
import 'package:my_app_news/shared/netowrk/locale/CacheHelper.dart';

import 'layout/lightDarkMod/lightdark.dart';
import 'shared/netowrk/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  bool? isDark = CacheHelper.GetSaveData(key: 'Is_dark');
  runApp(MyApp(isDark ?? false));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBussinusData()
            ..getSearcheData()
            ..getSportsData()
            ..getscienceData()
            ..gettechnologyData()
            ..ChangeAppMode(fromShared: isDark),
        )
      ],
      child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return DarkLightMod(context);
          }),
    );
  }
}
