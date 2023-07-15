import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Screens/search.dart';
import 'package:news_app/settings/cubit/news_cubit.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("News app"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Search()),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 40,
                  )),
              IconButton(
                  onPressed: () {
                    NewsCubit.get(context).changeMode();
                  },
                  icon: const Icon(
                    Icons.brightness_4_outlined,
                    size: 35,
                  ))
            ],
          ),
          body:
              NewsCubit.get(context).pages[NewsCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: NewsCubit.get(context).select,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.science,
                    size: 36,
                  ),
                  label: 'Science'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.sports,
                    size: 36,
                  ),
                  label: 'Sports'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.business_sharp,
                    size: 36,
                  ),
                  label: 'Business'),
            ],
            currentIndex: NewsCubit.get(context).currentIndex,
          ),
        );
      },
    );
  }
}
