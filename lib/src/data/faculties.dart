import 'package:flutter/material.dart';

class Faculty {
  final String name;
  final String subTitle;
  final IconData icon;

  const Faculty({
    required this.name,
    required this.subTitle,
    required this.icon,
  });
}

const List<Faculty> listFaculties = [
  Faculty(
    name: 'Facultad de Ciencias y Tecnología.',
    subTitle: '',
    icon: Icons.back_hand_outlined,
  ),
  Faculty(
    name: 'Facultad de Ciencias Económicas.',
    subTitle: '',
    icon: Icons.back_hand_outlined,
  ),
  Faculty(
    name: 'Facultad de Ciencias Jurídicas y Políticas.',
    subTitle: '',
    icon: Icons.back_hand_outlined,
  ),
  Faculty(
    name: 'Facultad de Humanidades y Ciencias de la Educación.',
    subTitle: '',
    icon: Icons.back_hand_outlined,
  ),
  Faculty(
    name: 'Facultad de Arquitectura y Ciencias del Hábitat.',
    subTitle: '',
    icon: Icons.back_hand_outlined,
  ),
  Faculty(
    name: 'Facultad de Ciencias Agrícolas y Pecuarias.',
    subTitle: '',
    icon: Icons.back_hand_outlined,
  ),
  Faculty(
    name: 'Facultad de Medicina.',
    subTitle: '',
    icon: Icons.back_hand_outlined,
  ),
  Faculty(
    name: 'Facultad de Odontología.',
    subTitle: '',
    icon: Icons.back_hand_outlined,
  ),
  Faculty(
    name: 'Facultad de Ciencias Bioquímicas y Farmacéuticas.',
    subTitle: '',
    icon: Icons.back_hand_outlined,
  ),
  Faculty(
    name: 'Facultad Politécnica del Valle Alto.',
    subTitle: '',
    icon: Icons.back_hand_outlined,
  ),
  Faculty(
    name: 'Facultad de Ciencias Sociales.',
    subTitle: '',
    icon: Icons.back_hand_outlined,
  ),
  Faculty(
    name: 'Facultad de Desarrollo Rural y Territorial.',
    subTitle: '',
    icon: Icons.back_hand_outlined,
  ),
  Faculty(
    name: 'Escuela Forestal.',
    subTitle: '',
    icon: Icons.back_hand_outlined,
  ),
  Faculty(
    name: 'Facultad de Enfermería.',
    subTitle: '',
    icon: Icons.back_hand_outlined,
  ),
  Faculty(
    name: 'Unidad Desconcentrada del Valle de Sacta.',
    subTitle: '',
    icon: Icons.back_hand_outlined,
  ),
  Faculty(
    name: 'Facultad de Ciencias Veterinarias.',
    subTitle: '',
    icon: Icons.back_hand_outlined,
  ),
];
