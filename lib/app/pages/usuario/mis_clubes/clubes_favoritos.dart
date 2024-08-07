import 'package:reservatu_pista/app/pages/usuario/mis_clubes/modelos/club.dart';

class ClubesFavoritos {
  static List tipos = ["Ayuntamiento", "Comunidad de vecinos", "Club privado"];
  static List clubes = [
    Club(
        1,
        "Ayto Riolobos",
        "Riolobos",
        4,
        'https://images.unsplash.com/photo-1612534847738-b3af9bc31f0c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxwYWRlbHxlbnwwfHx8fDE3MTEzOTkyNDh8MA&ixlib=rb-4.0.3&q=80&w=1080',
        tipos[0]),
    Club(
        2,
        "Cáceres Pádel",
        "Cáceres",
        3,
        'https://images.unsplash.com/photo-1574379989050-bfd9e1a8a543?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8cGFkZWx8ZW58MHx8fHwxNzExMzk5MjQ4fDA&ixlib=rb-4.0.3&q=80&w=1080',
        tipos[2]),
    Club(
        3,
        "Ayto Calzada",
        "Calzada",
        1,
        'https://images.unsplash.com/photo-1601646761285-65bfa67cd7a3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxwYWRlbHxlbnwwfHx8fDE3MTEzOTkyNDh8MA&ixlib=rb-4.0.3&q=80&w=400',
        tipos[0]),
    Club(
        4,
        "Vecinos El Perú",
        "Cáceres",
        3,
        'https://images.unsplash.com/photo-1596559058872-595ea5281b7b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw4fHxwYWRlbHxlbnwwfHx8fDE3MTUxNTgwODN8MA&ixlib=rb-4.0.3&q=80&w=400',
        tipos[1]),
  ];
}
