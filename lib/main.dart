import 'package:bookly/constant.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/server_locator.dart';
import 'package:bookly/features/Home/data/repo/Home_repo_impl.dart';
import 'package:bookly/features/Home/presention/maneger/featured_book_cubit/featured_book_cubit_cubit.dart';
import 'package:bookly/features/Home/presention/maneger/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly/features/splash/presention/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const BookyApp());
}

class BookyApp extends StatelessWidget {
  const BookyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBookCubit(getIt.get<HomeRepoImpl>())
                ..fetchfeaturedbooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBookCubit(getIt.get<HomeRepoImpl>())..fetshNewSetBooks(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: KprimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        routerConfig: AppRoute.router,
        //  home: splash_view(),
      ),
    );
  }
}
