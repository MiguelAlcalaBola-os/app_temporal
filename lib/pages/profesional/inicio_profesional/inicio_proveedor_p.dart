import 'package:get/get.dart';
import 'package:reservatu_pista/components/navbar_y_appbar_profesional.dart';
import 'package:reservatu_pista/utils/responsive_web.dart';
import './inicio_proveedor_c.dart';
import 'package:reservatu_pista/pages/usuario/inicio/widgets/detalle_noticia.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../../backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reservatu_pista/utils/carousel/carousel_slider.dart';
import 'widgets/oferta.dart';

class InicioProveedorPage extends GetView<InicioProveedorController> {
  InicioProveedorPage({super.key});
  InicioProveedorController get self => controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }
    return NavbarYAppbarProfesional(
      title: 'Inicio',
      page: TypePage.Inicio,
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResponsiveWeb(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: LightModeTheme().secondaryBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Text(
                              'Partidas abiertas:',
                              style: LightModeTheme().headlineSmall.override(
                                    fontFamily: 'Outfit',
                                  ),
                            ),
                          ),
                          5.0.sh,
                          Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x230E151B),
                                  offset: Offset(
                                    0.0,
                                    2,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: LightModeTheme().reservaPendiente,
                                width: 4,
                              ),
                            ),
                          ),

                          // Align(
                          //   alignment: const AlignmentDirectional(0, 0),
                          //   child: Text(
                          //     'Partidas abiertas:',
                          //     style: LightModeTheme().headlineSmall.override(
                          //           fontFamily: 'Outfit',
                          //         ),
                          //   ),
                          // ),

                          // SingleChildScrollView(
                          //   scrollDirection: Axis.horizontal,
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     children: [
                          //       Padding(
                          //         padding: const EdgeInsetsDirectional.fromSTEB(
                          //             7, 12, 7, 8),
                          //         child: InkWell(
                          //           splashColor: Colors.transparent,
                          //           focusColor: Colors.transparent,
                          //           hoverColor: Colors.transparent,
                          //           highlightColor: Colors.transparent,
                          //           onTap: () async {
                          //             // context.pushNamed('detalleReservaProveedor');
                          //           },
                          //           child: Material(
                          //             color: Colors.transparent,
                          //             elevation: 2,
                          //             shape: RoundedRectangleBorder(
                          //               borderRadius: BorderRadius.circular(12),
                          //             ),
                          //             child: Container(
                          //               height: 200,
                          //               decoration: BoxDecoration(
                          //                 color: Colors.white,
                          //                 boxShadow: const [
                          //                   BoxShadow(
                          //                     blurRadius: 4,
                          //                     color: Color(0x230E151B),
                          //                     offset: Offset(
                          //                       0.0,
                          //                       2,
                          //                     ),
                          //                   ),
                          //                 ],
                          //                 borderRadius:
                          //                     BorderRadius.circular(12),
                          //                 border: Border.all(
                          //                   color: LightModeTheme()
                          //                       .reservaPendiente,
                          //                   width: 4,
                          //                 ),
                          //               ),
                          //               child: Stack(
                          //                 children: [
                          //                   Align(
                          //                     alignment:
                          //                         const AlignmentDirectional(
                          //                             -0.98, -1.08),
                          //                     child: Padding(
                          //                       padding:
                          //                           const EdgeInsetsDirectional
                          //                               .fromSTEB(2, 15, 0, 0),
                          //                       child: ClipRRect(
                          //                         borderRadius:
                          //                             const BorderRadius.only(
                          //                           bottomLeft:
                          //                               Radius.circular(12),
                          //                           bottomRight:
                          //                               Radius.circular(0),
                          //                           topLeft:
                          //                               Radius.circular(12),
                          //                           topRight:
                          //                               Radius.circular(0),
                          //                         ),
                          //                         child: Image.network(
                          //                           'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/U1F3BE.png',
                          //                           width: 44,
                          //                           height: 44,
                          //                           fit: BoxFit.cover,
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   Align(
                          //                     alignment:
                          //                         const AlignmentDirectional(
                          //                             0, -0.72),
                          //                     child: Padding(
                          //                       padding:
                          //                           const EdgeInsetsDirectional
                          //                               .fromSTEB(50, 0, 12, 0),
                          //                       child: Column(
                          //                         mainAxisSize:
                          //                             MainAxisSize.min,
                          //                         mainAxisAlignment:
                          //                             MainAxisAlignment.center,
                          //                         crossAxisAlignment:
                          //                             CrossAxisAlignment.center,
                          //                         children: [
                          //                           Row(
                          //                             mainAxisSize:
                          //                                 MainAxisSize.max,
                          //                             mainAxisAlignment:
                          //                                 MainAxisAlignment
                          //                                     .spaceBetween,
                          //                             children: [
                          //                               Align(
                          //                                 alignment:
                          //                                     const AlignmentDirectional(
                          //                                         0, 0),
                          //                                 child: Text(
                          //                                   'Ayto Riolobos',
                          //                                   style:
                          //                                       LightModeTheme()
                          //                                           .bodyLarge
                          //                                           .override(
                          //                                             fontFamily:
                          //                                                 'Readex Pro',
                          //                                             color: const Color(
                          //                                                 0xFF14181B),
                          //                                             fontSize:
                          //                                                 16,
                          //                                             letterSpacing:
                          //                                                 0,
                          //                                             fontWeight:
                          //                                                 FontWeight
                          //                                                     .w500,
                          //                                           ),
                          //                                 ),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                           Row(
                          //                             mainAxisSize:
                          //                                 MainAxisSize.max,
                          //                             mainAxisAlignment:
                          //                                 MainAxisAlignment
                          //                                     .spaceBetween,
                          //                             children: [
                          //                               Text(
                          //                                 'Pista 1 - ModularBox',
                          //                                 style:
                          //                                     LightModeTheme()
                          //                                         .bodyLarge
                          //                                         .override(
                          //                                           fontFamily:
                          //                                               'Readex Pro',
                          //                                           color: const Color(
                          //                                               0xFF14181B),
                          //                                           fontSize:
                          //                                               16,
                          //                                           fontWeight:
                          //                                               FontWeight
                          //                                                   .w500,
                          //                                         ),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                           Row(
                          //                             mainAxisSize:
                          //                                 MainAxisSize.max,
                          //                             mainAxisAlignment:
                          //                                 MainAxisAlignment
                          //                                     .spaceBetween,
                          //                             children: [
                          //                               Padding(
                          //                                 padding:
                          //                                     const EdgeInsetsDirectional
                          //                                         .fromSTEB(
                          //                                         0, 4, 0, 4),
                          //                                 child: Text(
                          //                                   '09.00 - 10:30',
                          //                                   style:
                          //                                       LightModeTheme()
                          //                                           .labelSmall
                          //                                           .override(
                          //                                             fontFamily:
                          //                                                 'Readex Pro',
                          //                                             color: const Color(
                          //                                                 0xFF57636C),
                          //                                             fontSize:
                          //                                                 12,
                          //                                             letterSpacing:
                          //                                                 0,
                          //                                             fontWeight:
                          //                                                 FontWeight
                          //                                                     .w500,
                          //                                           ),
                          //                                 ),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                         ].divide(const SizedBox(
                          //                             height: 5)),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   Align(
                          //                     alignment:
                          //                         const AlignmentDirectional(
                          //                             -0.79, 0.87),
                          //                     child: Padding(
                          //                       padding:
                          //                           const EdgeInsetsDirectional
                          //                               .fromSTEB(4, 0, 4, 4),
                          //                       child: Row(
                          //                         mainAxisSize:
                          //                             MainAxisSize.max,
                          //                         mainAxisAlignment:
                          //                             MainAxisAlignment
                          //                                 .spaceEvenly,
                          //                         crossAxisAlignment:
                          //                             CrossAxisAlignment.start,
                          //                         children: [
                          //                           Padding(
                          //                             padding:
                          //                                 const EdgeInsetsDirectional
                          //                                     .fromSTEB(
                          //                                     0, 0, 8, 0),
                          //                             child: Column(
                          //                               mainAxisSize:
                          //                                   MainAxisSize.min,
                          //                               crossAxisAlignment:
                          //                                   CrossAxisAlignment
                          //                                       .center,
                          //                               children: [
                          //                                 Padding(
                          //                                   padding:
                          //                                       const EdgeInsetsDirectional
                          //                                           .fromSTEB(
                          //                                           0, 0, 8, 0),
                          //                                   child: Container(
                          //                                     width: 32,
                          //                                     height: 32,
                          //                                     decoration:
                          //                                         BoxDecoration(
                          //                                       color:
                          //                                           LightModeTheme()
                          //                                               .accent4,
                          //                                       borderRadius:
                          //                                           BorderRadius
                          //                                               .circular(
                          //                                                   24),
                          //                                     ),
                          //                                     child: Container(
                          //                                       width: 120,
                          //                                       height: 120,
                          //                                       clipBehavior: Clip
                          //                                           .antiAlias,
                          //                                       decoration:
                          //                                           const BoxDecoration(
                          //                                         shape: BoxShape
                          //                                             .circle,
                          //                                       ),
                          //                                       child: Image
                          //                                           .network(
                          //                                         'https://picsum.photos/seed/120/600',
                          //                                         fit: BoxFit
                          //                                             .cover,
                          //                                       ),
                          //                                     ),
                          //                                   ),
                          //                                 ),
                          //                                 Align(
                          //                                   alignment:
                          //                                       const AlignmentDirectional(
                          //                                           -1, 0),
                          //                                   child: Padding(
                          //                                     padding:
                          //                                         const EdgeInsetsDirectional
                          //                                             .fromSTEB(
                          //                                             0,
                          //                                             5,
                          //                                             0,
                          //                                             0),
                          //                                     child: Text(
                          //                                       'NickUno',
                          //                                       style: LightModeTheme()
                          //                                           .bodyMedium
                          //                                           .override(
                          //                                             fontFamily:
                          //                                                 'Readex Pro',
                          //                                             letterSpacing:
                          //                                                 0,
                          //                                           ),
                          //                                     ),
                          //                                   ),
                          //                                 ),
                          //                                 Align(
                          //                                   alignment:
                          //                                       const AlignmentDirectional(
                          //                                           -1, 0),
                          //                                   child: Padding(
                          //                                     padding:
                          //                                         const EdgeInsetsDirectional
                          //                                             .fromSTEB(
                          //                                             0,
                          //                                             5,
                          //                                             0,
                          //                                             0),
                          //                                     child: Text(
                          //                                       '4.25',
                          //                                       style: LightModeTheme()
                          //                                           .bodyMedium
                          //                                           .override(
                          //                                             fontFamily:
                          //                                                 'Readex Pro',
                          //                                             letterSpacing:
                          //                                                 0,
                          //                                           ),
                          //                                     ),
                          //                                   ),
                          //                                 ),
                          //                               ],
                          //                             ),
                          //                           ),
                          //                           Padding(
                          //                             padding:
                          //                                 const EdgeInsetsDirectional
                          //                                     .fromSTEB(
                          //                                     0, 0, 8, 0),
                          //                             child: Column(
                          //                               mainAxisSize:
                          //                                   MainAxisSize.min,
                          //                               crossAxisAlignment:
                          //                                   CrossAxisAlignment
                          //                                       .center,
                          //                               children: [
                          //                                 Padding(
                          //                                   padding:
                          //                                       const EdgeInsetsDirectional
                          //                                           .fromSTEB(
                          //                                           0, 0, 8, 0),
                          //                                   child: Container(
                          //                                     width: 32,
                          //                                     height: 32,
                          //                                     decoration:
                          //                                         BoxDecoration(
                          //                                       color:
                          //                                           LightModeTheme()
                          //                                               .accent4,
                          //                                       borderRadius:
                          //                                           BorderRadius
                          //                                               .circular(
                          //                                                   24),
                          //                                     ),
                          //                                     child: Container(
                          //                                       width: 120,
                          //                                       height: 120,
                          //                                       clipBehavior: Clip
                          //                                           .antiAlias,
                          //                                       decoration:
                          //                                           const BoxDecoration(
                          //                                         shape: BoxShape
                          //                                             .circle,
                          //                                       ),
                          //                                       child: Image
                          //                                           .network(
                          //                                         'https://picsum.photos/seed/120/600',
                          //                                         fit: BoxFit
                          //                                             .cover,
                          //                                       ),
                          //                                     ),
                          //                                   ),
                          //                                 ),
                          //                                 Padding(
                          //                                   padding:
                          //                                       const EdgeInsetsDirectional
                          //                                           .fromSTEB(
                          //                                           0, 5, 0, 0),
                          //                                   child: Text(
                          //                                     'NickDos',
                          //                                     style:
                          //                                         LightModeTheme()
                          //                                             .bodyMedium
                          //                                             .override(
                          //                                               fontFamily:
                          //                                                   'Readex Pro',
                          //                                               letterSpacing:
                          //                                                   0,
                          //                                             ),
                          //                                   ),
                          //                                 ),
                          //                                 Padding(
                          //                                   padding:
                          //                                       const EdgeInsetsDirectional
                          //                                           .fromSTEB(
                          //                                           0, 5, 0, 0),
                          //                                   child: Text(
                          //                                     '4.00',
                          //                                     style:
                          //                                         LightModeTheme()
                          //                                             .bodyMedium
                          //                                             .override(
                          //                                               fontFamily:
                          //                                                   'Readex Pro',
                          //                                               letterSpacing:
                          //                                                   0,
                          //                                             ),
                          //                                   ),
                          //                                 ),
                          //                               ],
                          //                             ),
                          //                           ),
                          //                           Padding(
                          //                             padding:
                          //                                 const EdgeInsetsDirectional
                          //                                     .fromSTEB(
                          //                                     0, 0, 8, 0),
                          //                             child: Column(
                          //                               mainAxisSize:
                          //                                   MainAxisSize.min,
                          //                               crossAxisAlignment:
                          //                                   CrossAxisAlignment
                          //                                       .center,
                          //                               children: [
                          //                                 Padding(
                          //                                   padding:
                          //                                       const EdgeInsetsDirectional
                          //                                           .fromSTEB(
                          //                                           0, 0, 8, 0),
                          //                                   child: Container(
                          //                                     width: 32,
                          //                                     height: 32,
                          //                                     decoration:
                          //                                         BoxDecoration(
                          //                                       color:
                          //                                           LightModeTheme()
                          //                                               .accent4,
                          //                                       borderRadius:
                          //                                           BorderRadius
                          //                                               .circular(
                          //                                                   24),
                          //                                     ),
                          //                                     child: Container(
                          //                                       width: 120,
                          //                                       height: 120,
                          //                                       clipBehavior: Clip
                          //                                           .antiAlias,
                          //                                       decoration:
                          //                                           const BoxDecoration(
                          //                                         shape: BoxShape
                          //                                             .circle,
                          //                                       ),
                          //                                       child: Image
                          //                                           .network(
                          //                                         'https://picsum.photos/seed/645/600',
                          //                                         fit: BoxFit
                          //                                             .cover,
                          //                                       ),
                          //                                     ),
                          //                                   ),
                          //                                 ),
                          //                                 Padding(
                          //                                   padding:
                          //                                       const EdgeInsetsDirectional
                          //                                           .fromSTEB(
                          //                                           0, 5, 0, 0),
                          //                                   child: Text(
                          //                                     'NickDos',
                          //                                     style:
                          //                                         LightModeTheme()
                          //                                             .bodyMedium
                          //                                             .override(
                          //                                               fontFamily:
                          //                                                   'Readex Pro',
                          //                                               letterSpacing:
                          //                                                   0,
                          //                                             ),
                          //                                   ),
                          //                                 ),
                          //                                 Padding(
                          //                                   padding:
                          //                                       const EdgeInsetsDirectional
                          //                                           .fromSTEB(
                          //                                           0, 5, 0, 0),
                          //                                   child: Text(
                          //                                     '4.00',
                          //                                     style:
                          //                                         LightModeTheme()
                          //                                             .bodyMedium
                          //                                             .override(
                          //                                               fontFamily:
                          //                                                   'Readex Pro',
                          //                                               letterSpacing:
                          //                                                   0,
                          //                                             ),
                          //                                   ),
                          //                                 ),
                          //                               ],
                          //                             ),
                          //                           ),
                          //                           Column(
                          //                             mainAxisSize:
                          //                                 MainAxisSize.min,
                          //                             crossAxisAlignment:
                          //                                 CrossAxisAlignment
                          //                                     .center,
                          //                             children: [
                          //                               Padding(
                          //                                 padding:
                          //                                     const EdgeInsetsDirectional
                          //                                         .fromSTEB(
                          //                                         0, 0, 8, 0),
                          //                                 child: Container(
                          //                                   width: 32,
                          //                                   height: 32,
                          //                                   decoration:
                          //                                       BoxDecoration(
                          //                                     color:
                          //                                         LightModeTheme()
                          //                                             .accent4,
                          //                                     borderRadius:
                          //                                         BorderRadius
                          //                                             .circular(
                          //                                                 24),
                          //                                     border:
                          //                                         Border.all(
                          //                                       width: 1,
                          //                                     ),
                          //                                   ),
                          //                                   child: Icon(
                          //                                     Icons.add,
                          //                                     color: LightModeTheme()
                          //                                         .secondaryText,
                          //                                     size: 24,
                          //                                   ),
                          //                                 ),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                         ],
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsetsDirectional.fromSTEB(
                          //             7, 12, 7, 8),
                          //         child: InkWell(
                          //           splashColor: Colors.transparent,
                          //           focusColor: Colors.transparent,
                          //           hoverColor: Colors.transparent,
                          //           highlightColor: Colors.transparent,
                          //           onTap: () async {
                          //             // context.pushNamed('detalleReservaProveedor');
                          //           },
                          //           child: Material(
                          //             color: Colors.transparent,
                          //             elevation: 2,
                          //             shape: RoundedRectangleBorder(
                          //               borderRadius: BorderRadius.circular(12),
                          //             ),
                          //             child: Container(
                          //               height: 200,
                          //               decoration: BoxDecoration(
                          //                 color: Colors.white,
                          //                 boxShadow: [
                          //                   const BoxShadow(
                          //                     blurRadius: 4,
                          //                     color: Color(0x230E151B),
                          //                     offset: Offset(
                          //                       0.0,
                          //                       2,
                          //                     ),
                          //                   )
                          //                 ],
                          //                 borderRadius:
                          //                     BorderRadius.circular(12),
                          //                 border: Border.all(
                          //                   color: LightModeTheme()
                          //                       .reservaPendiente,
                          //                   width: 4,
                          //                 ),
                          //               ),
                          //               child: Stack(
                          //                 children: [
                          //                   Align(
                          //                     alignment:
                          //                         const AlignmentDirectional(
                          //                             -0.98, -1.08),
                          //                     child: Padding(
                          //                       padding:
                          //                           const EdgeInsetsDirectional
                          //                               .fromSTEB(2, 15, 0, 0),
                          //                       child: ClipRRect(
                          //                         borderRadius:
                          //                             const BorderRadius.only(
                          //                           bottomLeft:
                          //                               Radius.circular(12),
                          //                           bottomRight:
                          //                               Radius.circular(0),
                          //                           topLeft:
                          //                               Radius.circular(12),
                          //                           topRight:
                          //                               Radius.circular(0),
                          //                         ),
                          //                         child: Image.network(
                          //                           'https://www.adslzone.net/app/uploads-adslzone.net/2022/02/U1F3BE.png',
                          //                           width: 44,
                          //                           height: 44,
                          //                           fit: BoxFit.cover,
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   Align(
                          //                     alignment:
                          //                         const AlignmentDirectional(
                          //                             0, -0.72),
                          //                     child: Padding(
                          //                       padding:
                          //                           const EdgeInsetsDirectional
                          //                               .fromSTEB(50, 0, 12, 0),
                          //                       child: Column(
                          //                         mainAxisSize:
                          //                             MainAxisSize.min,
                          //                         mainAxisAlignment:
                          //                             MainAxisAlignment.center,
                          //                         crossAxisAlignment:
                          //                             CrossAxisAlignment.center,
                          //                         children: [
                          //                           Row(
                          //                             mainAxisSize:
                          //                                 MainAxisSize.max,
                          //                             mainAxisAlignment:
                          //                                 MainAxisAlignment
                          //                                     .spaceBetween,
                          //                             children: [
                          //                               Align(
                          //                                 alignment:
                          //                                     const AlignmentDirectional(
                          //                                         0, 0),
                          //                                 child: Text(
                          //                                   'Ayto Riolobos',
                          //                                   style:
                          //                                       LightModeTheme()
                          //                                           .bodyLarge
                          //                                           .override(
                          //                                             fontFamily:
                          //                                                 'Readex Pro',
                          //                                             color: const Color(
                          //                                                 0xFF14181B),
                          //                                             fontSize:
                          //                                                 16,
                          //                                             letterSpacing:
                          //                                                 0,
                          //                                             fontWeight:
                          //                                                 FontWeight
                          //                                                     .w500,
                          //                                           ),
                          //                                 ),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                           Row(
                          //                             mainAxisSize:
                          //                                 MainAxisSize.max,
                          //                             mainAxisAlignment:
                          //                                 MainAxisAlignment
                          //                                     .spaceBetween,
                          //                             children: [
                          //                               Text(
                          //                                 'Pista 1 - Patrocinador',
                          //                                 style:
                          //                                     LightModeTheme()
                          //                                         .bodyLarge
                          //                                         .override(
                          //                                           fontFamily:
                          //                                               'Readex Pro',
                          //                                           color: const Color(
                          //                                               0xFF14181B),
                          //                                           fontSize:
                          //                                               16,
                          //                                           fontWeight:
                          //                                               FontWeight
                          //                                                   .w500,
                          //                                         ),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                           Row(
                          //                             mainAxisSize:
                          //                                 MainAxisSize.max,
                          //                             mainAxisAlignment:
                          //                                 MainAxisAlignment
                          //                                     .spaceBetween,
                          //                             children: [
                          //                               Padding(
                          //                                 padding:
                          //                                     const EdgeInsetsDirectional
                          //                                         .fromSTEB(
                          //                                         0, 4, 0, 4),
                          //                                 child: Text(
                          //                                   '09.00 - 10:30',
                          //                                   style:
                          //                                       LightModeTheme()
                          //                                           .labelSmall
                          //                                           .override(
                          //                                             fontFamily:
                          //                                                 'Readex Pro',
                          //                                             color: const Color(
                          //                                                 0xFF57636C),
                          //                                             fontSize:
                          //                                                 12,
                          //                                             letterSpacing:
                          //                                                 0,
                          //                                             fontWeight:
                          //                                                 FontWeight
                          //                                                     .w500,
                          //                                           ),
                          //                                 ),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                         ].divide(const SizedBox(
                          //                             height: 5)),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   Align(
                          //                     alignment:
                          //                         const AlignmentDirectional(
                          //                             -0.79, 0.87),
                          //                     child: Padding(
                          //                       padding:
                          //                           const EdgeInsetsDirectional
                          //                               .fromSTEB(4, 0, 4, 4),
                          //                       child: Row(
                          //                         mainAxisSize:
                          //                             MainAxisSize.max,
                          //                         mainAxisAlignment:
                          //                             MainAxisAlignment
                          //                                 .spaceEvenly,
                          //                         children: [
                          //                           Padding(
                          //                             padding:
                          //                                 const EdgeInsetsDirectional
                          //                                     .fromSTEB(
                          //                                     0, 0, 8, 0),
                          //                             child: Column(
                          //                               mainAxisSize:
                          //                                   MainAxisSize.min,
                          //                               crossAxisAlignment:
                          //                                   CrossAxisAlignment
                          //                                       .center,
                          //                               children: [
                          //                                 Padding(
                          //                                   padding:
                          //                                       const EdgeInsetsDirectional
                          //                                           .fromSTEB(
                          //                                           0, 0, 8, 0),
                          //                                   child: Container(
                          //                                     width: 32,
                          //                                     height: 32,
                          //                                     decoration:
                          //                                         BoxDecoration(
                          //                                       color:
                          //                                           LightModeTheme()
                          //                                               .accent4,
                          //                                       borderRadius:
                          //                                           BorderRadius
                          //                                               .circular(
                          //                                                   24),
                          //                                     ),
                          //                                     child: Container(
                          //                                       width: 120,
                          //                                       height: 120,
                          //                                       clipBehavior: Clip
                          //                                           .antiAlias,
                          //                                       decoration:
                          //                                           const BoxDecoration(
                          //                                         shape: BoxShape
                          //                                             .circle,
                          //                                       ),
                          //                                       child: Image
                          //                                           .network(
                          //                                         'https://picsum.photos/seed/120/600',
                          //                                         fit: BoxFit
                          //                                             .cover,
                          //                                       ),
                          //                                     ),
                          //                                   ),
                          //                                 ),
                          //                                 Align(
                          //                                   alignment:
                          //                                       const AlignmentDirectional(
                          //                                           -1, 0),
                          //                                   child: Padding(
                          //                                     padding:
                          //                                         const EdgeInsetsDirectional
                          //                                             .fromSTEB(
                          //                                             0,
                          //                                             5,
                          //                                             0,
                          //                                             0),
                          //                                     child: Text(
                          //                                       'NickUno',
                          //                                       style: LightModeTheme()
                          //                                           .bodyMedium
                          //                                           .override(
                          //                                             fontFamily:
                          //                                                 'Readex Pro',
                          //                                             letterSpacing:
                          //                                                 0,
                          //                                           ),
                          //                                     ),
                          //                                   ),
                          //                                 ),
                          //                                 Align(
                          //                                   alignment:
                          //                                       const AlignmentDirectional(
                          //                                           -1, 0),
                          //                                   child: Padding(
                          //                                     padding:
                          //                                         const EdgeInsetsDirectional
                          //                                             .fromSTEB(
                          //                                             0,
                          //                                             5,
                          //                                             0,
                          //                                             0),
                          //                                     child: Text(
                          //                                       '4.25',
                          //                                       style: LightModeTheme()
                          //                                           .bodyMedium
                          //                                           .override(
                          //                                             fontFamily:
                          //                                                 'Readex Pro',
                          //                                             letterSpacing:
                          //                                                 0,
                          //                                           ),
                          //                                     ),
                          //                                   ),
                          //                                 ),
                          //                               ],
                          //                             ),
                          //                           ),
                          //                           Padding(
                          //                             padding:
                          //                                 const EdgeInsetsDirectional
                          //                                     .fromSTEB(
                          //                                     0, 0, 8, 0),
                          //                             child: Column(
                          //                               mainAxisSize:
                          //                                   MainAxisSize.min,
                          //                               crossAxisAlignment:
                          //                                   CrossAxisAlignment
                          //                                       .center,
                          //                               children: [
                          //                                 Padding(
                          //                                   padding:
                          //                                       const EdgeInsetsDirectional
                          //                                           .fromSTEB(
                          //                                           0, 0, 8, 0),
                          //                                   child: Container(
                          //                                     width: 32,
                          //                                     height: 32,
                          //                                     decoration:
                          //                                         BoxDecoration(
                          //                                       color:
                          //                                           LightModeTheme()
                          //                                               .accent4,
                          //                                       borderRadius:
                          //                                           BorderRadius
                          //                                               .circular(
                          //                                                   24),
                          //                                     ),
                          //                                     child: Container(
                          //                                       width: 120,
                          //                                       height: 120,
                          //                                       clipBehavior: Clip
                          //                                           .antiAlias,
                          //                                       decoration:
                          //                                           const BoxDecoration(
                          //                                         shape: BoxShape
                          //                                             .circle,
                          //                                       ),
                          //                                       child: Image
                          //                                           .network(
                          //                                         'https://picsum.photos/seed/120/600',
                          //                                         fit: BoxFit
                          //                                             .cover,
                          //                                       ),
                          //                                     ),
                          //                                   ),
                          //                                 ),
                          //                                 Padding(
                          //                                   padding:
                          //                                       const EdgeInsetsDirectional
                          //                                           .fromSTEB(
                          //                                           0, 5, 0, 0),
                          //                                   child: Text(
                          //                                     'NickDos',
                          //                                     style:
                          //                                         LightModeTheme()
                          //                                             .bodyMedium
                          //                                             .override(
                          //                                               fontFamily:
                          //                                                   'Readex Pro',
                          //                                               letterSpacing:
                          //                                                   0,
                          //                                             ),
                          //                                   ),
                          //                                 ),
                          //                                 Padding(
                          //                                   padding:
                          //                                       const EdgeInsetsDirectional
                          //                                           .fromSTEB(
                          //                                           0, 5, 0, 0),
                          //                                   child: Text(
                          //                                     '4.00',
                          //                                     style:
                          //                                         LightModeTheme()
                          //                                             .bodyMedium
                          //                                             .override(
                          //                                               fontFamily:
                          //                                                   'Readex Pro',
                          //                                               letterSpacing:
                          //                                                   0,
                          //                                             ),
                          //                                   ),
                          //                                 ),
                          //                               ],
                          //                             ),
                          //                           ),
                          //                           Padding(
                          //                             padding:
                          //                                 const EdgeInsetsDirectional
                          //                                     .fromSTEB(
                          //                                     0, 0, 8, 0),
                          //                             child: Column(
                          //                               mainAxisSize:
                          //                                   MainAxisSize.min,
                          //                               crossAxisAlignment:
                          //                                   CrossAxisAlignment
                          //                                       .center,
                          //                               children: [
                          //                                 Padding(
                          //                                   padding:
                          //                                       const EdgeInsetsDirectional
                          //                                           .fromSTEB(
                          //                                           0, 0, 8, 0),
                          //                                   child: Container(
                          //                                     width: 32,
                          //                                     height: 32,
                          //                                     decoration:
                          //                                         BoxDecoration(
                          //                                       color:
                          //                                           LightModeTheme()
                          //                                               .accent4,
                          //                                       borderRadius:
                          //                                           BorderRadius
                          //                                               .circular(
                          //                                                   24),
                          //                                     ),
                          //                                     child: Container(
                          //                                       width: 120,
                          //                                       height: 120,
                          //                                       clipBehavior: Clip
                          //                                           .antiAlias,
                          //                                       decoration:
                          //                                           const BoxDecoration(
                          //                                         shape: BoxShape
                          //                                             .circle,
                          //                                       ),
                          //                                       child: Image
                          //                                           .network(
                          //                                         'https://picsum.photos/seed/645/600',
                          //                                         fit: BoxFit
                          //                                             .cover,
                          //                                       ),
                          //                                     ),
                          //                                   ),
                          //                                 ),
                          //                                 Padding(
                          //                                   padding:
                          //                                       const EdgeInsetsDirectional
                          //                                           .fromSTEB(
                          //                                           0, 5, 0, 0),
                          //                                   child: Text(
                          //                                     'NickDos',
                          //                                     style:
                          //                                         LightModeTheme()
                          //                                             .bodyMedium
                          //                                             .override(
                          //                                               fontFamily:
                          //                                                   'Readex Pro',
                          //                                               letterSpacing:
                          //                                                   0,
                          //                                             ),
                          //                                   ),
                          //                                 ),
                          //                                 Padding(
                          //                                   padding:
                          //                                       const EdgeInsetsDirectional
                          //                                           .fromSTEB(
                          //                                           0, 5, 0, 0),
                          //                                   child: Text(
                          //                                     '4.00',
                          //                                     style:
                          //                                         LightModeTheme()
                          //                                             .bodyMedium
                          //                                             .override(
                          //                                               fontFamily:
                          //                                                   'Readex Pro',
                          //                                               letterSpacing:
                          //                                                   0,
                          //                                             ),
                          //                                   ),
                          //                                 ),
                          //                               ],
                          //                             ),
                          //                           ),
                          //                           Column(
                          //                             mainAxisSize:
                          //                                 MainAxisSize.min,
                          //                             crossAxisAlignment:
                          //                                 CrossAxisAlignment
                          //                                     .center,
                          //                             children: [
                          //                               Padding(
                          //                                 padding:
                          //                                     const EdgeInsetsDirectional
                          //                                         .fromSTEB(
                          //                                         0, 0, 8, 0),
                          //                                 child: Container(
                          //                                   width: 32,
                          //                                   height: 32,
                          //                                   decoration:
                          //                                       BoxDecoration(
                          //                                     color:
                          //                                         LightModeTheme()
                          //                                             .accent4,
                          //                                     borderRadius:
                          //                                         BorderRadius
                          //                                             .circular(
                          //                                                 24),
                          //                                   ),
                          //                                   child: Container(
                          //                                     width: 32,
                          //                                     height: 32,
                          //                                     decoration:
                          //                                         BoxDecoration(
                          //                                       color:
                          //                                           LightModeTheme()
                          //                                               .accent4,
                          //                                       borderRadius:
                          //                                           BorderRadius
                          //                                               .circular(
                          //                                                   24),
                          //                                       border:
                          //                                           Border.all(
                          //                                         width: 1,
                          //                                       ),
                          //                                     ),
                          //                                     child: Icon(
                          //                                       Icons.add,
                          //                                       color: LightModeTheme()
                          //                                           .secondaryText,
                          //                                       size: 24,
                          //                                     ),
                          //                                   ),
                          //                                 ),
                          //                               ),
                          //                               Padding(
                          //                                 padding:
                          //                                     const EdgeInsetsDirectional
                          //                                         .fromSTEB(
                          //                                         0, 5, 0, 0),
                          //                                 child: Text(
                          //                                   '',
                          //                                   style:
                          //                                       LightModeTheme()
                          //                                           .bodyMedium
                          //                                           .override(
                          //                                             fontFamily:
                          //                                                 'Readex Pro',
                          //                                             letterSpacing:
                          //                                                 0,
                          //                                           ),
                          //                                 ),
                          //                               ),
                          //                               Padding(
                          //                                 padding:
                          //                                     const EdgeInsetsDirectional
                          //                                         .fromSTEB(
                          //                                         0, 5, 0, 0),
                          //                                 child: Text(
                          //                                   '',
                          //                                   style:
                          //                                       LightModeTheme()
                          //                                           .bodyMedium
                          //                                           .override(
                          //                                             fontFamily:
                          //                                                 'Readex Pro',
                          //                                             letterSpacing:
                          //                                                 0,
                          //                                           ),
                          //                                 ),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                         ],
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 5),
                              child: Text(
                                'Noticias:',
                                style: LightModeTheme().headlineSmall.override(
                                      fontFamily: 'Outfit',
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 10),
                            child: SizedBox(
                              width: double.infinity,
                              height: context.w < 450 ? 120 : 180,
                              child: CarouselSlider(
                                items: [
                                  GestureDetector(
                                    onTap: () =>
                                        Get.dialog(const DetalleNoticia()),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTr4y2iO3DSI3bZ5rKnSkTY66IZ2r0MsSaUFfJMffG-GlmaXNL-7jvfOkt0MrtqZsmvkAE&usqp=CAU',
                                        width: 300,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1622669253059-e345500cf0e9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyNHx8cGFkZWwlMjB8ZW58MHx8fHwxNzEyNTY3NzExfDA&ixlib=rb-4.0.3&q=80&w=400',
                                      width: 300,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZnj9TdGE3M_sUl4_K6TWxydv2FINQ-NbppdQeeOarkXcNDc6zvfwWVUlF6XWW52a10nU&usqp=CAU',
                                      width: 300,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      'https://padelhome.es/wp-content/uploads/2015/01/Los-Cambios-de-Campo-Reglamento.jpg',
                                      width: 300,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                                carouselController: self.carouselController,
                                options: CarouselOptions(
                                  initialPage: 1,
                                  viewportFraction: 0.5,
                                  disableCenter: true,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.25,
                                  enableInfiniteScroll: true,
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: true,
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 1200),
                                  autoPlayInterval: const Duration(
                                      milliseconds: (1200 + 1200)),
                                  autoPlayCurve: Curves.linear,
                                  pauseAutoPlayInFiniteScroll: true,
                                  onPageChanged: (index, _) =>
                                      self.carouselCurrentIndex = index,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 5),
                              child: Text(
                                'Ofertas:',
                                style: LightModeTheme().headlineSmall.override(
                                      fontFamily: 'Outfit',
                                    ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: context.w < 450 ? 120 : 180,
                            child: CarouselSlider(
                              items: [
                                GestureDetector(
                                  onTap: () => Get.dialog(const Oferta()),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      'https://www.time2padel.com/blog/wp-content/uploads/2014/07/g_1405427007-ofertas-de-palas-de-padel-en-las-rebajas-2014.jpg',
                                      width: 300,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrfcQLwYhdiuyaSKhMLY8NxQF-5Nkuj1VwnA&usqp=CAU',
                                    width: 300,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ53e7nZGDHy2lY059uHEZ0JICBRAKOrCsLPg&usqp=CAU',
                                    width: 300,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScfo08zVfjxCSTDzC11kA8VwQpWcpoWfMMxw&usqp=CAU',
                                    width: 300,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                              carouselController: self.carouselController,
                              options: CarouselOptions(
                                initialPage: 1,
                                viewportFraction: 0.5,
                                disableCenter: true,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.25,
                                enableInfiniteScroll: true,
                                scrollDirection: Axis.horizontal,
                                autoPlay: true,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 1200),
                                autoPlayInterval:
                                    const Duration(milliseconds: (1200 + 1200)),
                                autoPlayCurve: Curves.linear,
                                pauseAutoPlayInFiniteScroll: true,
                                onPageChanged: (index, _) =>
                                    self.carouselCurrentIndex = index,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ].addToEnd(70.0.sh),
          ),
        ),
      ),
    );
  }
}
