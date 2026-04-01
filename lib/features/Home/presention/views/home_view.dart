import 'package:bookly/features/Home/presention/views/widgets/customListViewItem.dart';
import 'package:bookly/features/Home/presention/views/widgets/home_viewbody.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const HomeViewbody());
  }
}
