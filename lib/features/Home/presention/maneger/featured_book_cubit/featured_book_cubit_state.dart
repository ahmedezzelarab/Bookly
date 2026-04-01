part of 'featured_book_cubit_cubit.dart';

@immutable
abstract class FeaturedBookCubitState {}

final class FeaturedBookCubitInitial extends FeaturedBookCubitState {}

final class FeaturedBookCubitloading extends FeaturedBookCubitState {}

final class FeaturedBookCubitfailure extends FeaturedBookCubitState {
  final String error;

  FeaturedBookCubitfailure(this.error);
}

final class FeaturedBookCubitsuccess extends FeaturedBookCubitState {
  final List<BookModel> books;

  FeaturedBookCubitsuccess(this.books);
}
