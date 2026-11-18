-- =====================================================
-- WikiMythos - Datos de prueba
-- =====================================================

SET NAMES utf8mb4;
USE wikimythos;

-- Toda la carga es una sola transacción
START TRANSACTION;

-- OBRA
INSERT INTO obra (id_obra, titulo) VALUES
    (1, 'Ilíada'),
    (2, 'Odisea');

-- REGION (primero sin líder, porque los personajes todavía no existen)
INSERT INTO region (id_region, nombre, bando, pueblo) VALUES
    (1, 'Troya', 'troyanos', 'troyanos'),
    (2, 'Micenas', 'aqueos', NULL),
    (3, 'Esparta', 'aqueos', 'lacedemonios'),
    (4, 'Ftía', 'aqueos', 'mirmidones'),
    (5, 'Ítaca', 'aqueos', 'cefalenios'),
    (6, 'Pilos', 'aqueos', 'pilios'),
    (7, 'Argos', 'aqueos', NULL),
    (8, 'Salamina', 'aqueos', NULL),
    (9, 'Lócride', 'aqueos', 'locrios'),
    (10, 'Licia', 'troyanos', 'licios'),
    (11, 'Dardania', 'troyanos', 'dardanios'),
    (12, 'Esqueria', NULL, 'feacios'),
    (13, 'Tierra de los cíclopes', NULL, 'cíclopes'),
    (14, 'Eea', NULL, NULL),
    (15, 'Ogigia', NULL, NULL),
    (16, 'Trinacria', NULL, NULL),
    (17, 'Olimpo', NULL, NULL),
    (18, 'Inframundo', NULL, NULL),
    (19, 'Eolia', NULL, NULL),
    (20, 'Telépilo', NULL, 'lestrigones'),
    (21, 'País de los lotófagos', NULL, 'lotófagos'),
    (22, 'Faro', NULL, NULL),
    (23, 'Tracia', 'troyanos', 'tracios'),
    (24, 'Zelea', 'troyanos', NULL),
    (25, 'Ismaro', 'troyanos', 'cicones');

