CREATE DATABASE  IF NOT EXISTS `contentlab_meta_reporting` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `contentlab_meta_reporting`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: contentlab_meta_reporting
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `campania_contenido`
--

DROP TABLE IF EXISTS `campania_contenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campania_contenido` (
  `id_cc` int NOT NULL AUTO_INCREMENT,
  `id_campania` int NOT NULL,
  `id_contenido` int NOT NULL,
  PRIMARY KEY (`id_cc`),
  UNIQUE KEY `uq_campania_contenido` (`id_campania`,`id_contenido`),
  KEY `idx_cc_campania` (`id_campania`),
  KEY `idx_cc_contenido` (`id_contenido`),
  CONSTRAINT `fk_cc_campania` FOREIGN KEY (`id_campania`) REFERENCES `campanias_meta` (`id_campania`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cc_contenido` FOREIGN KEY (`id_contenido`) REFERENCES `contenidos` (`id_contenido`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campania_contenido`
--

LOCK TABLES `campania_contenido` WRITE;
/*!40000 ALTER TABLE `campania_contenido` DISABLE KEYS */;
INSERT INTO `campania_contenido` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `campania_contenido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campanias_meta`
--

DROP TABLE IF EXISTS `campanias_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campanias_meta` (
  `id_campania` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `tipo_campania` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objetivo` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `presupuesto` decimal(12,2) DEFAULT NULL,
  `estado_campania` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_campania`),
  KEY `idx_campanias_tipo` (`tipo_campania`),
  KEY `idx_campanias_estado` (`estado_campania`),
  KEY `idx_campanias_fechas` (`fecha_inicio`,`fecha_fin`),
  KEY `idx_campanias_cliente` (`id_cliente`),
  CONSTRAINT `fk_campanias_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campanias_meta`
--

LOCK TABLES `campanias_meta` WRITE;
/*!40000 ALTER TABLE `campanias_meta` DISABLE KEYS */;
INSERT INTO `campanias_meta` VALUES (1,1,'trafico','Llevar visitas a nota del especial verano McDonald\'s','2026-02-05','2026-02-20',25000.00,'finalizada'),(2,2,'trafico','Generar visitas a contenido de Renault verano','2025-11-01','2025-11-20',18000.00,'finalizada'),(3,3,'alcance','Dar visibilidad a nota institucional de Philips','2026-02-12','2026-02-28',22000.00,'finalizada'),(4,4,'trafico','Incrementar visitas a nota de Geopagos','2026-02-19','2026-03-05',16000.00,'activa'),(5,5,'alcance','Aumentar visualizaciones e interacciones del video Mundo Tiny','2026-03-01','2026-03-15',9000.00,'activa'),(6,6,'trafico','Promover lectura de especial emprendedores YPF','2025-06-12','2025-06-30',21000.00,'finalizada'),(7,7,'trafico','Llevar tráfico a contenido de Peugeot','2025-10-30','2025-11-12',17000.00,'finalizada'),(8,8,'alcance','Posicionar presencia de Animana en festival ambiental','2025-11-15','2025-11-25',12000.00,'finalizada'),(9,9,'trafico','Generar tráfico a nota aniversario IOL','2025-12-19','2025-12-31',19000.00,'finalizada'),(10,10,'alcance','Potenciar visualizaciones de reel institucional verano','2026-01-20','2026-02-01',8000.00,'pausada');
/*!40000 ALTER TABLE `campanias_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `industria` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_contacto` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `idx_clientes_nombre` (`nombre_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'McDonald\'s','Consumo masivo','marketing@mcdonalds.com'),(2,'Renault','Automotriz','medios@renault.com'),(3,'Philips','Salud y tecnología','contacto@philips.com'),(4,'Geopagos','Fintech','info@geopagos.com'),(5,'Mundo Tiny','Juguetes','hola@mundotiny.com'),(6,'YPF','Energía','publicidad@ypf.com'),(7,'Peugeot','Automotriz','marketing@peugeot.com'),(8,'EY','Consultoría','comunicacion@ey.com'),(9,'Animana','Moda sustentable','info@animana.com'),(10,'IOL Inversiones','Finanzas','marketing@iol.com.ar');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenidos`
--

DROP TABLE IF EXISTS `contenidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenidos` (
  `id_contenido` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `formato` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_publicacion` date DEFAULT NULL,
  PRIMARY KEY (`id_contenido`),
  UNIQUE KEY `uq_contenidos_url` (`url`),
  KEY `idx_contenidos_formato` (`formato`),
  KEY `idx_contenidos_fecha` (`fecha_publicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenidos`
--

LOCK TABLES `contenidos` WRITE;
/*!40000 ALTER TABLE `contenidos` DISABLE KEYS */;
INSERT INTO `contenidos` VALUES (1,'De la ruta al combo: el viaje real de los ingredientes de McDonald\'s este verano','https://www.lanacion.com.ar/lifestyle/de-la-ruta-al-combo-el-viaje-real-de-los-ingredientes-de-mcdonalds-este-verano-nid05022026/','nota','2026-02-05'),(2,'Cómo se prepara el auto para el verano sin contratiempos','https://www.lanacion.com.ar/autos/tendencias/se-acerca-el-verano-sobre-ruedas-como-preparar-el-auto-para-disfrutar-sin-contratiempos-nid31102025/','nota','2025-10-31'),(3,'Así fue la transformación de una empresa centenaria','https://www.lanacion.com.ar/economia/IA/asi-fue-la-transformacion-de-una-empresa-centenaria-de-fabricar-lamparitas-a-liderar-la-ultima-nid12022026/','nota','2026-02-12'),(4,'Geopagos: de pionera en tecnología a referente en infraestructura','https://www.lanacion.com.ar/economia/IA/geopagos-de-pionera-en-tecnologia-en-el-punto-de-venta-a-referente-en-infraestructura-integral-para-nid19022026/','nota','2026-02-19'),(5,'Video lanzamiento Mundo Tiny colección primavera','https://www.tiktok.com/@mundotiny/video/7590492191911333140','video','2026-03-01'),(6,'Emprendedores argentinos: innovación y futuro','https://www.lanacion.com.ar/economia/negocios/emprendedores-argentinos-un-futuro-que-inspira-nid12062025/','nota','2025-06-12'),(7,'Mantener y cuidar el auto desde el celular','https://www.lanacion.com.ar/autos/tendencias/mantener-y-cuidar-el-auto-desde-el-celular-asi-es-la-nueva-propuesta-de-peugeot-nid30102025/','nota','2025-10-30'),(8,'Especial Animana en festival ambiental','https://www.lanacion.com.ar/lifestyle/animana-festival-ambiental-especial/','galeria','2025-11-15'),(9,'IOL Inversiones celebra 25 años','https://www.lanacion.com.ar/tecnologia/iol-inversiones-celebra-25-anos-y-supera-los-2-millones-de-inversores-en-un-mercado-cada-vez-mas-nid19122025/','nota','2025-12-19'),(10,'Reel backstage especial verano Content LAB','https://www.instagram.com/reel/backstage-contentlab-verano/','reel','2026-01-20');
/*!40000 ALTER TABLE `contenidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correcciones_reporte`
--

DROP TABLE IF EXISTS `correcciones_reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `correcciones_reporte` (
  `id_correccion` int NOT NULL AUTO_INCREMENT,
  `id_reporte` int NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `motivo` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_correccion` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_resolucion` date DEFAULT NULL,
  PRIMARY KEY (`id_correccion`),
  KEY `idx_correcciones_reporte` (`id_reporte`),
  KEY `idx_correcciones_estado` (`estado_correccion`),
  KEY `idx_correcciones_fecha` (`fecha_solicitud`),
  CONSTRAINT `fk_correcciones_reporte` FOREIGN KEY (`id_reporte`) REFERENCES `reportes` (`id_reporte`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correcciones_reporte`
--

LOCK TABLES `correcciones_reporte` WRITE;
/*!40000 ALTER TABLE `correcciones_reporte` DISABLE KEYS */;
INSERT INTO `correcciones_reporte` VALUES (1,2,'2025-11-22','Ajustar benchmark de páginas vistas','resuelta','2025-11-23'),(2,2,'2025-11-24','Corregir redacción del resumen ejecutivo','resuelta','2025-11-25'),(3,4,'2026-03-06','Sumar evolución diaria de clics','abierta',NULL),(4,5,'2026-03-16','Agregar comparativa de interacciones por audiencia','abierta',NULL),(5,7,'2025-11-14','Actualizar gráfica de alcance','resuelta','2025-11-15'),(6,7,'2025-11-16','Modificar slide final de conclusiones','resuelta','2025-11-17'),(7,9,'2026-01-03','Incluir CTR promedio del período','abierta',NULL),(8,3,'2026-03-02','Cambiar orden de slides del reporte','resuelta','2026-03-03'),(9,10,'2026-02-03','Revisar fecha de corte informada','abierta',NULL),(10,1,'2026-02-22','Agregar performance por ciudad','resuelta','2026-02-23');
/*!40000 ALTER TABLE `correcciones_reporte` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_fecha_resolucion_correccion` BEFORE UPDATE ON `correcciones_reporte` FOR EACH ROW BEGIN

    IF NEW.estado_correccion = 'resuelta' AND NEW.fecha_resolucion IS NULL THEN
        SET NEW.fecha_resolucion = CURDATE();
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `metricas_campania`
--

DROP TABLE IF EXISTS `metricas_campania`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metricas_campania` (
  `id_metrica` int NOT NULL AUTO_INCREMENT,
  `id_campania` int NOT NULL,
  `fecha_corte` date NOT NULL,
  `impresiones` int DEFAULT NULL,
  `alcance` int DEFAULT NULL,
  `clics` int DEFAULT NULL,
  `visitas` int DEFAULT NULL,
  `ctr` decimal(6,3) DEFAULT NULL,
  PRIMARY KEY (`id_metrica`),
  KEY `idx_metricas_campania_corte` (`id_campania`,`fecha_corte`),
  CONSTRAINT `fk_metricas_campania` FOREIGN KEY (`id_campania`) REFERENCES `campanias_meta` (`id_campania`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metricas_campania`
--

LOCK TABLES `metricas_campania` WRITE;
/*!40000 ALTER TABLE `metricas_campania` DISABLE KEYS */;
INSERT INTO `metricas_campania` VALUES (1,1,'2026-02-20',185000,120500,7450,6120,4.027),(2,2,'2025-11-20',143000,98700,5210,4380,3.643),(3,3,'2026-02-28',210000,175400,3900,0,1.857),(4,4,'2026-03-05',96000,70500,4180,3525,4.354),(5,5,'2026-03-15',125000,89000,3100,0,2.480),(6,6,'2025-06-30',172000,118300,6890,5575,4.006),(7,7,'2025-11-12',138500,95400,4720,3890,3.408),(8,8,'2025-11-25',98000,80100,2400,0,2.449),(9,9,'2025-12-31',149000,103200,5660,4510,3.799),(10,10,'2026-02-01',87000,64800,1950,0,2.241);
/*!40000 ALTER TABLE `metricas_campania` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes` (
  `id_reporte` int NOT NULL AUTO_INCREMENT,
  `id_campania` int NOT NULL,
  `fecha_envio` date DEFAULT NULL,
  `canal_envio` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_reporte` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_reporte` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_reporte`),
  KEY `idx_reportes_campania` (`id_campania`),
  KEY `idx_reportes_estado` (`estado_reporte`),
  KEY `idx_reportes_fecha` (`fecha_envio`),
  CONSTRAINT `fk_reportes_campania` FOREIGN KEY (`id_campania`) REFERENCES `campanias_meta` (`id_campania`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
INSERT INTO `reportes` VALUES (1,1,'2026-02-21','email','aprobado','https://drive.google.com/reporte_mcdonalds_febrero'),(2,2,'2025-11-21','whatsapp','corregido','https://drive.google.com/reporte_renault_verano'),(3,3,'2026-03-01','email','enviado','https://drive.google.com/reporte_philips_febrero'),(4,4,NULL,'drive','pendiente','https://drive.google.com/reporte_geopagos_marzo'),(5,5,NULL,'whatsapp','pendiente','https://drive.google.com/reporte_mundotiny_marzo'),(6,6,'2025-07-01','email','aprobado','https://drive.google.com/reporte_ypf_junio'),(7,7,'2025-11-13','email','corregido','https://drive.google.com/reporte_peugeot_noviembre'),(8,8,'2025-11-26','drive','aprobado','https://drive.google.com/reporte_animana_festival'),(9,9,'2026-01-02','whatsapp','enviado','https://drive.google.com/reporte_iol_diciembre'),(10,10,'2026-02-02','email','pendiente','https://drive.google.com/reporte_reel_verano');
/*!40000 ALTER TABLE `reportes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_fecha_envio_reporte` BEFORE UPDATE ON `reportes` FOR EACH ROW BEGIN

    IF NEW.estado_reporte = 'enviado' AND NEW.fecha_envio IS NULL THEN
        SET NEW.fecha_envio = CURDATE();
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vista_campanias_clientes`
--

DROP TABLE IF EXISTS `vista_campanias_clientes`;
/*!50001 DROP VIEW IF EXISTS `vista_campanias_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_campanias_clientes` AS SELECT 
 1 AS `id_campania`,
 1 AS `nombre_cliente`,
 1 AS `industria`,
 1 AS `tipo_campania`,
 1 AS `objetivo`,
 1 AS `fecha_inicio`,
 1 AS `fecha_fin`,
 1 AS `presupuesto`,
 1 AS `estado_campania`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'contentlab_meta_reporting'
--

--
-- Dumping routines for database 'contentlab_meta_reporting'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_total_correcciones_reporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_correcciones_reporte`(p_id_reporte INT) RETURNS int
    DETERMINISTIC
BEGIN

DECLARE total_correcciones INT;

SELECT COUNT(*)
INTO total_correcciones
FROM correcciones_reporte
WHERE id_reporte = p_id_reporte;

RETURN total_correcciones;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_total_visitas_campania` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_visitas_campania`(p_id_campania INT) RETURNS int
    DETERMINISTIC
BEGIN

DECLARE total_visitas INT;

SELECT SUM(visitas)
INTO total_visitas
FROM metricas_campania
WHERE id_campania = p_id_campania;

RETURN total_visitas;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_estado_reporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_estado_reporte`(
    IN p_id_reporte INT,
    IN p_estado VARCHAR(30)
)
BEGIN

    UPDATE reportes
    SET estado_reporte = p_estado
    WHERE id_reporte = p_id_reporte;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_correccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_correccion`(
    IN p_id_reporte INT,
    IN p_motivo VARCHAR(200)
)
BEGIN

    INSERT INTO correcciones_reporte
    (id_reporte, fecha_solicitud, motivo, estado_correccion)
    VALUES
    (p_id_reporte, CURDATE(), p_motivo, 'abierta');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_campanias_clientes`
--

/*!50001 DROP VIEW IF EXISTS `vista_campanias_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_campanias_clientes` AS select `c`.`id_campania` AS `id_campania`,`cl`.`nombre_cliente` AS `nombre_cliente`,`cl`.`industria` AS `industria`,`c`.`tipo_campania` AS `tipo_campania`,`c`.`objetivo` AS `objetivo`,`c`.`fecha_inicio` AS `fecha_inicio`,`c`.`fecha_fin` AS `fecha_fin`,`c`.`presupuesto` AS `presupuesto`,`c`.`estado_campania` AS `estado_campania` from (`campanias_meta` `c` join `clientes` `cl` on((`c`.`id_cliente` = `cl`.`id_cliente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-17 16:58:30
