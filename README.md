# Guatiní DB - Fuente de datos

Aplicación auxiliar para desplegar la fuente de datos utilizada por la app "Guatiní para su funcionamiento".

## Para usuarios

Instalar la app y una vez desplegada la fuente de datos ya puede desinstalarse. La fuente de datos se mantendrá en el almacenamiento de su dispositivo.

## Para desarrolladores de Herramientas de Autor

- Para cambiar el nombre de la aplicación:
  
  1. Dirigirse al archivo `android/app/src/main/AndroidManifest.xml`.
  
  2. Sustituir
     
     ```xml
     <application android:label="Guatiní - Fuente de datos"
     ```
     
      por
     
     ```xml
     <application android:label="(name)"
     ```
     
      y en `(name)` escriba el nombre que desea darle a la app.

- Para cambiar la versión y número de compilación de la app:
  
  1. Dirigirse al archivo `pubspec.yaml`.
  
  2. Sustituir
     
     ```yml
     version: 1.0.0+1
     ```
     
      por
     
     ```yml
     version: (ver)+(build)
     ```
     
     y en `(ver)` escriba la versión nueva siguiendo las reglas del versionamiento semántico y el `build` el número de compilación.

- Para establecer la fuente de datos a desplegar:
  
  - Toda la información debe estar comprimida en un archivo `zip` con nombre `db`, o sea, `db.zip`. Se aconseja que toda la información se organice un una única carpeta y después comprimir esta.
  
  - El archivo `db.zip` se ubicará en `assets/db/`.
  
  - El archivo `assets/db/language` es un archivo de texto plano en el que se debe declarar el lenguaje de la Fuente de datos.
    
    Sustituya
    
    ```
    Español
    es
    ```
    
    por
    
    ```
    (Lenguaje)
    (código de lengueje)
    ```
    
    Por ejemplo:
    
    ```
    English
    en
    ```
  
  - El archivo `assets/db/topic` es un archivo de texto plano en el que se debe declarar la temática de la Fuente de datos.
    
    Sustituya
    
    ```
    Prueba
    ```
    
    por
    
    ```
    (Temática)
    ```
    
    Por ejemplo:
    
    ```
    Aves de Cuba
    ```
    
    o
    
    ```
    Murciélagos de Cuba
    ```
  
  - El archivo `assets/db/provider` es un archivo de texto plano en el que se debe declarar el proveedor de la Fuente de datos.
    
    Sustituya
    
    ```
    CUJAE
    ```
    
    por
    
    ```
    (Proveedor)
    ```
    
    Por ejemplo:
    
    ```
    Museo de Ciencias Naturales
    ```
  
  - El archivo `assets/db/provider.png` es la imagen que representa al proveedor de la Fuente de datos. Este archivo no es obligatorio. Se aceptan imágenes en formato `PNG` (recomendado) y `JPG`.