-- PERSONAJE: dioses mortales y creaturas
INSERT INTO personaje (id_personaje, nombre_griego, nombre_latino, tipo, genero, id_region, descripcion) VALUES
    (1, 'Zeus', 'Júpiter', 'dios', 'masculino', NULL, 'Rey de los dioses y señor del rayo.'),
    (2, 'Hera', 'Juno', 'dios', 'femenino', NULL, 'Esposa de Zeus y reina de los dioses. Apoya a los aqueos.'),
    (3, 'Atenea', 'Minerva', 'dios', 'femenino', NULL, 'Diosa de la sabiduría y de la guerra. Protectora de Odiseo.'),
    (4, 'Apolo', 'Apolo', 'dios', 'masculino', NULL, 'Dios arquero. Envía la peste al campamento aqueo y apoya a los troyanos.'),
    (5, 'Afrodita', 'Venus', 'dios', 'femenino', NULL, 'Diosa del amor. Madre de Eneas y protectora de Paris.'),
    (6, 'Ares', 'Marte', 'dios', 'masculino', NULL, 'Dios de la guerra. Lucha a favor de los troyanos.'),
    (7, 'Poseidón', 'Neptuno', 'dios', 'masculino', NULL, 'Dios del mar. Persigue a Odiseo por la ceguera de Polifemo.'),
    (8, 'Hermes', 'Mercurio', 'dios', 'masculino', NULL, 'Mensajero de los dioses y guía de los viajeros.'),
    (9, 'Hefesto', 'Vulcano', 'dios', 'masculino', NULL, 'Dios herrero. Forja las armas de Aquiles.'),
    (10, 'Tetis', 'Tetis', 'dios', 'femenino', NULL, 'Diosa del mar, madre de Aquiles.'),
    (11, 'Crono', 'Saturno', 'dios', 'masculino', NULL, 'Padre de Zeus, Hera y Poseidón.'),
    (12, 'Rea', 'Ops', 'dios', 'femenino', NULL, 'Madre de Zeus, Hera y Poseidón.'),
    (13, 'Dione', 'Dione', 'dios', 'femenino', NULL, 'Diosa, madre de Afrodita según la Ilíada.'),
    (14, 'Leto', 'Latona', 'dios', 'femenino', NULL, 'Diosa, madre de Apolo.'),
    (15, 'Calipso', 'Calipso', 'dios', 'femenino', NULL, 'Ninfa que retiene a Odiseo siete años en su isla.'),
    (16, 'Circe', 'Circe', 'dios', 'femenino', NULL, 'Hechicera, hija de Helios. Convierte en cerdos a los compañeros de Odiseo.'),
    (17, 'Helios', 'Sol', 'dios', 'masculino', NULL, 'Dios del sol. Sus vacas viven en la isla de Trinacria.'),
    (18, 'Aquiles', 'Aquiles', 'mortal', 'masculino', 4, 'El mejor guerrero de los aqueos. Hijo de Peleo y de Tetis.'),
    (19, 'Peleo', 'Peleo', 'mortal', 'masculino', 4, 'Rey de Ftía, padre de Aquiles.'),
    (20, 'Patroclo', 'Patroclo', 'mortal', 'masculino', 4, 'Compañero de Aquiles. Muere a manos de Héctor.'),
    (21, 'Agamenón', 'Agamenón', 'mortal', 'masculino', 2, 'Rey de Micenas y jefe del ejército aqueo.'),
    (22, 'Menelao', 'Menelao', 'mortal', 'masculino', 3, 'Rey de Esparta, esposo de Helena.'),
    (23, 'Atreo', 'Atreo', 'mortal', 'masculino', 2, 'Padre de Agamenón y de Menelao.'),
    (24, 'Helena', 'Helena', 'mortal', 'femenino', 3, 'Hija de Zeus. Su marcha a Troya con Paris causa la guerra.'),
    (25, 'Odiseo', 'Ulises', 'mortal', 'masculino', 5, 'Rey de Ítaca. Protagonista de la Odisea.'),
    (26, 'Penélope', 'Penélope', 'mortal', 'femenino', 5, 'Esposa de Odiseo. Espera su regreso durante veinte años.'),
    (27, 'Telémaco', 'Telémaco', 'mortal', 'masculino', 5, 'Hijo de Odiseo y de Penélope.'),
    (28, 'Laertes', 'Laertes', 'mortal', 'masculino', 5, 'Padre de Odiseo.'),
    (29, 'Euriclea', 'Euriclea', 'mortal', 'femenino', 5, 'Nodriza de Odiseo. Lo reconoce por una cicatriz.'),
    (30, 'Eumeo', 'Eumeo', 'mortal', 'masculino', 5, 'Porquero fiel a Odiseo.'),
    (31, 'Antínoo', 'Antínoo', 'mortal', 'masculino', 5, 'El más violento de los pretendientes de Penélope.'),
    (32, 'Néstor', 'Néstor', 'mortal', 'masculino', 6, 'Rey de Pilos, el más anciano y sabio de los aqueos.'),
    (33, 'Diomedes', 'Diomedes', 'mortal', 'masculino', 7, 'Guerrero aqueo. Hiere a Afrodita y a Ares.'),
    (34, 'Áyax', 'Ayax', 'mortal', 'masculino', 8, 'Áyax hijo de Telamón, de Salamina. El guerrero aqueo más fuerte después de Aquiles.'),
    (35, 'Áyax', 'Ayax', 'mortal', 'masculino', 9, 'Áyax hijo de Oileo, jefe de los locrios. No es el mismo personaje que Áyax de Salamina.'),
    (36, 'Calcante', 'Calcas', 'mortal', 'masculino', NULL, 'Adivino del ejército aqueo.'),
    (37, 'Príamo', 'Príamo', 'mortal', 'masculino', 1, 'Rey de Troya.'),
    (38, 'Hécuba', 'Hécuba', 'mortal', 'femenino', 1, 'Reina de Troya, esposa de Príamo.'),
    (39, 'Héctor', 'Héctor', 'mortal', 'masculino', 1, 'Hijo de Príamo y principal defensor de Troya.'),
    (40, 'Andrómaca', 'Andrómaca', 'mortal', 'femenino', 1, 'Esposa de Héctor.'),
    (41, 'Paris', 'Paris', 'mortal', 'masculino', 1, 'Hijo de Príamo. Lleva a Helena a Troya.'),
    (42, 'Eneas', 'Eneas', 'mortal', 'masculino', 11, 'Jefe de los dardanios, hijo de Anquises y de Afrodita.'),
    (43, 'Anquises', 'Anquises', 'mortal', 'masculino', 11, 'Padre de Eneas.'),
    (44, 'Sarpedón', 'Sarpedón', 'mortal', 'masculino', 10, 'Rey de los licios, hijo de Zeus. Muere a manos de Patroclo.'),
    (45, 'Glauco', 'Glauco', 'mortal', 'masculino', 10, 'Guerrero licio, compañero de Sarpedón.'),
    (46, 'Crises', 'Crises', 'mortal', 'masculino', NULL, 'Sacerdote de Apolo, padre de Criseida.'),
    (47, 'Criseida', 'Criseida', 'mortal', 'femenino', NULL, 'Hija de Crises, cautiva de Agamenón.'),
    (48, 'Alcínoo', 'Alcínoo', 'mortal', 'masculino', 12, 'Rey de los feacios.'),
    (49, 'Areté', 'Arete', 'mortal', 'femenino', 12, 'Reina de los feacios, esposa de Alcínoo.'),
    (50, 'Nausícaa', 'Nausícaa', 'mortal', 'femenino', 12, 'Hija de Alcínoo. Ayuda a Odiseo después del naufragio.'),
    (51, 'Demódoco', 'Demódoco', 'mortal', 'masculino', 12, 'Aedo ciego de los feacios.'),
    (52, 'Tiresias', 'Tiresias', 'mortal', 'masculino', NULL, 'Adivino ciego. Su sombra aconseja a Odiseo en el inframundo.'),
    (53, 'Elpénor', 'Elpénor', 'mortal', 'masculino', 5, 'Compañero de Odiseo. Muere en la isla de Circe.'),
    (54, 'Polifemo', 'Polifemo', 'criatura', 'masculino', 13, 'Cíclope hijo de Poseidón. Odiseo lo ciega.'),
    (55, 'Escila', 'Escila', 'criatura', 'femenino', NULL, 'Monstruo de seis cabezas del estrecho.'),
    (56, 'Caribdis', 'Caribdis', 'criatura', 'femenino', NULL, 'Remolino monstruoso frente a Escila.'),
    (57, 'Argos', 'Argos', 'criatura', 'masculino', 5, 'Perro de Odiseo. Lo reconoce después de veinte años.'),
    (58, 'Hipnos', 'Somnus', 'dios', 'masculino', NULL, 'Dios del sueño. Ayuda a Hera a dormir a Zeus.'),
    (59, 'Escamandro', NULL, 'dios', 'masculino', NULL, 'Dios del río de Troya, hijo de Zeus. Lucha contra Aquiles.'),
    (60, 'Proteo', 'Proteo', 'dios', 'masculino', NULL, 'Anciano del mar que cambia de forma. Menelao lo captura en Faro.'),
    (61, 'Ino', NULL, 'dios', 'femenino', NULL, 'Diosa del mar, también llamada Leucótea. Da su velo a Odiseo en la tormenta.'),
    (62, 'Tersites', NULL, 'mortal', 'masculino', NULL, 'El aqueo más feo. Insulta a Agamenón en la asamblea y Odiseo lo golpea.'),
    (63, 'Pándaro', NULL, 'mortal', 'masculino', 24, 'Arquero aliado de Troya. Rompe la tregua al herir a Menelao.'),
    (64, 'Dolón', NULL, 'mortal', 'masculino', 1, 'Espía troyano capturado por Diomedes y Odiseo.'),
    (65, 'Reso', NULL, 'mortal', 'masculino', 23, 'Rey de los tracios, aliado de Troya. Muere mientras duerme.'),
    (66, 'Fénix', NULL, 'mortal', 'masculino', 4, 'Anciano maestro de Aquiles. Forma parte de la embajada.'),
    (67, 'Briseida', NULL, 'mortal', 'femenino', NULL, 'Cautiva de Aquiles. Agamenón se la quita y causa la cólera de Aquiles.'),
    (68, 'Antíloco', NULL, 'mortal', 'masculino', 6, 'Hijo de Néstor. Anuncia a Aquiles la muerte de Patroclo.'),
    (69, 'Astianacte', NULL, 'mortal', 'masculino', 1, 'Hijo pequeño de Héctor y de Andrómaca.'),
    (70, 'Euforbo', NULL, 'mortal', 'masculino', 1, 'Troyano que hiere a Patroclo antes que Héctor. Menelao lo mata.'),
    (71, 'Anticlea', NULL, 'mortal', 'femenino', 5, 'Madre de Odiseo. Su sombra habla con él en el inframundo.'),
    (72, 'Autólico', NULL, 'mortal', 'masculino', NULL, 'Abuelo materno de Odiseo. Le da su nombre.'),
    (73, 'Egisto', NULL, 'mortal', 'masculino', 2, 'Amante de Clitemnestra. Mata a Agamenón a su regreso de Troya.'),
    (74, 'Clitemnestra', NULL, 'mortal', 'femenino', 2, 'Esposa de Agamenón. Participa en su asesinato.'),
    (75, 'Orestes', NULL, 'mortal', 'masculino', 2, 'Hijo de Agamenón. Venga a su padre y es un modelo para Telémaco.'),
    (76, 'Pisístrato', NULL, 'mortal', 'masculino', 6, 'Hijo de Néstor. Acompaña a Telémaco a Esparta.'),
    (77, 'Eurímaco', NULL, 'mortal', 'masculino', 5, 'Pretendiente de Penélope, el más hipócrita.'),
    (78, 'Melantio', NULL, 'mortal', 'masculino', 5, 'Cabrero traidor que ayuda a los pretendientes.'),
    (79, 'Femio', NULL, 'mortal', 'masculino', 5, 'Aedo de Ítaca. Odiseo le perdona la vida.'),
    (80, 'Teoclímeno', NULL, 'mortal', 'masculino', NULL, 'Adivino que anuncia la muerte de los pretendientes.'),
    (81, 'Iro', NULL, 'mortal', 'masculino', 5, 'Mendigo de Ítaca que pelea con Odiseo.'),
    (82, 'Eolo', NULL, 'mortal', 'masculino', 19, 'Señor de los vientos. Da a Odiseo un odre con los vientos.'),
    (83, 'Mentor', 'Mentor', 'mortal', 'masculino', 5, 'Amigo de Odiseo. Atenea toma su forma varias veces.'),
    (84, 'Janto', NULL, 'criatura', 'masculino', 4, 'Caballo inmortal de Aquiles. Le anuncia su muerte.'),
    (85, 'Antífates', NULL, 'criatura', 'masculino', 20, 'Rey de los lestrigones, gigantes que comen hombres.'),
    (86, 'Sirenas', NULL, 'criatura', 'femenino', NULL, 'Personaje colectivo. Su canto atrae a los marineros a la muerte.');

