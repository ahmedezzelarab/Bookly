part of 'similarbooks_cubit.dart';

@immutable
sealed class SimilarbooksState {}

final class SimilarbooksInitial extends SimilarbooksState {}

final class Similarbookssuccess extends SimilarbooksState {
  final List<BookModel> books;

  Similarbookssuccess(this.books);
}

final class Similarbooksfailure extends SimilarbooksState {
  final String errmessage;

  Similarbooksfailure(this.errmessage);
}

final class Similarbooksloading extends SimilarbooksState {}
