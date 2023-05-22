import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class AnnouncementSlide extends StatelessWidget {
  const AnnouncementSlide({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary,
          ),
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const _MovieSlide();
        },
      ),
    );
  }
}

class _MovieSlide extends StatelessWidget {
  const _MovieSlide();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
              offset: Offset(0, 10),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            onTap: () => {},
            child: const FadeInImage(
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/loaders/bottle-loader.gif'),
              image: NetworkImage("https://placehold.co/600x400@2x.png"),
            ),
          ),
        ),
      ),
    );
  }
}
