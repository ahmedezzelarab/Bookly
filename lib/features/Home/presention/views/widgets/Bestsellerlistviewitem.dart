import 'package:bookly/constant.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/features/Home/presention/views/widgets/BookRatingItem.dart';
import 'package:bookly/features/Home/presention/views/widgets/customListViewItem.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookmodel});
  final BookModel bookmodel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoute.KBookDetialboody, extra: bookmodel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            FeturedListViewItem(
              imageUrl: bookmodel.volumeInfo.imageLinks.thumbnail,
            ),

            SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookmodel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textstyle20.copyWith(
                        fontFamily: KGTSectraFine,
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    bookmodel.volumeInfo.authors![0],
                    style: Styles.textstyle14,
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        'free',
                        style: Styles.textstyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      BookRating(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