-- LIDERA
UPDATE region SET id_lider = 37 WHERE id_region = 1;  -- Troya: Príamo
UPDATE region SET id_lider = 21 WHERE id_region = 2;  -- Micenas: Agamenón
UPDATE region SET id_lider = 22 WHERE id_region = 3;  -- Esparta: Menelao
UPDATE region SET id_lider = 18 WHERE id_region = 4;  -- Ftía: Aquiles
UPDATE region SET id_lider = 25 WHERE id_region = 5;  -- Ítaca: Odiseo
UPDATE region SET id_lider = 32 WHERE id_region = 6;  -- Pilos: Néstor
UPDATE region SET id_lider = 33 WHERE id_region = 7;  -- Argos: Diomedes
UPDATE region SET id_lider = 34 WHERE id_region = 8;  -- Salamina: Áyax de Salamina
UPDATE region SET id_lider = 35 WHERE id_region = 9;  -- Lócride: Áyax de Lócride
UPDATE region SET id_lider = 44 WHERE id_region = 10;  -- Licia: Sarpedón
UPDATE region SET id_lider = 42 WHERE id_region = 11;  -- Dardania: Eneas
UPDATE region SET id_lider = 48 WHERE id_region = 12;  -- Esqueria: Alcínoo
UPDATE region SET id_lider = 82 WHERE id_region = 19;  -- Eolia: Eolo
UPDATE region SET id_lider = 85 WHERE id_region = 20;  -- Telépilo: Antífates
UPDATE region SET id_lider = 65 WHERE id_region = 23;  -- Tracia: Reso
UPDATE region SET id_lider = 63 WHERE id_region = 24;  -- Zelea: Pándaro

