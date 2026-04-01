import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/Home/presention/views/widgets/silmilarbookslistview.dart';
import 'package:flutter/material.dart';

class SimilarBooksSextions extends StatelessWidget {
  const SimilarBooksSextions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textstyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 16),
        SimilarBooksListView(),
      ],
    );
  }
}
