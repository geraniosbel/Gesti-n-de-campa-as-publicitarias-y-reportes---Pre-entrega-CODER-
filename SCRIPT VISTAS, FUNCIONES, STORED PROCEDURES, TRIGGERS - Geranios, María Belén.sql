USE contentlab_meta_reporting;

-- =========================
-- VISTA 1
-- =========================
CREATE VIEW vista_campanias_clientes AS
SELECT
    c.id_campania,
    cl.nombre_cliente,
    cl.industria,
    c.tipo_campania,
    c.objetivo,
    c.fecha_inicio,
    c.fecha_fin,
    c.presupuesto,
    c.estado_campania
FROM campanias_meta c
JOIN clientes cl
ON c.id_cliente = cl.id_cliente;

-- =========================
-- VISTA 2
-- =========================
CREATE VIEW vista_metricas_campanias AS
SELECT
    c.id_campania,
    cl.nombre_cliente,
    SUM(m.impresiones) AS total_impresiones,
    SUM(m.alcance) AS total_alcance,
    SUM(m.clics) AS total_clics,
    SUM(m.visitas) AS total_visitas,
    AVG(m.ctr) AS ctr_promedio
FROM metricas_campania m
JOIN campanias_meta c
ON m.id_campania = c.id_campania
JOIN clientes cl
ON c.id_cliente = cl.id_cliente
GROUP BY c.id_campania, cl.nombre_cliente;

-- =========================
-- VISTA 3
-- =========================
CREATE VIEW vista_reportes_correcciones AS
SELECT
    r.id_reporte,
    r.id_campania,
    r.estado_reporte,
    COUNT(cr.id_correccion) AS total_correcciones
FROM reportes r
LEFT JOIN correcciones_reporte cr
ON r.id_reporte = cr.id_reporte
GROUP BY r.id_reporte, r.id_campania, r.estado_reporte;

-- =========================
-- FUNCION 1 TOTAL VISITAS CAMPAÑA META
-- =========================
DELIMITER $$

CREATE FUNCTION fn_total_visitas_campania(p_id_campania INT)
RETURNS INT
DETERMINISTIC
BEGIN

DECLARE total_visitas INT;

SELECT SUM(visitas)
INTO total_visitas
FROM metricas_campania
WHERE id_campania = p_id_campania;

RETURN total_visitas;

END$$

DELIMITER ;

-- =========================
-- FUNCION 2 TOTAL CORRECCIONES POR REPORTE
-- =========================
DELIMITER $$

CREATE FUNCTION fn_total_correcciones_reporte(p_id_reporte INT)
RETURNS INT
DETERMINISTIC
BEGIN

DECLARE total_correcciones INT;

SELECT COUNT(*)
INTO total_correcciones
FROM correcciones_reporte
WHERE id_reporte = p_id_reporte;

RETURN total_correcciones;

END$$

DELIMITER ;

-- =========================
-- PROCEDIMIENTO 1 REGISTRAR UNA NUEVA CORRECCION
-- =========================
DELIMITER $$

CREATE PROCEDURE sp_registrar_correccion(
    IN p_id_reporte INT,
    IN p_motivo VARCHAR(200)
)
BEGIN

    INSERT INTO correcciones_reporte
    (id_reporte, fecha_solicitud, motivo, estado_correccion)
    VALUES
    (p_id_reporte, CURDATE(), p_motivo, 'abierta');

END$$

DELIMITER ;

-- =========================
-- PROCEDIMIENTO 2 ACTUALIZAR EL ESTADO DE UN REPORTE
-- =========================
DELIMITER $$

CREATE PROCEDURE sp_actualizar_estado_reporte(
    IN p_id_reporte INT,
    IN p_estado VARCHAR(30)
)
BEGIN

    UPDATE reportes
    SET estado_reporte = p_estado
    WHERE id_reporte = p_id_reporte;

END$$

DELIMITER ;

-- =========================
-- TRIGGER 1 COMPLETAR FECHA DE ENVÍO DEL REPORTE
-- =========================
DELIMITER $$

CREATE TRIGGER trg_fecha_envio_reporte
BEFORE UPDATE ON reportes
FOR EACH ROW
BEGIN

    IF NEW.estado_reporte = 'enviado' AND NEW.fecha_envio IS NULL THEN
        SET NEW.fecha_envio = CURDATE();
    END IF;

END$$

DELIMITER ;

-- =========================
-- TRIGGER 2 COMPLETAR FECHA DE RESOLUCIÓN DE UNA CORRECCION DE UN REPORTE
-- =========================
DELIMITER $$

CREATE TRIGGER trg_fecha_resolucion_correccion
BEFORE UPDATE ON correcciones_reporte
FOR EACH ROW
BEGIN

    IF NEW.estado_correccion = 'resuelta' AND NEW.fecha_resolucion IS NULL THEN
        SET NEW.fecha_resolucion = CURDATE();
    END IF;

END$$

DELIMITER ;