-- EPITETO
INSERT INTO epiteto (id_personaje, original, en_espanol) VALUES
    (18, 'πόδας ὠκύς', 'de pies ligeros'),
    (3, 'γλαυκῶπις', 'de ojos glaucos'),
    (3, 'Παλλάς', 'Palas'),
    (2, 'λευκώλενος', 'de blancos brazos'),
    (2, 'βοῶπις', 'de ojos de novilla'),
    (25, 'πολύτροπος', 'de muchos recursos'),
    (25, 'πολύμητις', 'de mucho ingenio'),
    (39, 'κορυθαίολος', 'de tremolante casco'),
    (1, 'νεφεληγερέτα', 'que amontona las nubes'),
    (21, 'ἄναξ ἀνδρῶν', 'soberano de hombres'),
    (4, 'ἑκηβόλος', 'que hiere de lejos'),
    (7, 'ἐννοσίγαιος', 'que sacude la tierra'),
    (22, 'ξανθός', 'rubio'),
    (33, 'βοὴν ἀγαθός', 'de potente grito de guerra'),
    (26, 'περίφρων', 'prudente'),
    (5, 'φιλομμειδής', 'amante de la sonrisa'),
    (8, 'ἀργεϊφόντης', 'matador de Argos'),
    (32, 'Γερήνιος ἱππότα', 'jinete gerenio'),
    (27, 'πεπνυμένος', 'sensato'),
    (39, 'ἀνδροφόνος', 'matador de hombres'),
    (25, 'πολύτλας', 'sufridor'),
    (6, 'βροτολοιγός', 'azote de los mortales'),
    (4, 'Φοῖβος', 'Febo');

