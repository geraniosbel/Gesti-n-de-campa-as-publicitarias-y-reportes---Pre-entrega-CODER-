/* =========================================================
   Proyecto Final - Entrega 1
   Script: 01_create_schema.sql
   Motor: MySQL (InnoDB)
   Descripción: Crea la base de datos y las tablas con PK/FK/Índices
   ========================================================= */

-- (Opcional) borrar y recrear la base para pruebas
DROP DATABASE IF EXISTS contentlab_meta_reporting;
CREATE DATABASE contentlab_meta_reporting
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE contentlab_meta_reporting;

-- =========================
-- TABLA: clientes
-- =========================
CREATE TABLE clientes (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre_cliente VARCHAR(120) NOT NULL,
  industria VARCHAR(60),
  email_contacto VARCHAR(120),
  INDEX idx_clientes_nombre (nombre_cliente)
) ENGINE=InnoDB;

-- =========================
-- TABLA: campanias_meta
-- =========================
CREATE TABLE campanias_meta (
  id_campania INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  tipo_campania VARCHAR(20) NOT NULL,     -- trafico | alcance
  objetivo VARCHAR(120) NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE,
  presupuesto DECIMAL(12,2),
  estado_campania VARCHAR(20) NOT NULL,   -- activa | finalizada | pausada

  INDEX idx_campanias_tipo (tipo_campania),
  INDEX idx_campanias_estado (estado_campania),
  INDEX idx_campanias_fechas (fecha_inicio, fecha_fin),
  INDEX idx_campanias_cliente (id_cliente),

  CONSTRAINT fk_campanias_cliente
    FOREIGN KEY (id_cliente)
    REFERENCES clientes(id_cliente)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

-- =========================
-- TABLA: contenidos
-- =========================
CREATE TABLE contenidos (
  id_contenido INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(180),
  url VARCHAR(300) NOT NULL,
  formato VARCHAR(30) NOT NULL,          -- nota | reel | video | historia | carrusel
  fecha_publicacion DATE,

  UNIQUE KEY uq_contenidos_url (url),
  INDEX idx_contenidos_formato (formato),
  INDEX idx_contenidos_fecha (fecha_publicacion)
) ENGINE=InnoDB;

-- =========================
-- TABLA PUENTE: campania_contenido (N a N)
-- =========================
CREATE TABLE campania_contenido (
  id_cc INT AUTO_INCREMENT PRIMARY KEY,
  id_campania INT NOT NULL,
  id_contenido INT NOT NULL,

  UNIQUE KEY uq_campania_contenido (id_campania, id_contenido),
  INDEX idx_cc_campania (id_campania),
  INDEX idx_cc_contenido (id_contenido),

  CONSTRAINT fk_cc_campania
    FOREIGN KEY (id_campania)
    REFERENCES campanias_meta(id_campania)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

  CONSTRAINT fk_cc_contenido
    FOREIGN KEY (id_contenido)
    REFERENCES contenidos(id_contenido)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

-- =========================
-- TABLA: metricas_campania
-- =========================
CREATE TABLE metricas_campania (
  id_metrica INT AUTO_INCREMENT PRIMARY KEY,
  id_campania INT NOT NULL,
  fecha_corte DATE NOT NULL,
  impresiones INT,
  alcance INT,
  clics INT,
  visitas INT,
  ctr DECIMAL(6,3),

  INDEX idx_metricas_campania_corte (id_campania, fecha_corte),

  CONSTRAINT fk_metricas_campania
    FOREIGN KEY (id_campania)
    REFERENCES campanias_meta(id_campania)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

-- =========================
-- TABLA: reportes
-- =========================
CREATE TABLE reportes (
  id_reporte INT AUTO_INCREMENT PRIMARY KEY,
  id_campania INT NOT NULL,
  fecha_envio DATE,
  canal_envio VARCHAR(30),               -- email | whatsapp | drive | otro
  estado_reporte VARCHAR(30) NOT NULL,   -- pendiente | enviado | aprobado | corregido
  link_reporte VARCHAR(300),

  INDEX idx_reportes_campania (id_campania),
  INDEX idx_reportes_estado (estado_reporte),
  INDEX idx_reportes_fecha (fecha_envio),

  CONSTRAINT fk_reportes_campania
    FOREIGN KEY (id_campania)
    REFERENCES campanias_meta(id_campania)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

-- =========================
-- TABLA: correcciones_reporte
-- =========================
CREATE TABLE correcciones_reporte (
  id_correccion INT AUTO_INCREMENT PRIMARY KEY,
  id_reporte INT NOT NULL,
  fecha_solicitud DATE NOT NULL,
  motivo VARCHAR(200),
  estado_correccion VARCHAR(20) NOT NULL,  -- abierta | resuelta
  fecha_resolucion DATE,

  INDEX idx_correcciones_reporte (id_reporte),
  INDEX idx_correcciones_estado (estado_correccion),
  INDEX idx_correcciones_fecha (fecha_solicitud),

  CONSTRAINT fk_correcciones_reporte
    FOREIGN KEY (id_reporte)
    REFERENCES reportes(id_reporte)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;
