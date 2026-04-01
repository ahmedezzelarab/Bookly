import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_circle_progress_indicator.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/Home/presention/maneger/featured_book_cubit/featured_book_cubit_cubit.dart';
import 'package:bookly/features/Home/presention/views/widgets/customListViewItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeturedBookListView extends StatelessWidget {
  const FeturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookCubitState>(
      builder: (context, state) {
        if (state is FeaturedBookCubitsuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: (){
                        GoRouter.of(context).push(AppRoute.KBookDetialboody,extra:state.books[index]);
                    },
                    child: FeturedListViewItem(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks.smallThumbnail,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBookCubitfailure) {
          return CustomErrorWidget(errormessage: state.error);
        } else {
          return CustomCircleProgressIndicator();
        }
      },
    );
  }
}
