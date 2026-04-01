import 'package:bookly/features/Home/data/models/book_model/book_model.dart';
import 'package:bookly/features/Home/presention/maneger/simaliarbooks/similarbooks_cubit.dart';
import 'package:bookly/features/Home/presention/views/widgets/BookDeteilsViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bookdeteilsview extends StatefulWidget {
  const Bookdeteilsview({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<Bookdeteilsview> createState() => _BookdeteilsviewState();
}

class _BookdeteilsviewState extends State<Bookdeteilsview> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<SimilarbooksCubit>(
      context,
    ).fetshsimilarbooks(category: widget.bookModel.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Bookdeteilsviewbody(bookModel: widget.bookModel);
  }
}
