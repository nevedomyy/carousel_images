# Carousel Images

Carousel of images with reality effect

![img](demo.gif)

## How to use

CarouselImages widget support Network and Asset Images. You should put to list path or url:
'final List<String> listImages = [
    'assets/1.jpg',
    'https://www.factroom.ru/wp-content/uploads/2019/04/5-osobennostej-klimata-pitera-o-kotoryh-vy-dolzhny-znat-esli-sobiraetes-syuda-priekhat.jpg',
    'https://cdn.flixbus.de/2018-01/munich-header-d8_0.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
  ];'

'  CarouselImages(
            listImages: listImages,
            height: 300.0,
            onTap: (index){
              print('Tapped on page $index');
            },
          )
'

Parameter **height** is required!


