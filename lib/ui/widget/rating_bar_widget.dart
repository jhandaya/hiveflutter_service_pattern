import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class RatingBarWidget extends StatefulWidget {
  final int mode;
  final IconData? selectedIcon;
  final bool isVertical = false;
  final double initialRating;

  //output
  double? rating;

  RatingBarWidget(
      {Key? key,
      required this.mode,
      required this.initialRating,
      this.selectedIcon,
      this.rating})
      : super(key: key);

  @override
  _RatingBarWidgetState createState() => _RatingBarWidgetState();
}

Widget _image(String asset) {
  return Image.asset(
    asset,
    height: 30.0,
    width: 30.0,
    color: Colors.amber,
  );
}

class _RatingBarWidgetState extends State<RatingBarWidget> {
  @override
  Widget build(BuildContext context) {
    switch (widget.mode) {
      case 1:
        return Column(
          children: [
            RatingBar.builder(
              initialRating: widget.initialRating,
              minRating: 0,
              direction: widget.isVertical ? Axis.vertical : Axis.horizontal,
              allowHalfRating: true,
              unratedColor: Colors.amber.withAlpha(50),
              itemCount: 5,
              itemSize: 30.0,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                widget.selectedIcon ?? Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  widget.rating = rating;
                });
              },
              updateOnDrag: true,
            ),
            const SizedBox(
              height: 20.0,
            ),
            widget.rating != null
                ? Text(
                    'Rating: ${widget.rating}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                : Text(
                    'Rating: ${widget.initialRating}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
            const SizedBox(
              height: 40.0,
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            RatingBar(
              initialRating: widget.initialRating,
              direction: widget.isVertical ? Axis.vertical : Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: _image('assets/heart.png'),
                half: _image('assets/heart_half.png'),
                empty: _image('assets/heart_border.png'),
              ),
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: (rating) {
                setState(() {
                  widget.rating = rating;
                });
              },
              updateOnDrag: true,
            ),
            const SizedBox(
              height: 20.0,
            ),
            widget.rating != null
                ? Text(
                    'Rating: $widget.rating',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                : Text(
                    'Rating: ${widget.initialRating}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
            const SizedBox(
              height: 40.0,
            ),
          ],
        );
      case 3:
        return Column(
          children: [
            RatingBar.builder(
              initialRating: 3,
              direction: widget.isVertical ? Axis.vertical : Axis.horizontal,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return const Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                  case 1:
                    return const Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent,
                    );
                  case 2:
                    return const Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber,
                    );
                  case 3:
                    return const Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen,
                    );
                  case 4:
                    return const Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                  default:
                    return Container();
                }
              },
              onRatingUpdate: (rating) {
                setState(() {
                  widget.rating = rating;
                });
              },
              updateOnDrag: true,
            ),
            const SizedBox(
              height: 20.0,
            ),
            widget.rating != null
                ? Text(
                    'Rating: $widget.rating',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                : Text(
                    'Rating: ${widget.initialRating}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
            const SizedBox(
              height: 40.0,
            ),
          ],
        );
      default:
        return Container();
    }
  }
}
