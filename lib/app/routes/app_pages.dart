// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/pages/administrador/admin_page/pagina_administrador_b.dart';
import 'package:reservatu_pista/app/pages/administrador/admin_page/pagina_administrador_p.dart';
import 'package:reservatu_pista/app/pages/administrador/detalles_usuario_admin/detalles_usuario_admin_b.dart';
import 'package:reservatu_pista/app/pages/administrador/detalles_usuario_admin/detalles_usuario_admin_p.dart';
import 'package:reservatu_pista/app/pages/administrador/login_administrador/login_administrador_b.dart';
import 'package:reservatu_pista/app/pages/administrador/login_administrador/login_administrador_p.dart';
import 'package:reservatu_pista/app/pages/profesional/anadir_pista/anadir_pista_p.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_bonos_proveedor/mis_bonos_proveedor_b.dart';
import 'package:reservatu_pista/app/pages/profesional/mis_bonos_proveedor/mis_bonos_proveedor_p.dart';
import 'package:reservatu_pista/app/pages/profesional/pistas_proveedor/pistas_proveedor_b.dart';
import 'package:reservatu_pista/app/pages/profesional/pistas_proveedor/pistas_proveedor_p.dart';
import 'package:reservatu_pista/app/pages/profesional/tarifas_proveedor/tarifas_proveedor_b.dart';
import 'package:reservatu_pista/app/pages/profesional/tarifas_proveedor/tarifas_proveedor_p.dart';
import 'package:reservatu_pista/app/pages/usuario/historial/historial_b.dart';
import 'package:reservatu_pista/app/pages/usuario/historial/historial_p.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_bonos/mis_bonos_b.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_bonos/mis_bonos_p.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_clubes/mis_clubes_b.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_clubes/mis_clubes_p.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_pedidos/mis_pedidos_b.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_pedidos/mis_pedidos_p.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/mis_reservas_b.dart';
import 'package:reservatu_pista/app/pages/usuario/mis_reservas/mis_reservas_p.dart';
import 'package:reservatu_pista/app/pages/usuario/reserva_compartida/reserva_compartida_b.dart';
import 'package:reservatu_pista/app/pages/usuario/reserva_compartida/reserva_compartida_p.dart';
import 'package:reservatu_pista/app/ui/pages/eliminar_cuenta_page/eliminar_cuenta_b.dart';
import 'package:reservatu_pista/app/ui/pages/eliminar_cuenta_page/eliminar_cuenta_p.dart';
import 'package:reservatu_pista/app/ui/pages/pruebaadministrador/pruebaadministrador_b.dart';
import 'package:reservatu_pista/app/ui/pages/pruebaadministrador/pruebaadministrador_p.dart';
import 'package:reservatu_pista/app/ui/pages/pruebas_page/pruebas_b.dart';
import 'package:reservatu_pista/app/ui/pages/pruebas_page/pruebas_p.dart';
import 'package:reservatu_pista/app/ui/pages/validar_email_page/validar_email_b.dart';
import 'package:reservatu_pista/app/ui/pages/validar_email_page/validar_email_p.dart';
import 'package:reservatu_pista/pages/profesional/banco_virtual/banco_virtual_b.dart';
import 'package:reservatu_pista/pages/profesional/banco_virtual/banco_virtual_p.dart';
import 'package:reservatu_pista/pages/profesional/inicio_profesional/inicio_proveedor_b.dart';
import 'package:reservatu_pista/pages/profesional/inicio_profesional/inicio_proveedor_p.dart';
import 'package:reservatu_pista/pages/profesional/notificaciones_profesional/notificaciones_profesional.dart';
import 'package:reservatu_pista/pages/profesional/perfil_proveedor/perfil_proveedor_b.dart';
import 'package:reservatu_pista/pages/profesional/perfil_proveedor/perfil_proveedor_p.dart';
import 'package:reservatu_pista/pages/usuario/amigos/amigos_b.dart';
import 'package:reservatu_pista/pages/usuario/amigos/amigos_p.dart';
import 'package:reservatu_pista/pages/usuario/inicio/inicio_b.dart';
import 'package:reservatu_pista/pages/usuario/inicio/inicio_p.dart';
import 'package:reservatu_pista/pages/usuario/monedero_virtual/monedero_b.dart';
import 'package:reservatu_pista/pages/usuario/monedero_virtual/monedero_p.dart';
import 'package:reservatu_pista/pages/usuario/notificaciones/notificaciones.dart';
import 'package:reservatu_pista/pages/usuario/perfil/perfil_b.dart';
import 'package:reservatu_pista/pages/usuario/perfil/perfil_p.dart';
import '../pages/profesional/anadir_pista/anadir_pista_b.dart';
import '../pages/usuario/login_usuario/login_usuario.dart';
import '../pages/usuario/login_usuario/login_usuario_b.dart';
import '../pages/usuario/registrar_usuario/registrar_usuario_p.dart';
import '../pages/usuario/registrar_usuario/registrar_usuario_b.dart';
import '../ui/pages/pagotpv_page/pagotpv_b.dart';
import '../ui/pages/pagotpv_page/pagotpv_p.dart';
import '../pages/usuario/reservar_pista/reservar_pista_p.dart';
import '../pages/usuario/reservar_pista/reservar_pista_b.dart';
import '../pages/profesional/registro_proveedor/registrar_proveedor_p.dart';
import '../pages/profesional/registro_proveedor/registrar_proveedor_b.dart';
import '../pages/profesional/mis_socios/mis_socios_p.dart';
import '../pages/profesional/mis_socios/mis_socios_b.dart';
import '../pages/profesional/datos_proveedor/datos_proveedor_p.dart';
import '../pages/profesional/datos_proveedor/datos_proveedor_b.dart';
import '../pages/usuario/chat/chat.dart';
import '../pages/usuario/chat/chat_b.dart';
import '../pages/usuario/resultados_estadisticas/resultados_estadisticas.dart';
import '../pages/usuario/resultados_estadisticas/resultados_estadisticas_b.dart';
import '../pages/profesional/chat_proveedor/chat_proveedor.dart';
import '../pages/profesional/chat_proveedor/chat_proveedor_b.dart';
import '../pages/profesional/mis_pistas/mis_pistas_p.dart';
import '../pages/profesional/mis_pistas/mis_pistas_b.dart';
import '../pages/usuario/datos_usuario/datos_usuario_p.dart';
import '../pages/usuario/datos_usuario/datos_usuario_b.dart';
import '../ui/pages/olvide_contrasena/olvide_contrasena_p.dart';
import '../ui/pages/olvide_contrasena/olvide_contrasena_b.dart';
import '../pages/profesional/tarifas_pista/tarifas_pista_p.dart';
import '../pages/profesional/tarifas_pista/tarifas_pista_b.dart';

