import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../settings/cubit/news_cubit.dart';
import '../widget/main_widget.dart';

class Science extends StatelessWidget {
  const Science({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);

    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: cubit.model?.articles?.isEmpty == true
                    ? 0
                    : cubit.model!.articles!.length,
                itemBuilder: (context, index) {
                  return CustomRow(
                      img: cubit.model!.articles![index].urlToImage ?? '',
                      text: cubit.model!.articles![index].title ?? '',
                      text1: cubit.model!.articles![index].publishedAt ?? '');
                }));
      },
    );
  }
}
