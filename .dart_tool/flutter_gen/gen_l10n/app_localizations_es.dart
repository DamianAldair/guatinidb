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
  String get errorDeploying => 'Error al copiar los archivos.\nPuede ser que por nuevas políticas de Android no se pueda utilizar este directorio. Pruebe seleccionando otro.';

  @override
  String get systemErrorResponse => 'Respuesta del sistema:';

  @override
  String get warning => 'Atención';

  @override
  String get deployConfirmationText => '¿Seguro que desea desplegar la fuente de datos? El proceso no se puede interrumpir por razones de seguridad y consistencia.\n\nTenga en cuenta que si ya existía una fuente de datos en esta carpeta se sobreescribirán los archivos con el mismo nombre.';

  @override
  String get no => 'No';

  @override
  String get yes => 'Sí';

  @override
  String get ok => 'Aceptar';

  @override
  String get selectPath => 'Seleccione una carpeta';

  @override
  String get androidPathPolicies => 'Por nuevas políticas de Android no se pueden utilizar directamente las rutas de las unidades de almacenamiento para el despliegue.';

  @override
  String get selectedPath => 'Carpeta seleccionada';

  @override
  String get unselect => 'Quitar\nselección';

  @override
  String get about => 'Acerca de...';

  @override
  String get closeExplorer => 'Cerrar explorador';

  @override
  String get close => 'Cerrar';

  @override
  String get levelUp => 'Carpeta anterior';

  @override
  String get noFolders => 'No hay directorios';

  @override
  String get noFoldersIn => 'No hay directorios en';

  @override
  String get informatonProvider => 'Proveedor de información';

  @override
  String get unavailable => 'No disponible';

  @override
  String get developedBy => 'Desarrollado por';

  @override
  String get and => 'y';

  @override
  String get college => 'Facultad de Ingeniería informática';

  @override
  String get university => 'Universidad Tecnológica de La Habana';
}
