import '../../../main.dart';
import '../helpers/endpoints.dart';
import '../helpers/globals.dart';
import '../routes/routers.dart';
import '../utils/package_export.dart';
import 'app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? route = await initialRoute();
  getIt.registerLazySingleton<AppGlobals>(() => AppGlobals());
  await globals.init();
  AppConfig(
      environment: Environment.PROD,
      color: Colors.deepPurpleAccent,
      name: 'Move Bot',
      values: AppValues(
        baseUrl: Endpoints.baseUrl,
      ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp(route: route)));
}
