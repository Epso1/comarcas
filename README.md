# Aplicación de Consola de Comarcas del País Valencià
Esta es una pequeña aplicación de consola para obtener información sobre las provincias y comarcas del País Valencià.
Para obtener la información sobre las provincias y comarcas hace uso del API REST https://node-comarques-rest-server-production.up.railway.app/api/comarques. Concretamente, las rutas:
https://node-comarques-rest-server-production.up.railway.app/api/comarques/$provincia
https://node-comarques-rest-server-production.up.railway.app/api/comarques/infoComarca/$comarca
Siendo $provincia y $comarca la provincia y la comarca sobre la que queremos pedir información.


## Requisitos
Para ejecutar la aplicación, necesitas tener instalado [Dart](https://dart.dev/get-dart) en tu equipo.


## Instalación
Para instalar la aplicación, descarga el repositorio y ábrelo en tu IDE favorito.
Es posible que necesites habilitar el soporte para Dart en tu IDE, para ello tendrás que indicar la 
ubicación del Dart SDK que, suele estar en la carpeta: /home/"usuario"/snap/flutter/common/flutter/bin/cache/dart-sdk. Para más información, consulta la [documentación de Dart](https://dart.dev/tools).
También es posible que necesites ejecutar el comando `pub get` para instalar las dependencias del proyecto. 

## Funcionalidades

La aplicación ofrece dos funcionalidades desde la línea de órdenes:

1. Obtener un listado de comarcas para una provincia indicada.
2. Obtener la información sobre una comarca concreta.

### Uso
Para ejecutar la aplicación, debes ubicarte en el directorio raíz del proyecto y ejecutar: $ dart run comarcas seguido de los argumentos.
La aplicación recibe varios argumentos por la línea de órdenes. El primero actúa como suborden que indica el tipo de consulta a realizar (`comarques` o `infocomarca`), y el resto son los argumentos que necesita ('nombre de la provincia' o 'nombre de la comarca).

#### Ejemplos

Para obtener las comarcas de Castelló, ejecuta:
$ dart run comarcas comarques Castelló

Para obtener información sobre la comarca de “La Ribera Baixa”, ejecuta:
$ dart run comarcas infocomarca La Ribera Baixa

En su ejecución desde Windows, la aplicación admite apóstrofos, así que no debes escapar a estos. Por ejemplo:
$ dart run comarcas infocomarca L'alcoià

En cambio, en Linux, debes escapar a los apóstrofos. Por ejemplo:
$ dart run comarcas infocomarca L\'alcoià

##### Nota

Para el correcto funcionamiento de la aplicación, es necesario que los argumentos de las comarcas y 
las provincias coincidan con los de la API.
Como algunos nombres de comarcas no están correctamente escritos en la API, como "l'alcoià" que 
deberia llevar la primera "a" en mayúscula, se han incluido dos métodos para listar y poder consultar
el nombre de las provincias y las comarcas disponibles en la API.

Para mostrar el listado de provincias, ejecuta:
$ dart run comarcas totesprovincies

Para mostrar el listado de comarcas, ejecuta:
$ dart run comarcas totescomarques

Cuando se introduzca el nombre de una provincia o comarca, se comprobará si existe en la API y si no existe, se mostrará un mensaje de error y
se informará de qué comando hay que ejecutar para mostrar un listado de provincias o comarcas disponibles.