extension ExtRoutesType on RoutesType {
  String get getRoute => '/${toString().split('.').last}';
}

// End imports
enum RoutesType {
  login_usuario,
  registrar_usuario,
  perfil,
  mis_reservas,
  datos,
  perfil_proveedor,
  monedero,
  caja,
  anadir_pista,
  tarifas,
  mis_pistas,
  notificaciones,
  notificaciones_proveedor,
  inicio_proveedor,
  inicio,
  reservar_pista,
  pagos_tarjeta,
  registrar_proveedor,
  mis_socios,
  datos_proveedor,
  prueba_proveedor,
  chat,
  resultados_estadisticas,
  chat_proveedor,
  reserva_tu_pista,
  datos_usuario,
  olvide_contrasena,
  tarifas_pista,
  pago_tpv,
  pruebas,
  eliminar_cuenta,
  validar_email,
  reserva_compartida,
  administrador,
  amigos,
  mis_bonos,
  mis_pedidos,
  mis_clubes,
  historial_usuario,
  tarifas_proveedor,
  pistas_proveedor,
  mis_bonos_proveedor,
  login_administrador,
  prueba_administrador,
  detalles_usuarios_administrador,
}

class RouteRedirectMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // print('rooute: ${Get.arguments}');
    // Lógica de redirección
    // if (route == Routes.OLVIDE_CONTRASENA) {
    //   return RouteSettings(name: Routes.LOGIN_USUARIO);
    // }
    return null; // No redirigir si no cumple la condición
  }
}

