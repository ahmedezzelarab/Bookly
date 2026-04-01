import 'package:bloc/bloc.dart';
import 'package:bookly/features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/features/Home/data/repo/Home_Repo.dart';
import 'package:meta/meta.dart';

part 'similarbooks_state.dart';

class SimilarbooksCubit extends Cubit<SimilarbooksState> {
  SimilarbooksCubit(this.homerepo) : super(SimilarbooksInitial());
  final HomeRepos homerepo;
  Future<void> fetshsimilarbooks({required String category}) async {
    var result = await homerepo.fetshsimliarbooks(category: category);
    result.fold(
      (failure) {
        emit(Similarbooksfailure(failure.errmessage));
      },
      (books) {
        emit(Similarbookssuccess(books));
      },
    );
  }
}
