import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../settings/cubit/news_cubit.dart';
import '../widget/main_widget.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    var cubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: controller,
                      onChanged: (value) {
                        //  cubit.getSearch(value);
                      },
                      decoration: const InputDecoration(
                        prefix: Icon(Icons.search),
                        label: Text('search'),
                      ),
                    ),
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: cubit.model?.articles?.isEmpty == true
                          ? 0
                          : cubit.model!.articles!.length,
                      itemBuilder: (context, index) {
                        return CustomRow(
                            img: cubit.model!.articles![index].urlToImage ?? '',
                            text: cubit.model!.articles![index].title ?? '',
                            text1: cubit.model!.articles![index].publishedAt ??
                                '');
                      })
                ]),
              ));
        });
  }
}
