import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get welcomeText => 'Despliegue la Fuente de datos de Guatiní en su dispositivo móvil de la forma más fácil posible';

  @override
  String get next => 'Siguiente';

  @override
  String get dataSource => 'Fuente de datos';

  @override
  String get dataSourceInformation => 'Información de la fuente de datos';

  @override
  String get dsVersion => 'Versión';

  @override
  String get dsLanguage => 'Idioma';

  @override
  String get dsTopic => 'Temática';

  @override
  String get deploy => 'Desplegar';

  @override
  String get deployment => 'Despliegue';

  @override
  String get deploying => 'Desplegando fuente de datos';

  @override
  String get dbFile => 'Archivo DB';

  @override
  String get mediaFiles => 'Archivos multimedia';

  @override
  String get mapFiles => 'Archivos de mapa';

  @override
  String get cancel => 'Cancelar';

  @override
  String get cannotOpenSettings => 'No se puede abrir la pantalla de permisos de la apliación.\nNo se puede conceder el permiso solicitado.\nNecesita conceder el permiso manualmente en la pantalla de permisos de la aplicación.';

  @override
  String get processStatus => 'Estado del proceso';

  @override
  String get dsDeployed => 'Fuente de datos desplegada';

  @override
  String get dsDecoding => 'Procesando fuente de datos';

  @override
  String get dsFileCopying => 'Copiando archivos';

  @override
  String get done => 'Listo';

  @override
  String get errorDeplying => 'Error al copiar los archivos.\nPuede ser que por nuevas políticas de Android no se pueda utilizar este directorio. Pruebe seleccionando otro.';

  @override
  String get warning => 'Atención';

  @override
  String get deployConfirmationText => '¿Seguro que desea desplegar la fuente de datos? El proceso no se puede interrumpir por razones de seguridad y consistencia.';

  @override
  String get no => 'No';

  @override
  String get yes => 'Sí';

  @override
  String get selectPath => 'Seleccione una carpeta';

  @override
  String get selectedPath => 'Carpeta seleccionada';

  @override
  String get about => 'Acerca de...';
}
