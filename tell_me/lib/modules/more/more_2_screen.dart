import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tell_me/components/article_builder.dart';
import 'package:tell_me/cubit/cubit.dart';
import 'package:tell_me/cubit/states.dart';

class More2Screen extends StatelessWidget {

  More2Screen({required this.title,  Key? key }) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(title), centerTitle: true,),
        body: BlocProvider(
          create: (BuildContext context) => NewsCubit()..getMore(title),
          child: BlocConsumer<NewsCubit, NewsStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var list = NewsCubit.get(context).more;
              
              return ArticleBuilder(list, context);
            }, 
          ),
        ),
      ),
    );
  }
}