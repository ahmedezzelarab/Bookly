part of 'newest_book_cubit.dart';

@immutable
sealed class NewestBookState {}

final class NewestBookInitial extends NewestBookState {}

final class NewestBookloading extends NewestBookState {}

final class NewestBookfailure extends NewestBookState {
  final String errmessage;

  NewestBookfailure(this.errmessage);
}

final class NewestBooksuccess extends NewestBookState {
  final List<BookModel> books;

  NewestBooksuccess(this.books);
}
