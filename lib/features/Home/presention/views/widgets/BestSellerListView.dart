import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/Home/presention/maneger/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly/features/Home/presention/views/widgets/Bestsellerlistviewitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bestsellerlistview extends StatelessWidget {
  const Bestsellerlistview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBookState>(
      builder: (context, state) {
        if (state is NewestBooksuccess) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerListViewItem(bookmodel: state.books[index]),
              );
            },
          );
        } else if (state is NewestBookfailure) {
          return CustomErrorWidget(errormessage: state.errmessage);
        } else {
          return CustomScrollView();
        }
      },
    );
  }
}
