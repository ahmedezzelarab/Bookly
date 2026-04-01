import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custombutton.dart';
import 'package:bookly/features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/features/Home/presention/views/widgets/BookRatingItem.dart';
import 'package:bookly/features/Home/presention/views/widgets/booksactions.dart';
import 'package:bookly/features/Home/presention/views/widgets/booksdetilssection.dart';
import 'package:bookly/features/Home/presention/views/widgets/class%20CustomBookDeteilsAppBar%20extends%20StatelessWidget%20.dart';
import 'package:bookly/features/Home/presention/views/widgets/customListViewItem.dart';
import 'package:bookly/features/Home/presention/views/widgets/silmilarbookslistview.dart';
import 'package:bookly/features/Home/presention/views/widgets/similarbookssection.dart';
import 'package:flutter/material.dart';

class Bookdeteilsviewbody extends StatelessWidget {
  const Bookdeteilsviewbody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                BookTetialSection(bookModel: bookModel),

                Expanded(child: SizedBox(height: 50)),
                SimilarBooksSextions(),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