-- EVENTO
INSERT INTO evento (id_evento, titulo, canto, tipo, id_obra, id_region, descripcion) VALUES
    (1, 'La súplica de Crises', 1, 'suplica', 1, 1, 'Poned en libertad a mi hija y recibid el rescate, venerando al hijo de Zeus, al flechador Apolo. (Il. I, 17–21)'),
    (2, 'Disputa entre Aquiles y Agamenón', 1, 'asamblea', 1, 1, '¡Borracho, que tienes cara de perro y corazón de ciervo! (Il. I, 225)'),
    (3, 'Atenea detiene a Aquiles', 1, 'intervencion_divina', 1, 1, 'Púsose detrás del Pelida y le tiró de la blonda cabellera, apareciéndose a él tan solo […] (Il. I, 197–198)'),
    (4, 'Tetis ruega a Zeus', 1, 'suplica', 1, 17, '[…] abrazó sus rodillas con la mano izquierda, tocole la barba con la diestra […] (Il. I, 500–501)'),
    (5, 'Duelo entre Paris y Menelao', 3, 'duelo', 1, 1, 'Afrodita salva a Paris cuando Menelao está a punto de vencer.'),
    (6, 'Diomedes hiere a Afrodita', 5, 'combate', 1, 1, '[…] el hijo del magnánimo Tideo, calando la afilada pica, rasguñó la tierna mano de la diosa […] (Il. V, 336–337)'),
    (7, 'Despedida de Héctor y Andrómaca', 6, 'otro', 1, 1, '[…] dábanle miedo el bronce y el terrible penacho de crines de caballo, que veía ondear en lo alto del yelmo. […] Héctor se apresuró a dejar el refulgente casco en el suelo, besó y meció en sus manos al hijo amado […] (Il. VI, 469–474)'),
    (8, 'Glauco y Diomedes', 6, 'reconocimiento', 1, 1, '[…] permutó sus armas por las de Diomedes Tidida, las de oro por las de bronce […] (Il. VI, 235–236)'),
    (9, 'Duelo entre Héctor y Áyax', 7, 'duelo', 1, 1, 'Pero la noche comienza ya, y será bueno obedecerla. (Il. VII, 282)'),
    (10, 'Embajada a Aquiles', 9, 'suplica', 1, 1, '[…] hallaron al héroe deleitándose con una hermosa lira labrada, de argénteo puente […] Creo que ni el Atrida Agamemnón ni los dánaos lograrán convencerme […] (Il. IX, 186–315)'),
    (11, 'Hera engaña a Zeus', 14, 'engano', 1, NULL, 'Toma y esconde en tu seno el bordado ceñidor donde todo se halla. […] Tan tranquilamente dormía el padre sobre el alto Gárgaro, vencido por el sueño y el amor y abrazado con su esposa. (Il. XIV, 219–353)'),
    (12, 'Muerte de Sarpedón', 16, 'combate', 1, 1, '[…] hizo caer sobre la tierra sanguinolentas gotas para honrar al hijo amado […] Patroclo, sujetándole el pecho con el pie, le arrancó el asta; con ella siguió el corazón […] (Il. XVI, 459–504)'),
    (13, 'Muerte de Patroclo', 16, 'combate', 1, 1, '[…] le dio un golpe en la espalda y en los anchos hombros […] clavole aguda lanza en la espalda entre los hombros el dárdano Euforbo Pantoida […] le envasó la lanza en la parte inferior del vientre […] (Il. XVI, 791–821)'),
    (14, 'Hefesto forja las armas de Aquiles', 18, 'otro', 1, 17, 'Hizo lo primero de todo un escudo grande y fuerte, de variada labor […] (Il. XVIII, 478)'),
    (15, 'Aquiles lucha en el río', 21, 'combate', 1, 1, 'Mi hermosa corriente está llena de cadáveres que obstruyen el cauce […] Hefesto dirigió al río la resplandeciente llama […] (Il. XXI, 218–349)'),
    (16, 'Muerte de Héctor', 22, 'duelo', 1, 1, '[…] tomando la figura y la voz infatigable de Deífobo […] la punta, atravesando el delicado cuello, asomó por la nuca […] (Il. XXII, 227–327)'),
    (17, 'Funeral y juegos de Patroclo', 23, 'funeral', 1, 1, 'Empezó por exponer los premios destinados a los veloces aurigas […] (Il. XXIII, 262)'),
    (18, 'Príamo ruega a Aquiles', 24, 'suplica', 1, 1, '[…] abrazole las rodillas y besó aquellas manos terribles, homicidas, que habían dado muerte a tantos hijos suyos […] (Il. XXIV, 478–479)'),
    (19, 'Consejo de los dioses', 1, 'asamblea', 2, 17, 'Pero se me parte el corazón a causa del prudente y desgraciado Odiseo […] (Od. I, 48)'),
    (20, 'Asamblea de Ítaca', 2, 'asamblea', 2, 5, 'Si os indigna el ánimo de lo que ocurre, salid del palacio […] (Od. II, 138–139)'),
    (21, 'Telémaco visita a Néstor', 3, 'viaje', 2, 6, '[…] inmolaban toros de negro pelaje al que sacude la tierra, al dios de cerúlea cabellera. (Od. III, 6)'),
    (22, 'Telémaco visita a Menelao', 4, 'viaje', 2, 3, 'Tomad manjares, regocijaos; y después que hayáis comido os preguntaremos cuáles sois de los hombres. (Od. IV, 60–62)'),
    (23, 'Odiseo deja a Calipso', 5, 'viaje', 2, 15, '[…] de muy buen grado dejaré que partas […] (Od. V, 161)'),
    (24, 'La tormenta de Poseidón', 5, 'naufragio', 2, NULL, '[…] echando mano al tridente, congregó las nube[s], y turbó el mar […] Toma, extiende este velo inmortal debajo de tu pecho […] (Od. V, 291–347)'),
    (25, 'Odiseo y Nausícaa', 6, 'suplica', 2, 12, '¡Yo te imploro, oh reina, seas diosa o mortal! […] (Od. VI, 149)'),
    (26, 'Banquete de los feacios', 8, 'banquete', 2, 12, '[…] Odiseo tomó con sus robustas manos el gran manto de color de púrpura y se lo echó por encima de la cabeza […] (Od. VIII, 84–85)'),
    (27, 'Odiseo ciega a Polifemo', 9, 'engano', 2, 13, 'Mi nombre es Nadie; y Nadie me llaman mi madre, mi padre y mis compañeros todos. […] hincáronla por la aguzada punta en el ojo del Ciclope […] (Od. IX, 366–383)'),
    (28, 'Circe y los compañeros de Odiseo', 10, 'intervencion_divina', 2, 14, 'Dioselo, bebieron, y, de contado, los tocó con una varita y los encerró en pocilgas. […] Tenía negra la raíz y era blanca como la leche su flor, llamándola moly los dioses […] (Od. X, 237–305)'),
    (29, 'La profecía de Tiresias', 11, 'profecia', 2, 18, '¡Laertíada, del linaje de Zeus! ¡Odiseo, fecundo en ardides! ¿Por qué, oh infeliz, has dejado la luz del sol […] halléis paciendo las vacas y pingües ovejas de Helios, que todo lo ve y todo lo oye. (Od. XI, 92–109)'),
    (30, 'Las sirenas', 12, 'viaje', 2, NULL, '[…] moví las cejas, mandando a los compañeros que me desatasen; pero todos se inclinaron y se pusieron a remar. (Od. XII, 193–194)'),
    (31, 'Las vacas de Helios', 12, 'sacrificio', 2, 16, '[…] habiendo echado mano a las más excelentes vacas de Helios, que estaban allí cerca […] Castigad a los compañeros de Odiseo Laertíada, pues, ensoberbeciéndose, han matado mis vacas […] (Od. XII, 353–379)'),
    (32, 'Odiseo llega a Ítaca disfrazado', 13, 'engano', 2, 5, 'Dicho esto tocole Atenea con una varita. […] (Od. XIII, 429)'),
    (33, 'El perro Argos', 17, 'reconocimiento', 2, 5, 'Al advertir que Odiseo se aproximaba, le halagó con la cola y dejó caer ambas orejas, mas ya no pudo salir al encuentro de su amo. […] Entonces la Moira de la negra muerte se apoderó de Argos después que tornara a ver a Odiseo al vigésimo año. (Od. XVII, 301–327)'),
    (34, 'La cicatriz de Odiseo', 19, 'reconocimiento', 2, 5, 'Al tocar la vieja con la palma de la mano esta cicatriz, reconociola y soltó el pie de Odiseo […] (Od. XIX, 467–468)'),
    (35, 'El certamen del arco', 21, 'otro', 2, 5, '[…] sin esfuerzo alguno, armó Odiseo el grande arco […] la flecha, que el bronce hacía ponderosa, las atravesó a todas y salió afuera […] (Od. XXI, 409–423)'),
    (36, 'Matanza de los pretendientes', 22, 'combate', 2, 5, 'Pues Odiseo, acertándole en la garganta, hiriole con la flecha […] Pero librose de la negra Moira el aedo Femio Terpíada […] (Od. XXII, 15–331)'),
    (37, 'Penélope reconoce a Odiseo', 23, 'reconocimiento', 2, 5, 'Creció dentro del patio un olivo de alargadas hojas, robusto y floreciente […] Penelopea sintió desfallecer sus rodillas y su corazón, al reconocer las señales […] (Od. XXIII, 190–206)'),
    (38, 'Diomedes mata a Pándaro', 5, 'combate', 1, 1, 'Pándaro cayó del carro, sus lucientes y labradas armas resonaron […] (Il. V, 294–295)'),
    (39, 'Tersites en la asamblea', 2, 'asamblea', 1, 1, '[…] con el cetro diole un golpe en la espalda y los hombros […] mientras una gruesa lágrima caía de sus ojos […] (Il. II, 265–266)'),
    (40, 'El catálogo de las naves', 2, 'otro', 1, 1, 'Lista de los contingentes aqueos y de sus jefes. Solo se registran los jefes principales.'),
    (41, 'Helena en la muralla', 3, 'reconocimiento', 1, 1, 'Ven acá, hija querida; siéntate a mi lado para que veas a tu anterior marido […] (Il. III, 162–163)'),
    (42, 'Pándaro rompe la tregua', 4, 'engano', 1, 1, 'Destapó el carcaj y sacó una flecha nueva, alada, causadora de acerbos dolores […] (Il. IV, 116–117)'),
    (43, 'La incursión nocturna', 10, 'combate', 1, 1, '[…] de un tajo en el cuello, le rompió ambos tendones […] hasta que mató a doce. […] el paciente Odiseo desató los solípedos caballos […] (Il. X, 455–498)'),
    (44, 'El discurso de Sarpedón', 12, 'otro', 1, 1, 'Preciso es que ahora nos sostengamos entre los más avanzados y nos lancemos a la ardiente pelea […] (Il. XII, 315–316)'),
    (45, 'Lucha por el cuerpo de Patroclo', 17, 'combate', 1, 1, 'Menelao Atrida dio muerte a Euforbo, hijo de Panto y hábil lancero […] Ayante cubrió con su gran escudo al hijo de Menetio y se mantuvo firme. (Il. XVII, 45–133)'),
    (46, 'Aquiles recibe la noticia', 18, 'otro', 1, 1, 'El héroe cogió ceniza con ambas manos y derramándola sobre su cabeza […] (Il. XVIII, 23–24)'),
    (47, 'Reconciliación de Aquiles y Agamenón', 19, 'asamblea', 1, 1, 'Desde ahora depongo la cólera, que no sería razonable estar siempre irritado. […] ¡Oh Patroclo, amigo carísimo al corazón de esta desventurada! […] (Il. XIX, 67–287)'),
    (48, 'La profecía del caballo Janto', 19, 'profecia', 1, 1, 'Hoy te salvaremos aún, impetuoso Aquileo; pero está cercano el día de tu muerte […] (Il. XIX, 408–409)'),
    (49, 'Duelo entre Aquiles y Eneas', 20, 'duelo', 1, 1, 'Me causa pesar el magnánimo Eneas, que pronto, sucumbiendo a manos del Pelida, descenderá al Hades […] (Il. XX, 293–294)'),
    (50, 'La batalla de los dioses', 21, 'combate', 1, 1, '[…] aferró con su robusta mano una gran piedra negra y erizada de puntas […] corrió hacia Afrodita, y alzando la robusta mano descargole un golpe sobre el pecho […] (Il. XXI, 403–424)'),
    (51, 'Funeral de Héctor', 24, 'funeral', 1, 1, '¡Esposo mío! Saliste de la vida cuando aún eras joven, y me dejas viuda en el palacio. […] Así celebraron las honras de Héctor, domador de caballos. (Il. XXIV, 725–804)'),
    (52, 'Atenea visita a Telémaco', 1, 'intervencion_divina', 2, 5, 'También tú, amigo, ya que veo que eres gallardo y de elevada estatura, sé fuerte para que los venideros te elogien. (Od. I, 301–302)'),
    (53, 'Menelao y Proteo', 4, 'profecia', 2, 22, '[…] transfigurose sucesivamente en melenudo león, en dragón, en pantera y en corpulento jabalí […] (Od. IV, 456–457)'),
    (54, 'El sudario de Penélope', 2, 'engano', 2, 5, '[…] se puso a tejer en palacio una gran tela sutil e interminable […] y por la noche, tan luego como se alumbraba con las antorchas, deshacía lo tejido. (Od. II, 94–105)'),
    (55, 'Los amores de Ares y Afrodita', 8, 'engano', 2, NULL, '[…] una risa inextinguible se alzó entre los bienaventurados númenes al ver el artificio del ingenioso Hefesto. (Od. VIII, 326–327)'),
    (56, 'El caballo de Troya', 8, 'engano', 2, 1, '[…] canta como estaba dispuesto el caballo de madera construido por Epeo con la ayuda de Atenea […] (Od. VIII, 492–493)'),
    (57, 'El saqueo de Ismaro', 9, 'combate', 2, 25, '[…] llevome el viento al país de los cícones, a Ismaro: entré a saco la ciudad […] (Od. IX, 39–40)'),
    (58, 'Los lotófagos', 9, 'viaje', 2, 21, '[…] cuantos probaron este fruto, dulce como la miel, ya no querían llevar noticias ni volverse […] (Od. IX, 94–95)'),
    (59, 'Eolo y el odre de los vientos', 10, 'viaje', 2, 19, 'Prevaleció aquel mal consejo y, desatando mis amigos el odre, escapáronse con gran ímpetu todos los vientos. (Od. X, 46–47)'),
    (60, 'Los lestrigones', 10, 'combate', 2, 20, '[…] desde las peñas tiraron pedruscos muy pesados […] La mujer llamó del ágora a su marido, el preclaro Antífates […] (Od. X, 114–122)'),
    (61, 'Odiseo y la sombra de su madre', 11, 'reconocimiento', 2, 18, '[…] tres veces se me fue volando de entre las manos como sombra o sueño. (Od. XI, 207–208)'),
    (62, 'El asesinato de Agamenón', 11, 'otro', 2, 2, 'Egisto fue quien me preparó la muerte y el hado, pues, de acuerdo con mi funesta esposa […] (Od. XI, 409–410)'),
    (63, 'Las sombras de Aquiles y Áyax', 11, 'otro', 2, 18, '[…] preferiría ser labrador y servir a otro […] pero nada me respondió y se fue hacia el Erebo a juntarse con las otras almas de los difuntos. (Od. XI, 489–564)'),
    (64, 'Escila y Caribdis', 12, 'viaje', 2, NULL, '[…] Escila me arrebató de la cóncava embarcación los seis compañeros que más sobresalían […] (Od. XII, 245–246)'),
    (65, 'Poseidón petrifica la nave feacia', 13, 'intervencion_divina', 2, 12, '[…] la tornó un peñasco y de un puñetazo hizo que echara raíces en el suelo […] (Od. XIII, 163–164)'),
    (66, 'En la cabaña de Eumeo', 14, 'otro', 2, 5, 'Diciendo así, el divinal porquerizo guiole a la cabaña, introdújole en ella […] se levantó, puso cerca del fuego una cama para el huésped y la llenó de pieles de oveja y de cabras. (Od. XIV, 48–519)'),
    (67, 'Odiseo se revela a Telémaco', 16, 'reconocimiento', 2, 5, '[…] Soy tu padre, por quien gimes y sufres tantos dolores y aguantas las violencias de los hombres. (Od. XVI, 188–189)'),
    (68, 'La pelea con Iro', 18, 'combate', 2, 5, '[…] tal puñada a Iro en la cerviz, debajo de la oreja, que le quebrantó los huesos allá en el interior y le hizo echar roja sangre por la boca […] (Od. XVIII, 96–98)'),
    (69, 'El sueño de Penélope', 19, 'profecia', 2, 5, 'Hay dos puertas para los leves sueños: una, construida de cuerno; y otra, de marfil. (Od. XIX, 562–563)'),
    (70, 'La visión de Teoclímeno', 20, 'profecia', 2, 5, 'Noche obscura os envuelve la cabeza, y el rostro, y abajo las rodillas […] (Od. XX, 351–352)'),
    (71, 'Odiseo y Laertes', 24, 'reconocimiento', 2, 5, '[…] Fueron trece perales, diez manzanos y cuarenta higueras […] (Od. XXIV, 340–341)'),
    (72, 'Las sombras de los pretendientes', 24, 'otro', 2, 18, 'El cilenio Hermes llamaba las almas de los pretendientes […] (Od. XXIV, 1)'),
    (73, 'La paz de Ítaca', 24, 'intervencion_divina', 2, 5, 'Y luego hizo que juraran la paz entrambas partes la propia Palas Atenea […] (Od. XXIV, 546–547)');

