import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tell_me/cubit/cubit.dart';
import 'package:tell_me/layout/news_layout.dart';
import 'package:tell_me/network/remote/dio_helper.dart';
import 'cubit/bloc_observer.dart';
import 'cubit/states.dart';
import 'local/cache_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //Bloc.observer = MyBlocObserver();
  
  DioHelper.init();

  await CacheHelper.init();

  if (CacheHelper.getData(key: 'isDark') == null){
    CacheHelper.setBool(key: 'isDark', value: false);
  }
  if (CacheHelper.getData(key: 'isEnglish') == null){
    CacheHelper.setBool(key: 'isEnglish', value: true);
  }
  
  
  bool isDark = CacheHelper.getData(key: 'isDark');
  bool isEnglish = CacheHelper.getData(key: 'isEnglish'); 

  BlocOverrides.runZoned((){
      runApp(MyApp(isDark: isDark, isEnglish: isEnglish));
    },
    blocObserver: MyBlocObserver(),
  );
  
}

class MyApp extends StatelessWidget {

  final bool isDark, isEnglish;
  const MyApp({Key? key, required this.isDark, required this.isEnglish}) : super(key: key); 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => NewsCubit()..changeAppMode(fromShared: isDark)..changeAppLanguage(fromShared: isEnglish)..getBusiness()..getScience()..getSports(),),
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.cyan,
          
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.cyan,
              ),
          
              appBarTheme: const AppBarTheme(
                titleSpacing: 20.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black
                ),
              ),
          
              scaffoldBackgroundColor: Colors.white,
          
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.cyan,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.cyan,
          
              appBarTheme: const AppBarTheme(
                titleSpacing: 20.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color(0xFF333739),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: Color(0xFF333739),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white
                ),
              ),
          
              scaffoldBackgroundColor: const Color(0xFF333739),
          
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(

                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.cyan,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}