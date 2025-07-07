// class Fondo {
//   final String id;
//   final String nombre;
//   final double montoMinimo;
//   final double montoMaximo;

//   Fondo({
//     required this.id,
//     required this.nombre,
//     required this.descripcion,
//     required this.imagen,
//     required this.montoMinimo,
//     required this.montoMaximo,
//     required this.rendimientoAnual,
//   });

//   factory Fondo.fromJson(Map<String, dynamic> json) {
//     return Fondo(
//       id: json['id'],
//       nombre: json['nombre'],
//       descripcion: json['descripcion'],
//       imagen: json['imagen'],
//       montoMinimo: json['montoMinimo'].toDouble(),
//       montoMaximo: json['montoMaximo'].toDouble(),
//       rendimientoAnual: json['rendimientoAnual'].toDouble(),
//     );
//   }
// }