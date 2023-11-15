import 'core/core_pattern/configs/app_config.dart';
import 'core/core_pattern/helpers/endpoints.dart';
import 'core/core_pattern/helpers/globals.dart';
import 'core/core_pattern/providers/river_pod/user_riverpod.dart';
import 'core/core_pattern/responsiveness/responsive.dart';
import 'core/core_pattern/routes/routers.dart';
import 'core/core_pattern/utils/colors.dart';
import 'core/core_pattern/utils/helper_functions.dart';
import 'core/core_pattern/utils/package_export.dart';
import 'core/core_pattern/routes/routers.dart' as router;

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

class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    Key? key,
    this.route,
  }) : super(key: key);
  final String? route;

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  String? route;
  @override
  void initState() {
    super.initState();
    setState(() {
      route = widget.route;
    });
    if (globals.userId!.isNotEmpty) {
      final provider = ref.read(userProvider);
      provider.getPostData(context);
      provider.userData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Responsive.isDesktop(context)
            ? ScreenUtil.defaultSize
            : const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp(
            builder: (context, child) {
              return ScrollConfiguration(
                behavior: MyBehavior(),
                child: child!,
              );
            },
            debugShowCheckedModeBanner: true,
            title: 'CN Tickets',
            // theme: appThemeData[AppTheme.white]!,
            onGenerateRoute: router.generateRoute,
            initialRoute: route,
            // home: const OnboardScreen()
          );
        });
  }
}
