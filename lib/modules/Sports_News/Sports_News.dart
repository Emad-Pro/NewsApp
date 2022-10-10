import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_news/cubit/cubit.dart';
import 'package:my_app_news/cubit/state.dart';

import '../../../../shared/comonents/componens.dart';

class SportsNews extends StatelessWidget {
  const SportsNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (BuildContext, NewsState) {},
        builder: (BuildContext context, state) {
          var listSports = NewsCubit.get(context).Sports;
          return ArticleBuilder(listSports, context);
        });
  }
}
