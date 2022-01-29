import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tell_me/components/article_builder.dart';
import 'package:tell_me/components/defult_form_filed.dart';
import 'package:tell_me/cubit/cubit.dart';
import 'package:tell_me/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;

        return SafeArea(
          child: Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    onChanged: (String value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Ionicons.search,),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(child: ArticleBuilder(list, context, isSearch: true)),
              ],
            ),
          ),
        );
      },
    );
  }
}
