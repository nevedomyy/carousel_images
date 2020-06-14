library carouselimages;

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CarouselImages extends StatefulWidget {
  final List<String> listImages;
  final Function(int index) onTap;
  final double height;

  const CarouselImages({
    Key key,
    @required this.listImages,
    @required this.height,
    this.onTap,
  }) : assert(listImages != null),
       assert(height != null),
       super(key: key);

  @override
  _CarouselImagesState createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  PageController _pageController;
  double _currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: widget.height,
      child: Material(
        color: Colors.transparent,
        child: PageView.builder(
          physics: BouncingScrollPhysics(),
          controller: _pageController,
          itemCount: widget.listImages.length,
          itemBuilder: (context, position) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: GestureDetector(
                onTap: () => widget.onTap(position),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Transform.translate(
                      offset: Offset((_currentPageValue-position)*width/4, 0),
                      child: widget.listImages[position].startsWith('http')
                      ? FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: widget.listImages[position],
                        fit: BoxFit.fitHeight,
                      )
                      : Image.asset(
                        widget.listImages[position],
                        fit: BoxFit.fitHeight,
                      )
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}