-- PARTICIPA
INSERT INTO participa (id_evento, id_personaje) VALUES
    (1, 46),
    (1, 21),
    (1, 4),
    (2, 18),
    (2, 21),
    (2, 32),
    (2, 36),
    (3, 3),
    (3, 18),
    (4, 10),
    (4, 1),
    (5, 41),
    (5, 22),
    (5, 5),
    (6, 33),
    (6, 5),
    (6, 42),
    (6, 3),
    (7, 39),
    (7, 40),
    (7, 69),
    (8, 45),
    (8, 33),
    (9, 39),
    (9, 34),
    (10, 18),
    (10, 25),
    (10, 34),
    (10, 20),
    (10, 66),
    (11, 2),
    (11, 1),
    (11, 58),
    (11, 5),
    (12, 20),
    (12, 44),
    (13, 20),
    (13, 39),
    (13, 4),
    (13, 70),
    (14, 9),
    (14, 10),
    (15, 18),
    (15, 59),
    (15, 9),
    (16, 18),
    (16, 39),
    (16, 3),
    (17, 18),
    (17, 33),
    (17, 22),
    (17, 25),
    (17, 34),
    (17, 35),
    (18, 37),
    (18, 18),
    (18, 8),
    (19, 1),
    (19, 3),
    (20, 27),
    (20, 31),
    (21, 27),
    (21, 32),
    (21, 3),
    (21, 76),
    (22, 27),
    (22, 22),
    (22, 24),
    (22, 76),
    (23, 25),
    (23, 15),
    (23, 8),
    (24, 25),
    (24, 7),
    (24, 61),
    (25, 25),
    (25, 50),
    (26, 25),
    (26, 48),
    (26, 51),
    (26, 49),
    (27, 25),
    (27, 54),
    (28, 16),
    (28, 25),
    (28, 8),
    (29, 25),
    (29, 52),
    (29, 53),
    (30, 25),
    (30, 86),
    (31, 25),
    (31, 17),
    (32, 25),
    (32, 3),
    (33, 25),
    (33, 57),
    (33, 30),
    (34, 25),
    (34, 29),
    (34, 26),
    (34, 72),
    (35, 25),
    (35, 26),
    (35, 27),
    (35, 31),
    (36, 25),
    (36, 27),
    (36, 30),
    (36, 31),
    (36, 3),
    (36, 77),
    (36, 78),
    (36, 79),
    (37, 25),
    (37, 26),
    (38, 33),
    (38, 63),
    (38, 42),
    (39, 62),
    (39, 25),
    (39, 21),
    (40, 21),
    (40, 18),
    (40, 25),
    (40, 33),
    (40, 32),
    (40, 22),
    (40, 34),
    (40, 35),
    (41, 24),
    (41, 37),
    (42, 63),
    (42, 22),
    (42, 3),
    (43, 33),
    (43, 25),
    (43, 64),
    (43, 65),
    (44, 44),
    (44, 45),
    (45, 22),
    (45, 70),
    (45, 39),
    (45, 34),
    (46, 18),
    (46, 68),
    (46, 10),
    (47, 18),
    (47, 21),
    (47, 25),
    (47, 67),
    (48, 18),
    (48, 84),
    (49, 18),
    (49, 42),
    (49, 7),
    (50, 3),
    (50, 6),
    (50, 5),
    (51, 37),
    (51, 40),
    (51, 38),
    (51, 24),
    (52, 3),
    (52, 27),
    (52, 79),
    (53, 22),
    (53, 60),
    (54, 26),
    (54, 31),
    (55, 51),
    (55, 6),
    (55, 5),
    (55, 9),
    (56, 51),
    (56, 25),
    (57, 25),
    (58, 25),
    (59, 25),
    (59, 82),
    (60, 25),
    (60, 85),
    (61, 25),
    (61, 71),
    (62, 21),
    (62, 73),
    (62, 74),
    (63, 25),
    (63, 18),
    (63, 34),
    (64, 25),
    (64, 55),
    (64, 56),
    (65, 7),
    (65, 1),
    (66, 25),
    (66, 30),
    (67, 25),
    (67, 27),
    (67, 3),
    (68, 25),
    (68, 81),
    (69, 26),
    (69, 25),
    (70, 80),
    (70, 77),
    (71, 25),
    (71, 28),
    (71, 3),
    (72, 8),
    (72, 21),
    (72, 18),
    (73, 3),
    (73, 1),
    (73, 25),
    (73, 28);

