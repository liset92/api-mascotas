# Api Mascotas

## Descripción de las etapas

1- Adiciona la mascota: Se utiliza el JSON cargado para crear una nueva mascota con el nombre Pug_Luna.

2- Verifica la mascota: Se hace una llamada GET para asegurarse de que la mascota ha sido correctamente añadida y que su nombre y estado coinciden con los valores esperados.

3- Modifica el nombre de la mascota: Se clona el objeto de mascota existente y se modifica el nombre a PugCarlino_Luna, luego se envía una solicitud PUT para actualizar la mascota.

4- Verifica la modificación: Se realiza otra llamada GET para confirmar que el nombre de la mascota se ha actualizado correctamente.

5- Elimina la mascota: Se hace una solicitud DELETE para eliminar la mascota y luego se verifica que ya no se puede encontrar mediante una llamada GET, que debe devolver un estado 404.

## Ejecución

```bash
mvn clean test
```