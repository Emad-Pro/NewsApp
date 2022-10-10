import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../cubit/cubit.dart';
import '../../shared/color/Colors.dart';
import '../news_layout.dart';

colorsNewApp colorUse = colorsNewApp();
Widget DarkLightMod(context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true).copyWith(
          textTheme:
              ThemeData.light().textTheme.apply(fontFamily: "ElMessiri")),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
          textTheme: ThemeData.dark().textTheme.apply(fontFamily: "ElMessiri")),
      themeMode:
          NewsCubit.get(context).Is_dark ? ThemeMode.light : ThemeMode.dark,
      home:
          Directionality(textDirection: TextDirection.rtl, child: NewsLayout()),
    );
