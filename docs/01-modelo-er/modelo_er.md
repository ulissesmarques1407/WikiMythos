# Modelo entidad-relación — WikiMythos

![Modelo entidad-relación](modelo_er.png)

El archivo editable del diagrama es [`modelo_er.drawio`](modelo_er.drawio).

## 1. Alcance

La base de datos guarda información sobre los personajes y eventos significativos  y sitios y bandos de La Iliada y Odisea.

El primer borrador también incluía la Teogonía de Hesíodo. La eliminamos por tres razones:

- La Teogonía contradice a Homero en varias genealogías. Con ella, las relaciones familiares necesitaban la obra como tercera entidad. Sin ella, las relaciones son binarias.
- La Ilíada y la Odisea tienen la misma estructura: 24 cantos cada una. La Teogonía no tiene cantos.
- El volumen de datos es menor.

La base de datos no guarda todos los personajes ni todos los episodios de las obras. Se guarda una **muestra controlada** de personajes y de eventos.

## 2. Notación

El diagrama usa una variante de la notación de Chen.

Rectángulos reprsentan entidades fuertes, mientrasd que rectángulos de marco doble son entidades débiles (e nuestro modelo sóo hay una).
Rombos son relaciones, rombos doble relaciones de identificación - también sólo hay una en nuestro modelo.
Círculo negro para Primary Key, criculo gris para clave parcial, circulo blanco para atributo de una entidad.
Para las entidades en relaciones reflexivas se ha escrito su rol en cada "sentido" de la relación en cursiva.
Se representan cardinalidades.

## 3. Entidades

### Personaje

Cualquier ente que aparezca en las obras: mortal, dios, creatura.
Atributos y descricpión: 
id_personaje (pk)-> identificador numérico; nombre no nos vale porque hay nombres que se repiten, Áyax por ejemplo;
nombre_griego -> nombre en la forma griega (Odiseo, Atenea);
nombre_latino -> nombre en su forma latina (Ulisses, Minerva);
tipo -> dios, mortal, creatura;
género -> autoexplicativo;
descricpión -> breve descricipción del personaje


### Epíteto (entidad débil)

Un epíteto acompaña siempre a un personaje. No existen por separados. Por eso es una entidad débil. Aquiles de los pies ligeros por ejemplo. Ulises fecundo en ardides. 

Aributos
original(clave parcial) -> epíteto en griego.
en_español -> epíteto traducido


### Obra
Atributos 
 id_obra -> identificador numérico de cada obra
 titulo -> Iliada u Odisea

### Evento

Un evento aquí es definido como algo que transcurre en sitio y momento concretos, por ejemplo "Circe transforma la tripulación en cerdos"; "Aquiles mata a Héctor"; "Ulisses es reconocido por su perro en ítaca". Pasajes de mayor complejidad serían una sucesión de eventos en nuestar definción. 
Atributos 
id_evento -> identificador numérico 
titulo -> nombre corto del evento
canto -> en qué canto ocurre
descripción -> explicación - ahorasí en detalle - de cómo transcurre en evento.
tipo -> combate, viaje, sacrificio, etc.

### Región

Un territorio del mundo de las obras: Troya, Ítaca, Ftía, Micenas, etc.
Atributos:

id_región -> id numérico
nombre -> nombre de la región
bando -> bando en el contexto de la guerra de Troya - aqueos o troyanos o null
pueblo -> nombre del pueblo de la región como los famosos mirmidones de Ftía

## 4. Relaciones

| TIENE (identificativa) | Personaje – Epíteto | Personaje (1,1) – Epíteto (0,n) | 1:N |
| ES_PROGENITOR | Personaje – Personaje | progenitor (0,n) – hijo (0,n) | N:M reflexiva |
| COLABORA | Personaje – Personaje | colaborador (0,n) – beneficiario (0,n) | N:M reflexiva |
| LUCHA | Personaje – Personaje | (0,n) – (0,n) | N:M reflexiva simétrica |
| PARTICIPA | Personaje – Evento | Personaje (1,n) – Evento (0,n) | N:M |
| CONTIENE | Obra – Evento | Obra (1,1) – Evento (1,n) | 1:N |
| OCURRE_EN | Región – Evento | Región (0,1) – Evento (0,n) | 1:N |
| PERTENECE | Región – Personaje | Región (0,1) – Personaje (0,n) | 1:N |
| LIDERA | Personaje – Región | Personaje (0,1) – Región (0,n) | 1:N |

### TIENE (1:N)

Une cada epíteto con su personaje. Es identificativa, porque la clave del epíteto incluye la clave del personaje.

- Un epíteto pertenece a **(1,1)** personaje.
- Un personaje tiene **(0,n)** epítetos.

### ES_PROGENITOR (N:M reflexiva)

Relación reflexiva con dos roles: **progenitor** e **hijo**. Cada instancia de la relación es un solo vínculo entre un progenitor y un hijo.

