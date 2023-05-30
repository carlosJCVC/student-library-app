import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'package:student_library_app/src/features/books/presentation/providers/providers.dart';
import 'package:student_library_app/src/features/books/presentation/widgets/widgets.dart';
import 'package:student_library_app/src/features/home/presentation/widgets/widgets.dart';
import 'package:student_library_app/src/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        drawer: SideMenu(scaffoldKey: scaffoldKey),
        appBar: AppBar(
          iconTheme: const IconThemeData(size: 30),
          title: const Text(
            'Libreria Estudiantil',
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined),
            )
          ],
        ),
        body: const _HomeView(),
      ),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(bookProvider.notifier).loadBooks();
    ref.read(categoryProvider.notifier).loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    final books = ref.watch(bookProvider);
    final categories = ref.watch(categoryProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeAppBar(),
          // AnnouncementSlide(),
          BooksCategory(categories: categories),
          HorizontalBooks(
            books: books,
            loadNextPage: () {},
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            child: const Text(
              '¿Qué estás buscando?',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          const CardTable(),
        ],
      ),
    );
  }
}

class CardTable extends ConsumerWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Table(
      children: [
        TableRow(
          children: [
            GestureDetector(
              onTap: () {
                context.push('/faculties');
              },
              child: const _SingleCard(
                colorIcon: Colors.blue,
                icon: Icons.ballot_outlined,
                text: 'Exams',
                colorBackground: Color.fromRGBO(255, 247, 197, 1),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const _SingleCard(
                colorIcon: Color(0xffFF2ACC),
                icon: FontAwesomeIcons.heart,
                text: 'Practices',
                colorBackground: Color.fromRGBO(255, 219, 251, 1),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            GestureDetector(
              onTap: () {
                context.push('/books');
              },
              child: const _SingleCard(
                colorIcon: Color(0xff00B385),
                icon: FontAwesomeIcons.book,
                text: 'Books',
                colorBackground: Color.fromRGBO(159, 244, 220, 1),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const _SingleCard(
                colorIcon: Color(0xff0091F9),
                icon: Icons.access_time_sharp,
                text: 'Schedules',
                colorBackground: Color.fromRGBO(208, 239, 255, 1),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color colorBackground;
  final Color colorIcon;
  final String text;

  const _SingleCard({
    required this.icon,
    required this.colorBackground,
    required this.text,
    required this.colorIcon,
  });

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
      color: colorBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffF6EFFF),
              borderRadius: BorderRadius.circular(50),
            ),
            width: 90,
            height: 90,
            child: Icon(
              icon,
              color: colorIcon,
              size: 50,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              color: colorIcon,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;
  final Color color;

  const _CardBackground({required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
