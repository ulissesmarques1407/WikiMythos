# Modelo relacional

![Modelo relacional](modelo_relacional.png)

El diagrama se puede editar en el archivo `modelo_relacional.drawio`.

La base de datos va a usar MySQL 8.

## Cómo pasamos del modelo E-R a tablas

- Cada entidad se convierte en una tabla: personaje, obra, evento y region.
- Epíteto es una entidad débil, así que su clave es la del personaje más el texto original.
- Las relaciones 1:N no crean tablas nuevas. Se convierten en una clave ajena en la tabla del lado N (por ejemplo, evento tiene id_obra).
- Las relaciones N:M sí crean una tabla nueva: participa, es_progenitor, colabora y lucha.
- En las relaciones reflexivas, las dos columnas apuntan a personaje y tienen el nombre del rol (por ejemplo, id_progenitor e id_hijo).
- El atributo es_semidios no se guarda, se calcula con una consulta.

## Tablas

- obra (id_obra, titulo)
- region (id_region, nombre, bando, pueblo, id_lider)
- personaje (id_personaje, nombre_griego, nombre_latino, tipo, genero, descripcion, id_region)
- epiteto (id_personaje, original, en_espanol)
- evento (id_evento, titulo, canto, descripcion, tipo, id_obra, id_region)
- participa (id_personaje, id_evento)
- es_progenitor (id_progenitor, id_hijo)
- colabora (id_colaborador, id_beneficiario)
- lucha (id_personaje_a, id_personaje_b)

En total son 9 tablas. Las claves primarias y ajenas se ven en el diagrama.

## Normalización

1FN: todos los campos tienen un solo valor. Los epítetos, que podían ser varios por personaje, tienen su propia tabla.

2FN: la única tabla con clave compuesta y otros campos es epiteto, y en_espanol depende de la clave completa. Las tablas de relaciones N:M solo tienen la clave.

3FN: hay un caso dudoso en region, porque el pueblo decide el bando (los mirmidones siempre son aqueos). Si dos regiones tienen el mismo pueblo, el bando se repite. Lo dejamos así porque hay muy pocas regiones y una tabla pueblo complicaría el modelo. El resto de tablas cumple la 3FN.

## Diccionario de datos

Todas las tablas usan utf8mb4, porque hay texto en griego. Los nombres van en minúsculas y sin tildes. Los id son INT UNSIGNED y AUTO_INCREMENT, y las claves ajenas usan el mismo tipo.

### obra

| Campo | Tipo | Notas |
|---|---|---|
| id_obra | INT UNSIGNED | PK |
| titulo | VARCHAR(30) | No se repite |

### region

| Campo | Tipo | Notas |
|---|---|---|
| id_region | INT UNSIGNED | PK |
| nombre | VARCHAR(60) | No se repite |
| bando | ENUM('aqueos', 'troyanos') | Puede ser nulo |
| pueblo | VARCHAR(60) | Puede ser nulo |
| id_lider | INT UNSIGNED | FK a personaje, puede ser nulo |

### personaje

| Campo | Tipo | Notas |
|---|---|---|
| id_personaje | INT UNSIGNED | PK |
| nombre_griego | VARCHAR(60) | Se puede repetir (hay dos Áyax) |
| nombre_latino | VARCHAR(60) | Puede ser nulo |
| tipo | ENUM('dios', 'mortal', 'criatura') | |
| genero | ENUM('masculino', 'femenino') | Puede ser nulo |
| descripcion | TEXT | Puede ser nulo |
| id_region | INT UNSIGNED | FK a region, puede ser nulo |

### epiteto

| Campo | Tipo | Notas |
|---|---|---|
| id_personaje | INT UNSIGNED | PK y FK a personaje. Si se borra el personaje, se borran sus epítetos |
| original | VARCHAR(100) | PK |
| en_espanol | VARCHAR(150) | |

### evento

| Campo | Tipo | Notas |
|---|---|---|
| id_evento | INT UNSIGNED | PK |
| titulo | VARCHAR(100) | |
| canto | TINYINT UNSIGNED | Entre 1 y 24 |
| descripcion | TEXT | Puede ser nulo |
| tipo | ENUM('combate', 'asamblea', 'viaje', 'sacrificio', 'otro') | |
| id_obra | INT UNSIGNED | FK a obra. No se puede borrar una obra que tiene eventos |
| id_region | INT UNSIGNED | FK a region, puede ser nulo |

### participa, es_progenitor, colabora y lucha

Estas cuatro tablas solo tienen dos campos INT UNSIGNED. Los dos juntos forman la clave primaria y los dos son claves ajenas.

## Restricciones

R1: un personaje no puede ser progenitor de sí mismo. Se usará un check.

R2: LUCHA guarda cada par una sola vez, con el id más pequeño primero. Se usará un check.

R3: en COLABORA, el colaborador tiene que ser un dios y el beneficiario un mortal. Se hará con un trigger.

R4: el canto tiene que estar entre 1 y 24. Se usará un check.

R5: el bando solo puede ser aqueos, troyanos o nulo. Se usará un enum.

## Problemas de MySQL que hay que tener en cuenta

MySQL no deja poner un check en una columna que tiene ON DELETE CASCADE. Por eso, en es_progenitor y lucha no se puede usar CASCADE. Para borrar un personaje, primero hay que borrar sus filas en esas tablas. Lo haremos con un procedimiento y una transacción.

Personaje tiene una FK a region y region tiene una FK a personaje. Por eso, al crear las tablas, primero se crea region sin la FK id_lider, después personaje, y al final se añade la FK con un ALTER TABLE.

En LUCHA, el procedimiento de insertar ordenará los dos id antes de guardarlos, para cumplir R2.