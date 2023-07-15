import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Screens/business.dart';
import 'package:news_app/Screens/science.dart';
import 'package:news_app/Screens/sports.dart';
import 'package:news_app/settings/api/dio.dart';

import '../api/model.dart';
import '../api/searchModel.dart';
import '../cache.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  final pages = [
    const Science(),
    const Sports(),
    const Business(),
  ];
  bool isDark = false;
  ThemeMode appMode = ThemeMode.dark; // عشان اغير في ف theme كل شويه
  void changeMode() {
    isDark = !isDark;
    Cache.putData(key: "isDark", value: isDark).then(
        (value) => emit(ChangeModeTheme())); // لما ادوس احفظ قيمه ال متغير دعه
  }

  void select(int value) {
    currentIndex = value;
    emit(ChangeButton());
  }

  // ازاي اتعامل معAPI   معcubit
  Model? model1; // الي بعرض بيه
  void getData() {
    emit(Loading());
    const String url = 'v2/top-headlines?country=eg&apiKey=$apiKey';
    DioHelper.get(url: url).then((value) {
      model1 = Model.fromJson(value.data);
      log(value.data);
      emit(ApiBusiness());
    }).catchError((error1) {
      print(error1.toString());
      emit(ErrorBusiness(error: error1.toString()));
    });
  }

  DataX? model;
  void getSearch() {
    emit(Loading());
    String url = 'v2/everything?q=tesla&apikey=$apiKey1';
    DioHelper.get(url: url).then((value) {
      model = DataX.fromJson(value.data);
      log(value.data);
      emit(ApiSearch());
    }).catchError((error1) {
      print(error1.toString());
      emit(ErrorSearch(error: error1.toString()));
    });
  }
}

const String apiKey = 'f33bfbc767e24c498cab6841a6708257';
const String apiKey1 = 'f33bfbc767e24c498cab6841a6708257';
