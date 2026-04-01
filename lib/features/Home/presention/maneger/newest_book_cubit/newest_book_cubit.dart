import 'package:bloc/bloc.dart';
import 'package:bookly/features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/features/Home/data/repo/Home_Repo.dart';
import 'package:meta/meta.dart';

part 'newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.homerepo) : super(NewestBookInitial());
  final HomeRepos homerepo;
  Future<void> fetshNewSetBooks() async {
    var result = await homerepo.fetshNewSetBooks();
    result.fold(
      (failure) {
        emit(NewestBookfailure(failure.errmessage));
      },
      (books) {
        emit(NewestBooksuccess(books));
      },
    );
  }
}