/// Titulos Routes
abstract class Titulos {
  static const LOGIN_USUARIO = 'Login Usuario o Proveedor';
  static const REGISTRAR_USUARIO = 'Registrar Usuario';
  static const PERFIL = 'Perfil';
  static const MIS_RESERVAS = 'Mis Reservas';
  static const DATOS = 'Datos Usuario';
  static const PERFIL_PROVEEDOR = 'Perfil Proveedor';
  static const MONEDERO = 'Monedero';
  static const CAJA = 'Caja';
  static const ANADIR_PISTA = 'Crear Pista';
  static const TARIFAS = 'Tarifas';
  static const MIS_PISTAS = 'Mis Pistas';
  static const NOTIFICACIONES = 'Notificaciones Usuario';
  static const NOTIFICACIONES_PROVEEDOR = 'Notificaciones Proveedor';
  static const INICIO_PROVEEDOR = 'Inicio Proveedor';
  static const INICIO = 'Inicio Usuario';
  static const RESERVAR_PISTA = 'Reservar Pista';
  static const PAGOS_TARJETA = 'Pagos Tarjeta';
  static const REGISTRAR_PROVEEDOR = 'Registrar Proveedor';
  static const MIS_SOCIOS = 'Mis Socios';
  static const DATOS_PROVEEDOR = 'Datos Proveedor';
  static const PRUEBA_PROVEEDOR = 'prueba_proveedor';
  static const CHAT = 'Chat Usuario';
  static const RESULTADOS_ESTADISTICAS = 'Resultados Estadísticas';
  static const CHAT_PROVEEDOR = 'Chat Proveedor';
  static const RESERVA_TU_PISTA = 'Reserva tu Pista';
  static const DATOS_USUARIO = 'Datos Usuario';
  static const OLVIDE_CONTRASENA = 'Recuperar Contraseña';
  static const TARIFAS_PISTA = 'Tarifas Pista';
  static const PAGO_TPV = 'pago_tpv';
  static const PRUEBAS = 'pruebas';
  static const ELIMINAR_CUENTA = 'Eliminar Cuenta';
  static const VALIDAR_EMAIL = 'Validar Email';
  static const RESERVA_COMPARTIDA = 'Reserva Compartida';
  static const ADMINISTRADOR = 'Administrador';
  static const AMIGOS = 'Amigos';
  // static const MIS_BONOS = 'mis_bonos';
  static const MIS_PEDIDOS = 'Mis Pedidos';
  static const MIS_CLUBES = 'Mis Clubs';
  static const HISTORIAL_USUARIO = 'Historial Usuario';
  static const TARIFAS_PROVEEDOR = 'Tarifas Proveedor';
  static const PISTAS_PROVEEDOR = 'Pistas Proveedor';
  static const LOGIN_ADMINISTRADOR = 'Login Administrador';
  static const MIS_BONOS_PROVEEDOR = 'Mis Bonos | Proveedor';
  static const RESERVAS_ADMINISTRADOR = 'Mis Bonos | Proveedor';
}

