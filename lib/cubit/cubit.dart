// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_news/cubit/state.dart';
import 'package:my_app_news/shared/netowrk/locale/CacheHelper.dart';

import '../modules/Businus_News/Businus_News.dart';
import '../modules/Scince_News/Scince_News.dart';
import '../modules/Sports_News/Sports_News.dart';
import '../modules/TechNology_News/Technology_News.dart';
import '../shared/netowrk/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  List<Widget> screen = [
    const BusinusNews(),
    const SportsNews(),
    const ScinceNews(),
    const TechNews(),
  ];
  Icon iconlight = Icon(Icons.light_mode);
  Icon icondark = Icon(Icons.dark_mode);
  int CurrentIndex = 0;
  List<BottomNavigationBarItem> BottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business_center_outlined),
      label: "أعمال",
    ),
    const BottomNavigationBarItem(
      icon: const Icon(Icons.sports_soccer),
      label: "رياضة",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: "علم",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.tablet_mac_rounded),
      label: "تكنولوجيا",
    ),
  ];
  void ChangeBottomNavBar(int index) {
    if (index == 1) getSportsData();
    if (index == 2) getscienceData();
    if (index == 3) gettechnologyData();
    CurrentIndex = index;
    emit(NewBottomNavState());
  }

  List<dynamic> Bussinus = [];
  void getBussinusData() {
    emit(NewsGetBussinusLoadingState());
    if (Bussinus.isEmpty) {
      DioHelper.getData(url: '/v2/top-headlines', qurey: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'f300cd039ee54fba9a3b8942a5988bb2'
      }).then((value) {
        Bussinus = value!.data['articles'];

        emit(NewsGetBussinusSuccessState());
      }).catchError((onError) {
        emit(NewsGetBussinusErorrState(onError.toString()));
        print(onError.toString());
      });
    } else {
      emit(NewsGetBussinusSuccessState());
    }
  }

  List<dynamic> Sports = [];
  void getSportsData() {
    emit(NewsGetSportsLoadingState());
    if (Sports.isEmpty) {
      DioHelper.getData(url: '/v2/top-headlines', qurey: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '6fa87faea3534c5d991d4f676bb7fbc4'
      }).then((value) {
        Sports = value!.data['articles'];

        emit(NewsGetSportsSuccessState());
      }).catchError((onError) {
        emit(NewsGetSportsErorrState(onError.toString()));
        print(onError.toString());
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];
  void getscienceData() {
    emit(NewsGetscienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(url: '/v2/top-headlines', qurey: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '6fa87faea3534c5d991d4f676bb7fbc4'
      }).then((value) {
        science = value!.data['articles'];

        emit(NewsGetscienceSuccessState());
      }).catchError((onError) {
        emit(NewsGetscienceErorrState(onError.toString()));
        print(onError.toString());
      });
    } else {
      emit(NewsGetscienceSuccessState());
    }
  }

  List<dynamic> technology = [];
  void gettechnologyData() {
    emit(NewsGettechnologyLoadingState());
    if (technology.isEmpty) {
      DioHelper.getData(url: '/v2/top-headlines', qurey: {
        'country': 'eg',
        'category': 'technology',
        'apiKey': '6fa87faea3534c5d991d4f676bb7fbc4'
      }).then((value) {
        technology = value!.data['articles'];

        emit(NewsGettechnologySuccessState());
      }).catchError((onError) {
        emit(NewsGettechnologyErorrState(onError.toString()));
        print(onError.toString());
      });
    } else {
      emit(NewsGettechnologySuccessState());
    }
  }

  List<dynamic> Search = [];
  void getSearcheData({String? value}) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(url: '/v2/top-headlines', qurey: {
      'q': '${value}',
      'country': 'eg',
      'apiKey': '6fa87faea3534c5d991d4f676bb7fbc4'
    }).then((value) {
      Search = value!.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((onError) {
      emit(NewsGetSearchErorrState(onError.toString()));
      print(onError.toString());
    });
  }

  bool Is_dark = false;
  void ChangeAppMode({bool? fromShared}) async {
    if (fromShared != null) {
      Is_dark = fromShared;
      emit(NewDarkModeState());
    } else
      Is_dark = !Is_dark;
    CacheHelper.setData(key: 'Is_dark', value: Is_dark).then((value) {
      emit(NewDarkModeState());
    });
  }
}
