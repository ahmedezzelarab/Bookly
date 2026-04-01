import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/Home/presention/maneger/simaliarbooks/similarbooks_cubit.dart';
import 'package:bookly/features/Home/presention/views/widgets/customListViewItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarbooksCubit, SimilarbooksState>(
      builder: (context, state) {
        if (state is Similarbookssuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: FeturedListViewItem(
                    imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail??'',
                  ),
                );
              },
            ),
          );
        } else if (state is Similarbooksfailure) {
          return CustomErrorWidget(errormessage: state.errmessage);
        } else {
          return CustomScrollView();
        }
      },
    );
  }
}