-- ES_PROGENITOR (progenitor, hijo)
INSERT INTO es_progenitor (id_progenitor, id_hijo) VALUES
    (1, 3),  -- Zeus -> Atenea
    (1, 4),  -- Zeus -> Apolo
    (14, 4),  -- Leto -> Apolo
    (1, 5),  -- Zeus -> Afrodita
    (13, 5),  -- Dione -> Afrodita
    (1, 6),  -- Zeus -> Ares
    (2, 6),  -- Hera -> Ares
    (1, 9),  -- Zeus -> Hefesto
    (2, 9),  -- Hera -> Hefesto
    (1, 8),  -- Zeus -> Hermes
    (11, 1),  -- Crono -> Zeus
    (12, 1),  -- Rea -> Zeus
    (11, 2),  -- Crono -> Hera
    (12, 2),  -- Rea -> Hera
    (11, 7),  -- Crono -> Poseidón
    (12, 7),  -- Rea -> Poseidón
    (1, 24),  -- Zeus -> Helena
    (1, 44),  -- Zeus -> Sarpedón
    (19, 18),  -- Peleo -> Aquiles
    (10, 18),  -- Tetis -> Aquiles
    (23, 21),  -- Atreo -> Agamenón
    (23, 22),  -- Atreo -> Menelao
    (28, 25),  -- Laertes -> Odiseo
    (25, 27),  -- Odiseo -> Telémaco
    (26, 27),  -- Penélope -> Telémaco
    (37, 39),  -- Príamo -> Héctor
    (38, 39),  -- Hécuba -> Héctor
    (37, 41),  -- Príamo -> Paris
    (38, 41),  -- Hécuba -> Paris
    (43, 42),  -- Anquises -> Eneas
    (5, 42),  -- Afrodita -> Eneas
    (7, 54),  -- Poseidón -> Polifemo
    (17, 16),  -- Helios -> Circe
    (48, 50),  -- Alcínoo -> Nausícaa
    (49, 50),  -- Areté -> Nausícaa
    (46, 47),  -- Crises -> Criseida
    (21, 75),  -- Agamenón -> Orestes
    (74, 75),  -- Clitemnestra -> Orestes
    (39, 69),  -- Héctor -> Astianacte
    (40, 69),  -- Andrómaca -> Astianacte
    (32, 68),  -- Néstor -> Antíloco
    (32, 76),  -- Néstor -> Pisístrato
    (72, 71),  -- Autólico -> Anticlea
    (71, 25),  -- Anticlea -> Odiseo
    (1, 59);  -- Zeus -> Escamandro

