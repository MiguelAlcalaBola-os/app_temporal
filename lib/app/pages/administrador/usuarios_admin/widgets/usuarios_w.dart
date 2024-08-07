import 'package:reservatu_pista/app/routes/app_pages.dart';
import 'package:reservatu_pista/constants.dart';
import 'package:reservatu_pista/library/page_general.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'usuarios_m.dart';
export 'usuarios_m.dart';

class UsuariosWidget extends StatefulWidget {
  const UsuariosWidget({super.key});

  @override
  State<UsuariosWidget> createState() => _UsuariosWidgetState();
}

class _UsuariosWidgetState extends State<UsuariosWidget>
    with TickerProviderStateMixin {
  late UsuariosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsuariosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});

    _model.searchBarTextController ??= TextEditingController();
    _model.searchBarFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: const Offset(50.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: const Offset(50.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: const Offset(50.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            begin: const Offset(50.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ResponsiveWeb(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 0),
                child: TextFormField(
                  controller: _model.searchBarTextController,
                  focusNode: _model.searchBarFocusNode,
                  textCapitalization: TextCapitalization.words,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Buscar usuario',
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                            ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFFF5963),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFFF5963),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF1F4F8),
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF57636C),
                      size: 16,
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: const Color(0xFF14181B),
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                      ),
                  validator: _model.searchBarTextControllerValidator
                      .asValidator(context),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSendMessage('Correo', Icons.mail, () {
                      print("Send correo");
                    }),
                    _buildSendMessage('Mensaje', Icons.message_sharp, () {
                      print("Send mensaje");
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: ResponsiveWeb(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildUsuario(),
                _buildUsuario(),
                _buildUsuario(),
                _buildUsuario(),
                _buildUsuario(),
                _buildUsuario(),
              ],
            ),
          ),
        ))
      ],
    );
  }

  Widget _buildUsuario() {
    return Padding(
      padding: paddingAll,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              color: Color.fromARGB(142, 0, 0, 0),
              offset: Offset(
                0.0,
                2,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
        ),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            // context.pushNamed('detallesUsuarios');
            Get.toNamed(Routes.DETALLES_USUARIOS_ADMINISTRADOR);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: paddingAll,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxmYWNlJTIwY2xvc2UlMjB1cHxlbnwwfHx8fDE3MTE0Njk1NzZ8MA&ixlib=rb-4.0.3&q=80&w=400',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Isabel Garcia Garcia',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Readex Pro',
                                    color: const Color(0xFF14181B),
                                    fontSize: 16,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              unselectedWidgetColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                            child: Checkbox(
                              value: _model.checkboxValue1 ??= false,
                              onChanged: (newValue) async {
                                setState(
                                    () => _model.checkboxValue1 = newValue!);
                              },
                              side: BorderSide(
                                width: 2,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              activeColor:
                                  FlutterFlowTheme.of(context).successGeneral,
                              checkColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                        ),
                      ],
                    ),
                    _buildDatosUsuario()
                  ],
                ),
              ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
    );
  }

  /// Mostrar los datos del usuario
  Widget _buildDatosUsuario() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'mike',
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
              ),
        ),
        Text(
          'app@reservatupista.com',
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                fontFamily: 'Readex Pro',
                color: FlutterFlowTheme.of(context).primary,
                letterSpacing: 0,
              ),
        ),
        Text(
          '654987321',
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
              ),
        ),
        Text(
          'Partidas jugadas: 10',
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
              ),
        ),
        Text(
          'Monedero: 10,00 €',
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0,
              ),
        ),
      ],
    );
  }

  /// Botones de correo
  Widget _buildSendMessage(
      String text, IconData icon, dynamic Function()? onPressed) {
    return FFButtonWidget(
      onPressed: onPressed,
      text: text,
      icon: Icon(
        icon,
        size: 15,
      ),
      options: FFButtonOptions(
        height: 40,
        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        color: FlutterFlowTheme.of(context).primaryText,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Readex Pro',
              color: Colors.white,
              letterSpacing: 0,
            ),
        elevation: 3,
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