- Un personaje tiene **(0,n)** progenitores. El mínimo es 0 porque las obras no mencionan los padres de muchos personajes. El caso normal es 2: Aquiles es hijo de Peleo y de Tetis.
- Un personaje tiene **(0,n)** hijos.

No usamos dos atributos "padre" y "madre", porque el número de progenitores conocidos varía de un personaje a otro.

### COLABORA (N:M reflexiva)

Relación reflexiva y **asimétrica** con dos roles: **colaborador** y **beneficiario**. Representa la ayuda de un dios a un mortal: Atenea colabora con Diomedes, pero Diomedes no colabora con Atenea.

- Un personaje colabora con **(0,n)** personajes.
- Un personaje recibe la ayuda de **(0,n)** personajes.

### LUCHA (N:M reflexiva)

Relación reflexiva y **simétrica**: "A lucha con B" es igual a "B lucha con A". Por eso no tiene roles.

- Un personaje lucha con **(0,n)** personajes, en los dos lados.

Limitación: la relación guarda que dos personajes lucharon, no cada combate. Héctor y Áyax luchan dos veces (cantos 7 y 14), pero la relación tiene una sola instancia. El detalle de cada combate está en Evento y PARTICIPA.

### PARTICIPA (N: M)

- Un evento tiene **(1,n)** personajes. Todo evento tiene como mínimo un participante.
- Un personaje participa en **(0,n)** eventos. El mínimo es 0 porque la base de datos solo guarda una muestra de eventos.

### CONTIENE (1: N)

- Un evento pertenece a **(1,1)** obra.
- Una obra contiene **(1,n)** eventos.

Esta relación es necesaria porque las dos obras tienen 24 cantos: el canto solo no identifica un lugar del texto.

### OCURRE_EN (1:N)

- Un evento ocurre en **(0,1)** región. El máximo es 1 por la definición de evento (un solo lugar). El mínimo es 0 para los eventos sin un lugar claro, como una tormenta en el mar.
- En una región ocurren **(0,n)** eventos.

### PERTENECE (1: N)

Indica la región de origen de un personaje: Aquiles pertenece a Ftía.

- Un personaje pertenece a **(0,1)** región. El mínimo es 0 porque los dioses no tienen una región de origen.
- Una región tiene **(0,n)** personajes.

### LIDERA (1: N)

Indica quién gobierna una región: Agamenón lidera Micenas y Príamo lidera Troya.

- Una región tiene **(0,1)** líder. Algunas regiones tienen dos jefes en la *Ilíada*, pero el modelo guarda solo el **líder principal**.
- Un personaje lidera **(0,n)** regiones. Odiseo lidera Ítaca y las islas vecinas.

PERTENECE y LIDERA unen las mismas dos entidades, pero tienen significados diferentes y son independientes. Odiseo pertenece a Ítaca y lidera Ítaca y otras islas.

## 5. Restricciones semánticas

Estas reglas no aparecen en el diagrama. Se aplicarán en la base de datos con restricciones `CHECK`, disparadores o procedimientos.


R1: ES_PROGENITOR: un personaje no es progenitor de sí mismo. Se usará un CHECK.
R2: LUCHA: cada par se guarda una sola vez, con el identificador menor en la primera columna. Así, un personaje tampoco lucha consigo mismo. CHECK (id_a < id_b)
R3: COLABORA: el colaborador es de tipo 'dios' y el beneficiario es de tipo 'mortal'. Trigger.
R4: Evento: el canto está entre 1 y 24. Se usa CHECK
R5: Región: el bando vale 'aqueos', 'troyanos' o nulo. ENUM o CHECK

## 6. Decisiones de diseño

1. **Sin jerarquía de especialización.** Los tipos de personaje (dios, mortal, criatura) son valores del atributo `tipo`. Los tipos no tienen atributos ni relaciones propias suficientes para justificar subtipos. 
2. **Bando y pueblo como atributos de Región.** El bando de un personaje se deduce de su región: PERTENECE → Región → bando. Los nombres argivos y dánaos son sinónimos de aqueos y no se guardan como bandos diferentes.
3. **Información que se deduce y no se guarda.** Las obras en las que aparece un personaje se obtienen con el camino PARTICIPA → Evento → CONTIENE → Obra. Una relación directa entre Personaje y Obra sería redundante.
4. **Nombres en la base de datos.** En el diagrama, algunos nombres tienen tildes o la letra ñ (`id_región`, `en_español`). En SQL, los identificadores se escribirán sin estos caracteres (`id_region`, `en_espanol`).

## 7. Resumen para el modelo relacional

El modelo genera **9 tablas**:

- 5 tablas de entidades: Personaje, Epíteto, Obra, Evento y Región.
- 4 tablas de relaciones N:M: ES_PROGENITOR, COLABORA, LUCHA y PARTICIPA.

Las relaciones 1:N (TIENE, CONTIENE, OCURRE_EN, PERTENECE y LIDERA) no generan tablas propias. Se transforman en claves ajenas.