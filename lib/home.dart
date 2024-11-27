import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/bloc/home/homeBloc.dart';
import 'package:ulearning/bloc/home/homeState.dart';
import 'package:ulearning/common/value/colors.dart';
import 'package:ulearning/pages/widget/homepage_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: build_AppBar(),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        homeText(
                          'Hello',
                          color: AppColors.primaryThreeElementText,
                        ),
                        homeText('dbCumar', top: 5),
                        SizedBox(
                          height: 20,
                        ),
                        searchview(),
                        sliderview(context, state),
                        menuview(),
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 0),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 1.5),
                      delegate: SliverChildBuilderDelegate(childCount: 4,
                          (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {},
                          child: courseGrid(),
                        );
                      }),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
