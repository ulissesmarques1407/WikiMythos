-- =====================================================
-- WikiMythos
-- =====================================================

DROP DATABASE IF EXISTS wikimythos;
CREATE DATABASE wikimythos
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_0900_ai_ci;  -- para facilitar las búsquedas
USE wikimythos;

-- OBRA
CREATE TABLE obra (
    id_obra  INT UNSIGNED NOT NULL AUTO_INCREMENT,
    titulo   VARCHAR(30)  NOT NULL,
    CONSTRAINT pk_obra PRIMARY KEY (id_obra),
    CONSTRAINT uq_obra_titulo UNIQUE (titulo)
) ENGINE = InnoDB; -- no es necesario especificarlo por ser estándar pero nos viene bien por seguridad
-- REGION	
-- La FK id_lider se añade al final, porque personaje
-- todavía no existe
CREATE TABLE region (
    id_region  INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre     VARCHAR(60)  NOT NULL,
    bando      ENUM('aqueos', 'troyanos') NULL,
    pueblo     VARCHAR(60)  NULL,
    id_lider   INT UNSIGNED NULL,
    CONSTRAINT pk_region PRIMARY KEY (id_region),
    CONSTRAINT uq_region_nombre UNIQUE (nombre)
) ENGINE = InnoDB;

-- PERSONAJE
CREATE TABLE personaje (
    id_personaje   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre_griego  VARCHAR(60)  NOT NULL,
    nombre_latino  VARCHAR(60)  NULL,
    tipo           ENUM('dios', 'mortal', 'criatura') NOT NULL,
    genero         ENUM('masculino', 'femenino') NULL,
    descripcion    TEXT NULL,
    id_region      INT UNSIGNED NULL,                    -- PERTENECE
    CONSTRAINT pk_personaje PRIMARY KEY (id_personaje),
    CONSTRAINT fk_personaje_region FOREIGN KEY (id_region)
        REFERENCES region (id_region)
        ON DELETE SET NULL
) ENGINE = InnoDB;

-- Ahora sí: FK circular de region a personaje (LIDERA)
ALTER TABLE region
    ADD CONSTRAINT fk_region_lider FOREIGN KEY (id_lider)
        REFERENCES personaje (id_personaje)
        ON DELETE SET NULL;

-- EPITETO (entidad débil de personaje)
CREATE TABLE epiteto (
    id_personaje  INT UNSIGNED NOT NULL,
    original      VARCHAR(100) NOT NULL,
    en_espanol    VARCHAR(150) NOT NULL,
    CONSTRAINT pk_epiteto PRIMARY KEY (id_personaje, original),
    CONSTRAINT fk_epiteto_personaje FOREIGN KEY (id_personaje)
        REFERENCES personaje (id_personaje)
        ON DELETE CASCADE
) ENGINE = InnoDB;

-- EVENTO
CREATE TABLE evento (
    id_evento    INT UNSIGNED NOT NULL AUTO_INCREMENT,
    titulo       VARCHAR(100) NOT NULL,
    canto        TINYINT UNSIGNED NOT NULL,
    descripcion  TEXT NULL,
    tipo ENUM('asamblea', 'combate', 'duelo', 'intervencion_divina', 'suplica',
          'engano', 'viaje', 'naufragio', 'reconocimiento', 'banquete',
          'funeral', 'sacrificio', 'profecia', 'otro') NOT NULL,
    id_obra      INT UNSIGNED NOT NULL,                  -- CONTIENE
    id_region    INT UNSIGNED NULL,                      -- OCURRE_EN
    CONSTRAINT pk_evento PRIMARY KEY (id_evento),
    CONSTRAINT chk_evento_canto CHECK (canto BETWEEN 1 AND 24),   -- R4
    CONSTRAINT fk_evento_obra FOREIGN KEY (id_obra)
        REFERENCES obra (id_obra)
        ON DELETE RESTRICT,
    CONSTRAINT fk_evento_region FOREIGN KEY (id_region)
        REFERENCES region (id_region)
        ON DELETE SET NULL
) ENGINE = InnoDB;

-- PARTICIPA (N:M personaje - evento)
CREATE TABLE participa (
    id_personaje  INT UNSIGNED NOT NULL,
    id_evento     INT UNSIGNED NOT NULL,
    CONSTRAINT pk_participa PRIMARY KEY (id_personaje, id_evento),
    CONSTRAINT fk_participa_personaje FOREIGN KEY (id_personaje)
        REFERENCES personaje (id_personaje)
        ON DELETE CASCADE,
    CONSTRAINT fk_participa_evento FOREIGN KEY (id_evento)
        REFERENCES evento (id_evento)
        ON DELETE CASCADE
) ENGINE = InnoDB;

-- ES_PROGENITOR (N:M reflexiva)
-- Sin ON DELETE CASCADE porque no lo permite MySQl en tablas con CHK
CREATE TABLE es_progenitor (
    id_progenitor  INT UNSIGNED NOT NULL,
    id_hijo        INT UNSIGNED NOT NULL,
    CONSTRAINT pk_es_progenitor PRIMARY KEY (id_progenitor, id_hijo),
    CONSTRAINT chk_progenitor_distinto CHECK (id_progenitor <> id_hijo),   -- R1
    CONSTRAINT fk_progenitor_progenitor FOREIGN KEY (id_progenitor)
        REFERENCES personaje (id_personaje),
    CONSTRAINT fk_progenitor_hijo FOREIGN KEY (id_hijo)
        REFERENCES personaje (id_personaje)
) ENGINE = InnoDB;

-- COLABORA (N:M reflexiva, dios -> mortal)

CREATE TABLE colabora (
    id_colaborador   INT UNSIGNED NOT NULL,
    id_beneficiario  INT UNSIGNED NOT NULL,
    CONSTRAINT pk_colabora PRIMARY KEY (id_colaborador, id_beneficiario),
    CONSTRAINT fk_colabora_colaborador FOREIGN KEY (id_colaborador)
        REFERENCES personaje (id_personaje)
        ON DELETE CASCADE,
    CONSTRAINT fk_colabora_beneficiario FOREIGN KEY (id_beneficiario)
        REFERENCES personaje (id_personaje)
        ON DELETE CASCADE
) ENGINE = InnoDB;

-- LUCHA (N:M reflexiva simétrica)
-- Sin ON DELETE CASCADE, por el mismo motivo que es_progenitor.
CREATE TABLE lucha (
    id_personaje_a  INT UNSIGNED NOT NULL,
    id_personaje_b  INT UNSIGNED NOT NULL,
    CONSTRAINT pk_lucha PRIMARY KEY (id_personaje_a, id_personaje_b),
    CONSTRAINT chk_lucha_orden CHECK (id_personaje_a < id_personaje_b),   -- R2
    CONSTRAINT fk_lucha_a FOREIGN KEY (id_personaje_a)
        REFERENCES personaje (id_personaje),
    CONSTRAINT fk_lucha_b FOREIGN KEY (id_personaje_b)
        REFERENCES personaje (id_personaje)
) ENGINE = InnoDB;