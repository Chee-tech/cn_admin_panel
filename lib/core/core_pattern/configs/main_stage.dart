import 'package:cn_admin_panel/core/core_pattern/helpers/endpoints.dart';
import '../../../main.dart';
import '../helpers/globals.dart';
import '../routes/routers.dart';
import '../utils/colors.dart';
import '../utils/package_export.dart';
import 'app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerLazySingleton<AppGlobals>(() => AppGlobals());
  await globals.init();
  await globals.login();
  String? route = await initialRoute();
  AppConfig(
      environment: Environment.STAGE,
      color: AppColors.primary,
      name: 'Move Bot',
      values: AppValues(
        baseUrl: Endpoints.baseUrl,
      ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(ProviderScope(child: MyApp(route: route))));
}
