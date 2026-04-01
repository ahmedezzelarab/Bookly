import 'package:bookly/constant.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/Home/presention/views/widgets/BestSellerListView.dart';
import 'package:bookly/features/Home/presention/views/widgets/Bestsellerlistviewitem.dart';
import 'package:bookly/features/Home/presention/views/widgets/customListViewItem.dart';
import 'package:bookly/features/Home/presention/views/widgets/customappBar.dart';
import 'package:bookly/features/Home/presention/views/widgets/feturedlistview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewbody extends StatelessWidget {
  const HomeViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              FeturedBookListView(),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text("Best Seller", style: Styles.titlemedium),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Bestsellerlistview(),
          ),
        ),
      ],
    );
  }
}
