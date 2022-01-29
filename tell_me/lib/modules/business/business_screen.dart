import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tell_me/components/article_builder.dart';
import 'package:tell_me/cubit/cubit.dart';
import 'package:tell_me/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;

        return ArticleBuilder(list, context);
      }, 
    );
  }
}

