import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/features/Home/presention/views/widgets/BookRatingItem.dart';
import 'package:bookly/features/Home/presention/views/widgets/booksactions.dart';
import 'package:bookly/features/Home/presention/views/widgets/class%20CustomBookDeteilsAppBar%20extends%20StatelessWidget%20.dart';
import 'package:bookly/features/Home/presention/views/widgets/customListViewItem.dart';
import 'package:flutter/material.dart';

class BookTetialSection extends StatelessWidget {
  const BookTetialSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        CustomBookDeteilsAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: FeturedListViewItem(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        SizedBox(height: 43),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textstyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors![0],
            style: Styles.textstyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 18),
        BookRating(mainAxisAlignment: MainAxisAlignment.center),
        SizedBox(height: 37),
        BooksAction(bookModel:  bookModel,),
      ],
    );
  }
}
