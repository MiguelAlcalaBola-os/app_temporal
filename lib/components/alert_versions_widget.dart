// ignore_for_file: prefer_interpolation_to_compose_strings
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/app/data/services/db_s.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class DatosVersion {
  DatosVersion({required this.v, required this.info, required this.fecha});
  final String v;
  final String info;
  final String fecha;
}

class Versions extends StatelessWidget {
  Versions({
    super.key,
  });
  final DBService db = Get.find();
  List<DatosVersion> arrayVersion2() => [
        DatosVersion(
            v: '2.2.33', info: '''Enviar correos.''', fecha: '05/08/2024'),
        DatosVersion(
            v: '2.2.32', info: '''Enviar correos.''', fecha: '27/05/2024'),
        DatosVersion(
            v: '2.2.31',
            info: '''Mostrar reservas en noticias.''',
            fecha: '24/05/2024'),
        DatosVersion(
            v: '2.2.30', info: '''Mostrar reservas.''', fecha: '21/05/2024'),
        DatosVersion(
            v: '2.2.29', info: '''Editar imagenes.''', fecha: '19/05/2024'),
        DatosVersion(
            v: '2.2.28', info: '''Editar tarifas.''', fecha: '18/05/2024'),
        DatosVersion(
            v: '2.2.27', info: '''Editar tarifas.''', fecha: '17/05/2024'),
        DatosVersion(
            v: '2.2.26', info: '''Editar pista.''', fecha: '14/05/2024'),
        DatosVersion(
            v: '2.2.25',
            info: '''Editar pista en proceso.''',
            fecha: '14/05/2024'),
        DatosVersion(
            v: '2.2.24', info: '''Tiempo reserva.''', fecha: '13/05/2024'),
        DatosVersion(
            v: '2.2.23',
            info: '''Eliminar reservas como proveedor.''',
            fecha: '06/05/2024'),
        DatosVersion(
            v: '2.2.22',
            info: '''Eliminar reservas como proveedor.''',
            fecha: '05/05/2024'),
        DatosVersion(
            v: '2.2.21', info: '''Administrador.''', fecha: '05/05/2024'),
        DatosVersion(
            v: '2.2.20', info: '''Administrador.''', fecha: '04/05/2024'),
        DatosVersion(
            v: '2.2.19', info: '''Editar Pista.''', fecha: '03/05/2024'),
        DatosVersion(
            v: '2.2.18', info: '''Editar Pista.''', fecha: '30/05/2024'),
        DatosVersion(
            v: '2.2.17', info: '''Correcciones.''', fecha: '29/05/2024'),
        DatosVersion(
            v: '2.2.16', info: '''Ajustes de texto.''', fecha: '28/05/2024'),
        DatosVersion(
            v: '2.2.15', info: '''Administrador.''', fecha: '27/05/2024'),
        DatosVersion(
            v: '2.2.14', info: '''Bugs y errores.''', fecha: '27/05/2024'),
        DatosVersion(
            v: '2.2.13',
            info: '''Agregar seccion de Administrador.''',
            fecha: '24/05/2024'),
        DatosVersion(
            v: '2.2.12',
            info: '''Agregar seccion de Administrador.''',
            fecha: '21/05/2024'),
        DatosVersion(
            v: '2.2.11',
            info: '''Ajustes en envio de correo usuarios.''',
            fecha: '14/05/2024'),
        DatosVersion(
            v: '2.2.10',
            info: '''Ajustes para beneficio de los usuarios.''',
            fecha: '16/05/2024'),
        DatosVersion(
            v: '2.2.9',
            info: '''Claves de proposito para los usuarios.''',
            fecha: '02/05/2024'),
        DatosVersion(
            v: '2.2.8',
            info: '''Claves de proposito para los usuarios.''',
            fecha: '22/04/2024'),
        DatosVersion(
            v: '2.2.7',
            info:
                '''Datos no obligatorios en Registro de Usuario y Proveedor.''',
            fecha: '17/04/2024'),
        DatosVersion(
            v: '2.2.6',
            info:
                '''Datos no obligatorios en Registro de Usuario y Proveedor.''',
            fecha: '15/04/2024'),
        DatosVersion(
            v: '2.2.5', info: '''Eliminar cuentas.''', fecha: '11/04/2024'),
        DatosVersion(
            v: '2.2.4',
            info: '''Mostrar y agregar pistas.''',
            fecha: '04/04/2024'),
        DatosVersion(
            v: '2.2.3',
            info: '''Detalles en la interfaz.''',
            fecha: '01/04/2024'),
        DatosVersion(
            v: '2.2.2',
            info: '''Mensajes para el usuario.''',
            fecha: '28/03/2024'),
        DatosVersion(
            v: '2.2.1',
            info: '''Registro visualización interactiva.''',
            fecha: '27/03/2024'),
        DatosVersion(
            v: '2.2.0', info: '''Aplicación adactiva.''', fecha: '26/03/2024'),
      ];
  final List<DatosVersion> arrayVersionCambios = [
    DatosVersion(
        v: '2.1.10',
        info: '''Eliminar Cuenta en la web.
Cambiar usuario de pruebas, por app@reservatupista.com .
Agreagar los datos en resevatupista de la base de datos.''',
        fecha: '25/03/2024'),
    DatosVersion(
        v: '2.1.9',
        info: '''Error al iniciar sesion android.
Mostrar datos del proveedor y del usuario.
Error al dar permisos de internet.''',
        fecha: '20/03/2024'),
    DatosVersion(
        v: '2.1.8',
        info: '''Error al iniciar sesion.
Mostrar datos del proveedor y del usuario.''',
        fecha: '20/03/2024'),
    DatosVersion(
        v: '2.1.7',
        info:
            '''Solucinar errores para subir la app en play console y en app store.''',
        fecha: '19/03/2024'),
    DatosVersion(
        v: '2.1.6',
        info:
            '''Ajustes en la aplicacion al subiar la imagen, y distintos cambios de funcionalidad.
Registro datos no obligatorios.''',
        fecha: '15/03/2024'),
    DatosVersion(
        v: '2.1.5',
        info: '''Cambio en datos de usuario de prueba.
Recordar contrasena, y guardar localmente.
Cambio en los permisos para acceder a la camara de ios.
Cambio en los datos algunos no son obligatorios.''',
        fecha: '14/03/2024'),
    DatosVersion(
        v: '2.1.4',
        info: '''Acceso con usuario de prueba.''',
        fecha: '13/03/2024'),
    DatosVersion(
        v: '2.1.3',
        info: '''Corrección de botones.
Tokens Autenticacion login proveedor.
Login con acceso de tokens proveedor.
Email mas largo.
Registro de proveedor ajuste en certificado.
Obtencion de los datos mediante tokens.''',
        fecha: '13/03/2024'),
    DatosVersion(
        v: '2.1.2',
        info: '''Corrección de botones.
Tokens Autenticacion login.
Login con acceso de tokens.
Email mas largo.
Registro quitar datos establecidos.
Obtencion de los datos mediante tokens.''',
        fecha: '12/03/2024'),
    DatosVersion(
        v: '2.1.1',
        info: '''Corrección de botones.
Recargar Monedero Virtual.
Ajustes en Reservar Pista, Cancelar, Reservar Todo.''',
        fecha: '22/02/2024'),
    DatosVersion(
        v: '2.1.0',
        info:
            '''Corrección de ver términos y condiciones y inicio de sesión.''',
        fecha: '21/02/2024'),
    DatosVersion(
        v: '2.0.0',
        info: '''Correcciòn de botones mal cuadrados y eliminaciòn de datos.''',
        fecha: '20/02/2024'),
  ];
  final List arrayVersion = [
    {
      "version": "1.1.14",
      "list": """
- Subir la aplicacion a play store."""
    },
    {
      "version": "1.1.13",
      "list": """
- Subir la aplicacion a app store.  """
    },
    {
      "version": "1.1.12",
      "list": """
- Ficha del trabajador social al dar click en la imagen.  
- Botones de continuar a siguiente en registro y datos.
- Poder mover la pantalla en el inicio.
- Dependencia agregado grado 1 2 3.
- Añadir personas de contacto.
- Agregar importe en monedero, modificacion de los botones y que se agregue los decimales automaticamente.
- Registro no permitir pasar si aun no se han rellenado los campos.
- Confirmacion para ir a los enlaces.
- Pantallas de login para el profesiona."""
    },
    {
      "version": "1.1.11",
      "list": """
- Ajustar botones de login.  
- Contraseña que desaparezca despues de 2 segundos.
- Ajustar derechos y la version de bajo del titulo de riolobos.
- Check en Terminos y Condiciones.
- Diferente sonido al pedir una comida suena una campana.
- Total de comida en vez del boton.
- Cambio en los estados de comida, campana amarilla. Y boton para ir al monedero con el filtro de Comida.
- Las citas de los trabajadores cambio de solicitado a ocupado, agregacion del descanso en gris, y cambio del color de la X a Rojo."""
    },
    {
      "version": "1.1.10",
      "list": """
- Pantalla de datos y ajustes.  
- Pantalla de registro.
- Ajustes en monedero y historial.
- Ajustes pantalla de login."""
    },
    {
      "version": "1.1.9",
      "list": """
- Pantalla de lavanderia.  
- Pantalla de Monedero.
- Pantalla de Perfil.
- Ajustes pantalla material ortoprotesico."""
    },
    {
      "version": "1.1.8",
      "list": """
- Sonido de los botones.  
- Pantalla de Material Ortoprotesico
- Ajustes para el movimiento de pantallas y optimizacion. 
- Pantalla principal de Login."""
    },
    {
      "version": "1.1.7",
      "list":
          "- Pantalla Comida a Domicilio creada. \n- Ajustes de botones y de texto en Login \n- Agregacion de la lista de versiones."
    },
    {
      "version": "1.1.6",
      "list": """
- Pantalla de Cita con trabajadores.
' Ajustar de las pantallas de cita de trabajadores."""
    },
    {
      "version": "1.1.5",
      "list": """
- Pasar pantallas Adobe XD a Flutter.
- Creación de pantalla Login.
- Creación de pantalla de Servicos Sociales.
- Links mover a url externas."""
    },
    {
      "version": "1.1.4",
      "list": """
- Movimiento de pantallas.
- Ajustes de diseño."""
    },
    {
      "version": "1.1.3",
      "list": """
- Cambiar diseno de login.
- Agregacion de icono de modular.
- Movimiento de pantallas."""
    },
    {
      "version": "1.1.2",
      "list": """
- Ajustar pantallas en Adobe XD.  
- Cambio de colores en pantallas de servicios sociales."""
    },
    {
      "version": "1.1.1",
      "list": """
- Diseño Adobe XD
- Ajusted del diseño."""
    },
  ];
  Widget buildContainerVersion(DatosVersion data) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 5,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              data.v,
                              textAlign: TextAlign.start,
                              style: LightModeTheme().bodyLarge.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF15161E),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              data.fecha,
                              textAlign: TextAlign.start,
                              style: LightModeTheme().labelSmall.override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF606A85),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                        // Padding(
                        //   padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        //   child: Text(
                        //     data.info,
                        //     textAlign: TextAlign.start,
                        //     style: LightModeTheme().labelMedium.override(
                        //           fontFamily: 'Outfit',
                        //           color: Color(0xFF606A85),
                        //           fontSize: 14,
                        //           fontWeight: FontWeight.w500,
                        //         ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Material(
              color: Colors.transparent,
              child: buildAlertVersion(),
            );
          },
        );
      },
      child: Text(
        'Version ${db.version}',
        textAlign: TextAlign.center,
        style: LightModeTheme().bodyMedium.override(
              fontFamily: 'Readex Pro',
              color: LightModeTheme().tertiary,
              fontSize: 10,
              fontStyle: FontStyle.italic,
            ),
      ),
    );
  }

  List<Widget> buildVersions() {
    final List<Widget> result = [
      // Generated code for this Container Widget...
    ];
    for (var element in arrayVersion2()) {
      result.add(buildContainerVersion(element));
    }
    return result;
  }

  Widget buildAlertVersion() {
    return Scaffold(
      body: ResponsiveWeb(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                const Center(
                  child: Text(
                    "VERSIONES",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xff4285d0),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontFamily: "Roboto",
                        decoration: TextDecoration.none),
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: "Actual: ",
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: "Roboto",
                          fontSize: 25,
                          color: Colors.black),
                      children: [
                        TextSpan(
                          text: db.version,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              decoration: TextDecoration.none,
                              fontFamily: "Arial",
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        )
                      ]),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: buildVersions()),
              ),
            ),
            Center(
              child: SizedBox(
                width: Get.width * 0.5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ElevatedButton(
                    onPressed: Get.back,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xff4285d0)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 3, color: Color(0xff4285d0)),
                          borderRadius: BorderRadius.circular(
                              20.0), // Ajusta el radio de los bordes según tus necesidades
                        ),
                      ),
                    ),
                    child: const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "Cerrar",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(239, 255, 255, 255),
                            fontFamily: 'Roboto'),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
