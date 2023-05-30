import 'package:flutter/material.dart';
import 'package:student_library_app/src/data/faculties.dart';

class FacultiesScreen extends StatelessWidget {
  const FacultiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What faculty are you from?'),
      ),
      body: const _FacultyBodyView(),
    );
  }
}

class _FacultyBodyView extends StatelessWidget {
  const _FacultyBodyView();

  @override
  Widget build(BuildContext context) {
    const faculties = listFaculties;

    return ListView.builder(
      itemCount: faculties.length,
      itemBuilder: (BuildContext context, int index) {
        final faculty = faculties[index];

        return _CustomListTile(faculty: faculty);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final Faculty faculty;

  const _CustomListTile({
    required this.faculty,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(faculty.name),
        subtitle: Text(faculty.subTitle),
        leading: Icon(faculty.icon, color: colors.primary),
        trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
        onTap: () {
          // context.push(faculty.link);
        },
      ),
    );
  }
}
