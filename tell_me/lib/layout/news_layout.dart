import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tell_me/cubit/cubit.dart';
import 'package:tell_me/cubit/states.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tell_me/modules/search/search_screen.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Tell Me",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 24.0),
            ),
            actions: [
              IconButton(
                icon: const Icon(Ionicons.language_outline),
                onPressed: () async {
                  // ignore: await_only_futures
                  await NewsCubit.get(context).changeAppLanguage();
                  //Phoenix.rebirth(context);
                },
              ),
              IconButton(
                icon: NewsCubit.get(context).isDark
                    ? const Icon(Ionicons.moon)
                    : const Icon(Ionicons.moon_outline),
                onPressed: () {
                  NewsCubit.get(context).changeAppMode();
                },
              ),
              IconButton(
                icon: const Icon(Ionicons.search),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
              ),
            ],
          ),
          body: cubit.screens[cubit.CurrentIndex],
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100.0),
              ),
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, spreadRadius: 1, blurRadius: 5),
              ],
            ),
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: BottomNavigationBar(
                showUnselectedLabels: false,
                items: cubit.bottomItems,
                currentIndex: cubit.CurrentIndex,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
