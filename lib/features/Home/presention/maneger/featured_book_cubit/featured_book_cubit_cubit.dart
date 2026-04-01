import 'package:bloc/bloc.dart';
import 'package:bookly/features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/features/Home/data/repo/Home_Repo.dart';
import 'package:meta/meta.dart';

part 'featured_book_cubit_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookCubitState> {
  FeaturedBookCubit(this.homerepo) : super(FeaturedBookCubitInitial());
  final HomeRepos homerepo;
  Future<void> fetchfeaturedbooks() async {
    emit(FeaturedBookCubitloading());
    var result = await homerepo.fetshFeaturedBooks();
    result.fold(
      (failure) {
        emit(FeaturedBookCubitfailure(failure.errmessage));
      },
      (books) {
        emit(FeaturedBookCubitsuccess(books));
      },
    );
  }
}