/// Names Routes
abstract class Routes {
  static final LOGIN_USUARIO = RoutesType.login_usuario.getRoute;
  static final REGISTRAR_USUARIO = RoutesType.registrar_usuario.getRoute;
  static final PERFIL = RoutesType.perfil.getRoute;
  static final MIS_RESERVAS = RoutesType.mis_reservas.getRoute;
  static final DATOS = RoutesType.datos.getRoute;
  static final PERFIL_PROVEEDOR = RoutesType.perfil_proveedor.getRoute;
  static final MONEDERO = RoutesType.monedero.getRoute;
  static final CAJA = RoutesType.caja.getRoute;
  static final ANADIR_PISTA = RoutesType.anadir_pista.getRoute;
  static final TARIFAS = RoutesType.tarifas.getRoute;
  static final MIS_PISTAS = RoutesType.mis_pistas.getRoute;
  static final NOTIFICACIONES = RoutesType.notificaciones.getRoute;
  static final NOTIFICACIONES_PROVEEDOR =
      RoutesType.notificaciones_proveedor.getRoute;
  static final INICIO_PROVEEDOR = RoutesType.inicio_proveedor.getRoute;
  static final INICIO = RoutesType.inicio.getRoute;
  static final RESERVAR_PISTA = RoutesType.reservar_pista.getRoute;
  static final PAGOS_TARJETA = RoutesType.pagos_tarjeta.getRoute;
  static final REGISTRAR_PROVEEDOR = RoutesType.registrar_proveedor.getRoute;
  static final MIS_SOCIOS = RoutesType.mis_socios.getRoute;
  static final DATOS_PROVEEDOR = RoutesType.datos_proveedor.getRoute;
  static final PRUEBA_PROVEEDOR = RoutesType.prueba_proveedor.getRoute;
  static final CHAT = RoutesType.chat.getRoute;
  static final RESULTADOS_ESTADISTICAS =
      RoutesType.resultados_estadisticas.getRoute;
  static final CHAT_PROVEEDOR = RoutesType.chat_proveedor.getRoute;
  static final RESERVA_TU_PISTA = RoutesType.reserva_tu_pista.getRoute;
  static final DATOS_USUARIO = RoutesType.datos_usuario.getRoute;
  static final OLVIDE_CONTRASENA = RoutesType.olvide_contrasena.getRoute;
  static final TARIFAS_PISTA = RoutesType.tarifas_pista.getRoute;
  static final PAGO_TPV = RoutesType.pago_tpv.getRoute;
  static final PRUEBAS = RoutesType.pruebas.getRoute;
  static final ELIMINAR_CUENTA = RoutesType.eliminar_cuenta.getRoute;
  static final VALIDAR_EMAIL = RoutesType.validar_email.getRoute;
  static final RESERVA_COMPARTIDA = RoutesType.reserva_compartida.getRoute;
  static final ADMINISTRADOR = RoutesType.administrador.getRoute;
  static final AMIGOS = RoutesType.amigos.getRoute;
  // static final MIS_BONOS = RoutesType.mis_bonos.getRoute;
  static final MIS_PEDIDOS = RoutesType.mis_pedidos.getRoute;
  static final MIS_CLUBES = RoutesType.mis_clubes.getRoute;
  static final HISTORIAL_USUARIO = RoutesType.historial_usuario.getRoute;
  static final TARIFAS_PROVEEDOR = RoutesType.tarifas_proveedor.getRoute;
  static final PISTAS_PROVEEDOR = RoutesType.pistas_proveedor.getRoute;
  static final LOGIN_ADMINISTRADOR = RoutesType.login_administrador.getRoute;
  static final MIS_BONOS = RoutesType.mis_bonos.getRoute;
  static final MIS_BONOS_PROVEEDOR = RoutesType.mis_bonos_proveedor.getRoute;
  static final PRUEBA_ADMINISTRADOR = RoutesType.prueba_administrador.getRoute;
  static final DETALLES_USUARIOS_ADMINISTRADOR =
      RoutesType.detalles_usuarios_administrador.getRoute;
}

