import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/Home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepos {
  Future<Either<Faliure, List<BookModel>>> fetshNewSetBooks();
  Future<Either<Faliure, List<BookModel>>> fetshFeaturedBooks();
  Future<Either<Faliure, List<BookModel>>> fetshsimliarbooks({
    required String category,
  });
}
