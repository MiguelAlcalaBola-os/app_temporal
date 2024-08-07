import 'package:reservatu_pista/app/pages/profesional/mis_bonos_proveedor/widgets/crear_bono_w.dart';
import 'package:reservatu_pista/library/page_general.dart';
import 'mis_bonos_proveedor_c.dart';
import 'widgets/crear_bono_c.dart';
export 'mis_bonos_proveedor_m.dart';

class MisBonosProveedorPage extends GetView<MisBonosProveedorController> {
  const MisBonosProveedorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarProfesional(
        title: 'Mis Bonos',
        page: TypePage.None,
        child: Expanded(
            child: ResponsiveWeb(
          child: MisBonosProveedor(),
        )));
  }
}

class MisBonosProveedor extends StatefulWidget {
  const MisBonosProveedor({super.key});

  @override
  State<MisBonosProveedor> createState() => _MisBonoProveedorState();
}

class _MisBonoProveedorState extends State<MisBonosProveedor> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  /// LLamar el controlador
  MisBonosProveedorController self = Get.find();
  CrearBonoController selfCrearBono = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          color: Colors.blue,
          onPressed: () => Get.dialog(CrearBono(selfCrearBono)),
          splashColor: Colors.blueGrey,
          child: const Text(
            'Crear Bono',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