/// Get Routes
class AppPages {
  static final INITIAL = Routes.LOGIN_USUARIO;
  static final routes = [
    /// Login Usuario
    GetPage(
      name: Routes.LOGIN_USUARIO,
      page: () => LoginUsuarioPage(),
      binding: LoginUsuarioBinding(),
      title: Titulos.LOGIN_USUARIO,
    ),

    /// Registrar Usuario
    GetPage(
      name: Routes.REGISTRAR_USUARIO,
      page: () => const RegistrarUsuarioPage(),
      binding: RegistrarUsuarioBinding(),
      title: Titulos.REGISTRAR_USUARIO,
    ),

    /// Registrar Proveedor
    GetPage(
      name: Routes.REGISTRAR_PROVEEDOR,
      page: () => RegistrarProveedorPage(),
      binding: RegistrarProveedorBinding(),
      title: Titulos.REGISTRAR_PROVEEDOR,
    ),

    /// Inicio Usuario
    GetPage(
      name: Routes.INICIO,
      binding: InicioBinding(),
      page: () => InicioPage(),
      transition: Transition.noTransition,
      title: Titulos.INICIO,
    ),

    /// Mis Reservas
    GetPage(
      name: Routes.MIS_RESERVAS,
      page: () => const MisReservasPage(),
      binding: MisReservasBinding(),
      transition: Transition.noTransition,
      title: Titulos.MIS_RESERVAS,
    ),

    /// Reservar pista
    GetPage(
      name: Routes.RESERVAR_PISTA,
      page: () => ReservarPistaPage(),
      binding: ReservarPistaBinding(),
      transition: Transition.noTransition,
      title: Titulos.RESERVAR_PISTA,
    ),

    /// Monedero
    GetPage(
      name: Routes.MONEDERO,
      page: () => MonederoPage(),
      binding: MonederoBinding(),
      transition: Transition.noTransition,
      title: Titulos.MONEDERO,
    ),

    /// Perfil Usuario
    GetPage(
      name: Routes.PERFIL,
      binding: PerfilBinding(),
      page: () => const PerfilPage(),
      transition: Transition.noTransition,
      title: Titulos.PERFIL,
    ),

    /// Datos Usuario
    GetPage(
      name: Routes.DATOS_USUARIO,
      page: () => DatosUsuarioPage(),
      binding: DatosUsuarioBinding(),
      title: Titulos.DATOS_USUARIO,
    ),

    /// Reserva Compartida por Usuario
    GetPage(
      name: Routes.RESERVA_COMPARTIDA,
      page: () => const ReservaCompartidaPage(),
      binding: ReservaCompartidaBinding(),
      title: Titulos.RESERVA_COMPARTIDA,
    ),

    /// Notificaciones Usuario
    GetPage(
      name: Routes.NOTIFICACIONES,
      page: () => const NotificacionesWidget(),
      transition: Transition.zoom,
      title: Titulos.NOTIFICACIONES,
    ),

    /// Chat Usuario
    GetPage(
      name: Routes.CHAT,
      page: () => ChatPage(),
      binding: ChatBinding(),
      title: Titulos.CHAT,
    ),

    /// Inicio Proveedor
    GetPage(
      name: Routes.INICIO_PROVEEDOR,
      binding: InicioProveedorBinding(),
      page: () => InicioProveedorPage(),
      transition: Transition.noTransition,
      title: Titulos.INICIO_PROVEEDOR,
    ),

    /// Mis Pistas
    GetPage(
      name: Routes.MIS_PISTAS,
      page: () => MisPistasPage(),
      binding: MisPistasBinding(),
      transition: Transition.noTransition,
      title: Titulos.MIS_PISTAS,
    ),

    /// Anadir Pista
    GetPage(
      name: Routes.ANADIR_PISTA,
      page: () => AnadirPistaPage(),
      binding: AnadirPistaBinding(),
      transition: Transition.noTransition,
      title: Titulos.ANADIR_PISTA,
    ),

    /// Mis Socios
    GetPage(
      name: Routes.MIS_SOCIOS,
      page: () => const MisSociosPage(),
      binding: MisSociosBinding(),
      transition: Transition.noTransition,
      title: Titulos.MIS_SOCIOS,
    ),

    /// Perfil Proveedor
    GetPage(
      name: Routes.PERFIL_PROVEEDOR,
      binding: PerfilProveedorBinding(),
      page: () => const PerfilProveedorPage(),
      transition: Transition.noTransition,
      title: Titulos.PERFIL_PROVEEDOR,
    ),

    /// Datos Proveedor
    GetPage(
      name: Routes.DATOS_PROVEEDOR,
      binding: DatosProveedorBinding(),
      page: () => DatosProveedorPage(),
      title: Titulos.DATOS_PROVEEDOR,
    ),

    /// Caja
    GetPage(
      name: Routes.CAJA,
      binding: BancoVirtualBinding(),
      page: () => BancoVirtualPage(),
      transition: Transition.noTransition,
      title: Titulos.CAJA,
    ),

    /// Notificaciones Proveedor
    GetPage(
      name: Routes.NOTIFICACIONES_PROVEEDOR,
      page: () => const NotificacionesProfesionalPage(),
      title: Titulos.NOTIFICACIONES_PROVEEDOR,
    ),

    /// Resultados Estadisticas
    GetPage(
      name: Routes.RESULTADOS_ESTADISTICAS,
      page: () => ResultadosEstadisticasPage(),
      binding: ResultadosEstadisticasBinding(),
      title: Titulos.RESULTADOS_ESTADISTICAS,
    ),

    /// Chat Proveedor
    GetPage(
      name: Routes.CHAT_PROVEEDOR,
      page: () => ChatProveedorPage(),
      binding: ChatProveedorBinding(),
      title: Titulos.CHAT_PROVEEDOR,
    ),

    /// Olvide Contrasena
    GetPage(
      name: Routes.OLVIDE_CONTRASENA,
      page: () => const OlvideContrasenaPage(),
      binding: OlvideContrasenaBinding(),
      middlewares: [RouteRedirectMiddleware()],
      title: Titulos.OLVIDE_CONTRASENA,
    ),

    /// Tarifas pista
    GetPage(
      name: Routes.TARIFAS_PISTA,
      page: () => const TarifasPistaPage(),
      binding: TarifasPistaBinding(),
      title: Titulos.TARIFAS_PISTA,
    ),

    /// Pago TPV
    GetPage(
      name: Routes.PAGO_TPV,
      page: () => PagoTpvPage(),
      binding: PagoTpvBinding(),
      title: Titulos.PAGO_TPV,
    ),

    /// Eliminar cuenta, ya sea de usuario o proveedor
    GetPage(
      name: Routes.ELIMINAR_CUENTA,
      page: () => const EliminarCuentaPage(),
      binding: EliminarCuentaBinding(),
      title: Titulos.ELIMINAR_CUENTA,
    ),

    /// Validar email
    GetPage(
      name: Routes.VALIDAR_EMAIL,
      page: () => ValidarEmailPage(),
      binding: ValidarEmailBinding(),
      title: Titulos.VALIDAR_EMAIL,
    ),

    /// Pagina para Administrador
    GetPage(
      name: Routes.ADMINISTRADOR,
      page: () => const AdminPageWidget(),
      binding: AdminPageBinding(),
      title: Titulos.ADMINISTRADOR,
    ),

    /// Pagina para Amigos
    GetPage(
      name: Routes.AMIGOS,
      page: () => AmigosPage(),
      binding: AmigosBinding(),
      title: Titulos.AMIGOS,
    ),

    // / Pagina para Mis Bonos
    GetPage(
      name: Routes.MIS_BONOS,
      page: () => const MisBonosPage(true),
      binding: MisBonosBinding(),
    ),

    /// Pagina para Mis Pedidos
    GetPage(
      name: Routes.MIS_PEDIDOS,
      page: () => const MisPedidosPage(),
      binding: MisPedidosBinding(),
      title: Titulos.MIS_PEDIDOS,
    ),

    /// Pagina para Mis Clubes
    GetPage(
      name: Routes.MIS_CLUBES,
      page: () => const MisClubesPage(),
      binding: MisClubesBinding(),
      title: Titulos.MIS_CLUBES,
    ),

    /// Pagina para pruebas
    GetPage(
      name: Routes.HISTORIAL_USUARIO,
      page: () => const HistorialPage(),
      binding: HistorialBinding(),
      title: Titulos.HISTORIAL_USUARIO,
    ),

    /// Pagina para tarifas del proveedor
    GetPage(
      name: Routes.TARIFAS_PROVEEDOR,
      page: () => const TarifasProveedorPage(),
      binding: TarifasProveedorBinding(),
      title: Titulos.TARIFAS_PROVEEDOR,
    ),

    /// Pagina para pistas del proveedor
    GetPage(
      name: Routes.PISTAS_PROVEEDOR,
      page: () => PistasProveedorPage(),
      binding: PistasProveedorBinding(),
      transition: Transition.noTransition,
      title: Titulos.PISTAS_PROVEEDOR,
    ),

    /// Pagina para Mis Bonos Proveedor
    GetPage(
      name: Routes.MIS_BONOS_PROVEEDOR,
      page: () => MisBonosProveedorPage(),
      binding: MisBonosProveedorBinding(),
      transition: Transition.noTransition,
      title: Titulos.MIS_BONOS_PROVEEDOR,
    ),

    /// Paginas del administrador
    /// Pagina para login administrador
    GetPage(
      name: Routes.LOGIN_ADMINISTRADOR,
      page: () => LoginAdministradorPage(),
      binding: LoginAdministradorBinding(),
      title: Titulos.LOGIN_ADMINISTRADOR,
    ),

    GetPage(
      name: Routes.DETALLES_USUARIOS_ADMINISTRADOR,
      page: () => DetallesUsuarioPage(),
      binding: DetallesUsuarioBinding(),
      title: Titulos.LOGIN_ADMINISTRADOR,
    ),

    /// Pagina para login administrador
    GetPage(
      name: Routes.PRUEBA_ADMINISTRADOR,
      page: () => PruebaAdministradorPage(),
      binding: PruebaAdministradorBinding(),
    ),

    /// Pagina para pruebas
    GetPage(
      name: Routes.PRUEBAS,
      page: () => PruebasPage(),
      binding: PruebasBinding(),
      title: Titulos.PRUEBAS,
    ),
  ];
}
