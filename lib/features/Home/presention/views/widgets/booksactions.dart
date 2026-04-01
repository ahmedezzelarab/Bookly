import 'package:bookly/core/utils/functions/url_lauch.dart';
import 'package:bookly/core/widgets/custombutton.dart';
import 'package:bookly/features/Home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: Custombutton(
              text: '19.99€',
              backgroundcolor: Colors.white,
              textcolor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: Custombutton(
              onPressed: () async {
                launchUrlcustom(context, bookModel.volumeInfo.previewLink!);
              },
              text: getText(bookModel),
              fontsize: 16,
              backgroundcolor: Color(0xffEF8262),
              textcolor: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'not avalivble';
    } else {
      return 'preview';
    }
  }
}