-- COLABORA (dios, mortal)
INSERT INTO colabora (id_colaborador, id_beneficiario) VALUES
    (3, 18),  -- Atenea -> Aquiles
    (3, 33),  -- Atenea -> Diomedes
    (3, 25),  -- Atenea -> Odiseo
    (3, 27),  -- Atenea -> Telémaco
    (5, 41),  -- Afrodita -> Paris
    (5, 42),  -- Afrodita -> Eneas
    (4, 39),  -- Apolo -> Héctor
    (4, 42),  -- Apolo -> Eneas
    (7, 42),  -- Poseidón -> Eneas
    (8, 25),  -- Hermes -> Odiseo
    (8, 37),  -- Hermes -> Príamo
    (10, 18),  -- Tetis -> Aquiles
    (9, 18),  -- Hefesto -> Aquiles
    (15, 25),  -- Calipso -> Odiseo
    (16, 25),  -- Circe -> Odiseo
    (61, 25),  -- Ino -> Odiseo
    (3, 26),  -- Atenea -> Penélope
    (3, 28),  -- Atenea -> Laertes
    (2, 18);  -- Hera -> Aquiles

-- LUCHA (siempre el id menor primero, R2)
INSERT INTO lucha (id_personaje_a, id_personaje_b) VALUES
    (18, 39),  -- Aquiles / Héctor
    (22, 41),  -- Menelao / Paris
    (34, 39),  -- Áyax de Salamina / Héctor
    (33, 42),  -- Diomedes / Eneas
    (5, 33),  -- Afrodita / Diomedes
    (6, 33),  -- Ares / Diomedes
    (20, 44),  -- Patroclo / Sarpedón
    (20, 39),  -- Patroclo / Héctor
    (18, 42),  -- Aquiles / Eneas
    (25, 31),  -- Odiseo / Antínoo
    (25, 54),  -- Odiseo / Polifemo
    (33, 63),  -- Diomedes / Pándaro
    (22, 70),  -- Menelao / Euforbo
    (20, 70),  -- Patroclo / Euforbo
    (18, 59),  -- Aquiles / Escamandro
    (3, 6),  -- Atenea / Ares
    (3, 5),  -- Atenea / Afrodita
    (25, 81),  -- Odiseo / Iro
    (25, 77);  -- Odiseo / Eurímaco

COMMIT;
