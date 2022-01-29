import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tell_me/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tell_me/local/cache_helper.dart';
import 'package:tell_me/modules/business/business_screen.dart';
import 'package:tell_me/modules/more/more_screen.dart';
import 'package:tell_me/modules/science/science_screen.dart';
import 'package:tell_me/modules/sports/sports_screen.dart';
import 'package:tell_me/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int CurrentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(icon: Icon(Ionicons.business_outline),label: "Business"),
    
    const BottomNavigationBarItem(icon: Icon(Ionicons.leaf_outline),label: "Science"),
    
    const BottomNavigationBarItem(icon: Icon(Ionicons.football_outline),label: "Sports"),

    const BottomNavigationBarItem(icon: Icon(Icons.view_module_rounded),label: "More"),

  ]; 

  List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
    const MoreScreen(),
  ];

  void changeBottomNavBar(int index){
    CurrentIndex = index;
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness(){

    emit(NewsGetBusinessLoadingState());
    String lang = 'ar';
    if(isEnglish){
      lang = 'en';
    }
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'language':'$lang',
        'category':'business',
        'apiKey':'8d805b8257df4ed7bd9c69b7a7c1bade', 
      }).then((value) {
        business = value.data['articles'];
        emit(NewsGetBusinessSuccessState());
      }).catchError((error){
        emit(NewsGetBusinessErrorState(error.toString()));
      });
  }

  List<dynamic> sports = [];

  void getSports(){
    emit(NewsGetSportsLoadingState());
    String lang = 'ar';
    if(isEnglish){
      lang = 'en';
    }
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'language':'$lang',
        'category':'sports',
        'apiKey':'8d805b8257df4ed7bd9c69b7a7c1bade', 
      }).then((value) {
        sports = value.data['articles'];
        emit(NewsGetSportsSuccessState());
      }).catchError((error){
        emit(NewsGetSportsErrorState(error.toString()));
      });
  }

  List<dynamic> science = [];

  void getScience(){
    String lang = 'ar';
    if(isEnglish){
      lang = 'en';
    }
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'language':'$lang',
        'category':'science',
        'apiKey':'8d805b8257df4ed7bd9c69b7a7c1bade', 
      }).then((value) {
        science = value.data['articles'];
        print(science);
        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        emit(NewsGetScienceErrorState(error.toString()));
      });
  }

  bool isDark = false, isEnglish = true;

  Future<void> changeAppLanguage({bool? fromShared})async {
    science = [];
    business = [];
    sports = [];
    getBusiness();
    getScience();
    getSports();

    if (fromShared != null){

      isEnglish = fromShared;
      emit(NewsAppLanguageState());

    } else {
      
      isEnglish = !isEnglish;
      
      CacheHelper.setBool(key: 'isEnglish',value: isEnglish).then((value){
        emit(NewsAppLanguageState());
      });

    }
  }

  void changeAppMode({bool? fromShared}){

    if (fromShared != null){

      isDark = fromShared;
      emit(NewsAppChangeModeState());

    } else {
      
      isDark = !isDark;
      
      CacheHelper.setBool(key: 'isDark',value: isDark).then((value){
        emit(NewsAppChangeModeState());
      });

    }
  }

  List<dynamic> search = [];  
  void getSearch(String value){

    emit(NewsGetSearchLoadingState());

    search = [];

    DioHelper.getData(

      url: 'v2/everything',
      query: {
        'q':'$value',
        'apiKey':'8d805b8257df4ed7bd9c69b7a7c1bade', 

      }).then((value) {

        search = value.data['articles'];
        emit(NewsGetSeaechSuccessState());

      }).catchError((error){
        
        emit(NewsGetSearchErrorState(error.toString()));
      
      });
  }

  List<dynamic> more = [];

  void getMore(String title){
    more = [];
    String lang = 'ar';
    if(isEnglish){
      lang = 'en';
    }
    emit(NewsGetMoreLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'language':'$lang',
        'category':'$title',
        'apiKey':'8d805b8257df4ed7bd9c69b7a7c1bade', 
      }).then((value) {
        more = value.data['articles'];
        print(more);
        emit(NewsGetMoreSuccessState());
      }).catchError((error){
        emit(NewsGetMoreErrorState(error.toString()));
      });
  }

}