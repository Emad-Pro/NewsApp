import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_news/cubit/cubit.dart';
import 'package:my_app_news/cubit/state.dart';
import '../shared/comonents/componens.dart';

class NewsLayout extends StatelessWidget {
  var SearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var varcubit = NewsCubit.get(context);

          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.search),
              onPressed: () {
                varcubit.getSearcheData();
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    FloatingActionButtonLocation.miniStartTop;
                    return BlocConsumer<NewsCubit, NewsState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          var ListSearch = varcubit.Search;
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsetsDirectional.only(
                                      top: 45, bottom: 20),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Column(
                                        children: [
                                          Text("للاغلاق اسحب لإسفل"),
                                          Icon(Icons.arrow_downward),
                                        ],
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      bottom: 20, start: 20, end: 20),
                                  child: defulttextformfild(
                                    context: context,
                                    onchanged: (value) {
                                      varcubit.getSearcheData(value: value);
                                    },
                                    controllerad: SearchController,
                                    labeltext: "البحث",
                                    prifixicon: Icon(Icons.search),
                                    type: TextInputType.text,
                                    valid: (String? value) {
                                      if (value!.isEmpty) {
                                        return "البحث فارغ";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Expanded(
                                    child: ArticleBuilder(ListSearch, context,
                                        isSearch: true)),
                              ],
                            ),
                          );
                        });
                  },
                );
              },
            ),
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  " أخباري",
                  style: TextStyle(
                    fontFamily: 'ElMessiri',
                  ),
                ),
              ),
              actions: [
                IconButton(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    splashRadius: 20,
                    onPressed: () {
                      NewsCubit.get(context).ChangeAppMode();
                    },
                    icon: NewsCubit.get(context).Is_dark
                        ? NewsCubit.get(context).icondark
                        : NewsCubit.get(context).iconlight),
              ],
            ),
            body: varcubit.screen[varcubit.CurrentIndex],
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor:
                  varcubit.Is_dark ? Colors.black : Colors.white,
              selectedItemColor: Colors.blue,
              items: varcubit.BottomItems,
              currentIndex: varcubit.CurrentIndex,
              onTap: (index) async {
                varcubit.ChangeBottomNavBar(index);
              },
            ),
          );
        });
  }
}
