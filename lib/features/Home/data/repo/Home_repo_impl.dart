import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/features/Home/data/repo/Home_Repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepos {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);
  @override
  Future<Either<Faliure, List<BookModel>>> fetshNewSetBooks() async {
    try {
      var data = await apiServices.get(
        endpoint:
            'volumes?Filtering=free-ebooks&q=subject:programming&sorting=newest',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerEoor.fromDioError(e));
      }
      return left(ServerEoor(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, List<BookModel>>> fetshFeaturedBooks() async {
    // TODO: implement fetshFeaturedBooks
    try {
      var data = await apiServices.get(
        endpoint:
            'volumes?Filtering=free-ebooks&q=subject:programming&sorting=newest',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerEoor.fromDioError(e));
      }
      return left(ServerEoor(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, List<BookModel>>> fetshsimliarbooks({
    required String category,
  }) async {
    try {
      var data = await apiServices.get(
        endpoint:
            'volumes?Filtering=free-ebooks&q=subject:programming&sorting=newest',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerEoor.fromDioError(e));
      }
      return left(ServerEoor(e.toString()));
    }
  }
}
