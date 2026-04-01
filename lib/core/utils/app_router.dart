import 'package:bookly/core/utils/server_locator.dart';
import 'package:bookly/features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/features/Home/data/repo/Home_Repo.dart';
import 'package:bookly/features/Home/data/repo/Home_repo_impl.dart';
import 'package:bookly/features/Home/presention/maneger/simaliarbooks/similarbooks_cubit.dart';
import 'package:bookly/features/Home/presention/views/BookDeteilsView.dart';
import 'package:bookly/features/Home/presention/views/home_view.dart';
import 'package:bookly/features/Home/presention/views/widgets/BookDeteilsViewBody.dart';
import 'package:bookly/features/Search/presention/Views/SearchView.dart';
import 'package:bookly/features/splash/presention/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoute {
  static const KHomeVIewDirest = '/HomeView';
  static const KBookDetialboody = '/Bookdeteilsviewbody';
  static const KSearchView = '/SearchViewPage';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => splash_view()),
      //  GoRoute(path: KSearchView, builder: (context, state) => Searchview()),
      GoRoute(path: KHomeVIewDirest, builder: (context, state) => HomeView()),
      GoRoute(
        path: KBookDetialboody,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarbooksCubit(getIt.get<HomeRepoImpl>()),
          child: Bookdeteilsview(bookModel: state.extra as BookModel),
        ),
      ),
    ],
  );
}
