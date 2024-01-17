# Aplicación de Consola de Comarcas del País Valencià
Esta es una pequeña aplicación de consola para obtener información sobre las provincias y comarcas del País Valencià.
Para obtener la información sobre las provincias y comarcas hace uso del API REST https://node-comarques-rest-server-production.up.railway.app/api/comarques. Concretamente, las rutas:
https://node-comarques-rest-server-production.up.railway.app/api/comarques/$provincia
https://node-comarques-rest-server-production.up.railway.app/api/comarques/infoComarca/$comarca
Siendo $provincia y $comarca la provincia y la comarca sobre la que queremos pedir información.


## Requisitos
Para ejecutar la aplicación, necesitas tener instalado [Dart](https://dart.dev/get-dart) en tu equipo.

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

En su ejecución desde Windows, la aplicación admite admite apóstrofos, así que no debes escapar a estos. Por ejemplo:

$ dart run comarcas infocomarca L'alcoià