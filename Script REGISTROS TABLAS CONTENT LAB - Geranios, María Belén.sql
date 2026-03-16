USE contentlab_meta_reporting;

-- =========================================================
-- INSERTS TABLA: clientes
-- =========================================================
INSERT INTO clientes (nombre_cliente, industria, email_contacto) VALUES
('McDonald''s', 'Consumo masivo', 'marketing@mcdonalds.com'),
('Renault', 'Automotriz', 'medios@renault.com'),
('Philips', 'Salud y tecnología', 'contacto@philips.com'),
('Geopagos', 'Fintech', 'info@geopagos.com'),
('Mundo Tiny', 'Juguetes', 'hola@mundotiny.com'),
('YPF', 'Energía', 'publicidad@ypf.com'),
('Peugeot', 'Automotriz', 'marketing@peugeot.com'),
('EY', 'Consultoría', 'comunicacion@ey.com'),
('Animana', 'Moda sustentable', 'info@animana.com'),
('IOL Inversiones', 'Finanzas', 'marketing@iol.com.ar');

-- =========================================================
-- INSERTS TABLA: contenidos
-- =========================================================
INSERT INTO contenidos (titulo, url, formato, fecha_publicacion) VALUES
('De la ruta al combo: el viaje real de los ingredientes de McDonald''s este verano', 'https://www.lanacion.com.ar/lifestyle/de-la-ruta-al-combo-el-viaje-real-de-los-ingredientes-de-mcdonalds-este-verano-nid05022026/', 'nota', '2026-02-05'),
('Cómo se prepara el auto para el verano sin contratiempos', 'https://www.lanacion.com.ar/autos/tendencias/se-acerca-el-verano-sobre-ruedas-como-preparar-el-auto-para-disfrutar-sin-contratiempos-nid31102025/', 'nota', '2025-10-31'),
('Así fue la transformación de una empresa centenaria', 'https://www.lanacion.com.ar/economia/IA/asi-fue-la-transformacion-de-una-empresa-centenaria-de-fabricar-lamparitas-a-liderar-la-ultima-nid12022026/', 'nota', '2026-02-12'),
('Geopagos: de pionera en tecnología a referente en infraestructura', 'https://www.lanacion.com.ar/economia/IA/geopagos-de-pionera-en-tecnologia-en-el-punto-de-venta-a-referente-en-infraestructura-integral-para-nid19022026/', 'nota', '2026-02-19'),
('Video lanzamiento Mundo Tiny colección primavera', 'https://www.tiktok.com/@mundotiny/video/7590492191911333140', 'video', '2026-03-01'),
('Emprendedores argentinos: innovación y futuro', 'https://www.lanacion.com.ar/economia/negocios/emprendedores-argentinos-un-futuro-que-inspira-nid12062025/', 'nota', '2025-06-12'),
('Mantener y cuidar el auto desde el celular', 'https://www.lanacion.com.ar/autos/tendencias/mantener-y-cuidar-el-auto-desde-el-celular-asi-es-la-nueva-propuesta-de-peugeot-nid30102025/', 'nota', '2025-10-30'),
('Especial Animana en festival ambiental', 'https://www.lanacion.com.ar/lifestyle/animana-festival-ambiental-especial/', 'galeria', '2025-11-15'),
('IOL Inversiones celebra 25 años', 'https://www.lanacion.com.ar/tecnologia/iol-inversiones-celebra-25-anos-y-supera-los-2-millones-de-inversores-en-un-mercado-cada-vez-mas-nid19122025/', 'nota', '2025-12-19'),
('Reel backstage especial verano Content LAB', 'https://www.instagram.com/reel/backstage-contentlab-verano/', 'reel', '2026-01-20');

-- =========================================================
-- INSERTS TABLA: campanias_meta
-- =========================================================
INSERT INTO campanias_meta (id_cliente, tipo_campania, objetivo, fecha_inicio, fecha_fin, presupuesto, estado_campania) VALUES
(1, 'trafico', 'Llevar visitas a nota del especial verano McDonald''s', '2026-02-05', '2026-02-20', 25000.00, 'finalizada'),
(2, 'trafico', 'Generar visitas a contenido de Renault verano', '2025-11-01', '2025-11-20', 18000.00, 'finalizada'),
(3, 'alcance', 'Dar visibilidad a nota institucional de Philips', '2026-02-12', '2026-02-28', 22000.00, 'finalizada'),
(4, 'trafico', 'Incrementar visitas a nota de Geopagos', '2026-02-19', '2026-03-05', 16000.00, 'activa'),
(5, 'alcance', 'Aumentar visualizaciones e interacciones del video Mundo Tiny', '2026-03-01', '2026-03-15', 9000.00, 'activa'),
(6, 'trafico', 'Promover lectura de especial emprendedores YPF', '2025-06-12', '2025-06-30', 21000.00, 'finalizada'),
(7, 'trafico', 'Llevar tráfico a contenido de Peugeot', '2025-10-30', '2025-11-12', 17000.00, 'finalizada'),
(8, 'alcance', 'Posicionar presencia de Animana en festival ambiental', '2025-11-15', '2025-11-25', 12000.00, 'finalizada'),
(9, 'trafico', 'Generar tráfico a nota aniversario IOL', '2025-12-19', '2025-12-31', 19000.00, 'finalizada'),
(10, 'alcance', 'Potenciar visualizaciones de reel institucional verano', '2026-01-20', '2026-02-01', 8000.00, 'pausada');

-- =========================================================
-- INSERTS TABLA: campania_contenido
-- =========================================================
INSERT INTO campania_contenido (id_campania, id_contenido) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- =========================================================
-- INSERTS TABLA: metricas_campania
-- =========================================================
INSERT INTO metricas_campania (id_campania, fecha_corte, impresiones, alcance, clics, visitas, ctr) VALUES
(1, '2026-02-20', 185000, 120500, 7450, 6120, 4.027),
(2, '2025-11-20', 143000, 98700, 5210, 4380, 3.643),
(3, '2026-02-28', 210000, 175400, 3900, 0, 1.857),
(4, '2026-03-05', 96000, 70500, 4180, 3525, 4.354),
(5, '2026-03-15', 125000, 89000, 3100, 0, 2.480),
(6, '2025-06-30', 172000, 118300, 6890, 5575, 4.006),
(7, '2025-11-12', 138500, 95400, 4720, 3890, 3.408),
(8, '2025-11-25', 98000, 80100, 2400, 0, 2.449),
(9, '2025-12-31', 149000, 103200, 5660, 4510, 3.799),
(10, '2026-02-01', 87000, 64800, 1950, 0, 2.241);

-- =========================================================
-- INSERTS TABLA: reportes
-- =========================================================
INSERT INTO reportes (id_campania, fecha_envio, canal_envio, estado_reporte, link_reporte) VALUES
(1, '2026-02-21', 'email', 'aprobado', 'https://drive.google.com/reporte_mcdonalds_febrero'),
(2, '2025-11-21', 'whatsapp', 'corregido', 'https://drive.google.com/reporte_renault_verano'),
(3, '2026-03-01', 'email', 'enviado', 'https://drive.google.com/reporte_philips_febrero'),
(4, NULL, 'drive', 'pendiente', 'https://drive.google.com/reporte_geopagos_marzo'),
(5, NULL, 'whatsapp', 'pendiente', 'https://drive.google.com/reporte_mundotiny_marzo'),
(6, '2025-07-01', 'email', 'aprobado', 'https://drive.google.com/reporte_ypf_junio'),
(7, '2025-11-13', 'email', 'corregido', 'https://drive.google.com/reporte_peugeot_noviembre'),
(8, '2025-11-26', 'drive', 'aprobado', 'https://drive.google.com/reporte_animana_festival'),
(9, '2026-01-02', 'whatsapp', 'enviado', 'https://drive.google.com/reporte_iol_diciembre'),
(10, '2026-02-02', 'email', 'pendiente', 'https://drive.google.com/reporte_reel_verano');

-- =========================================================
-- INSERTS TABLA: correcciones_reporte
-- =========================================================
INSERT INTO correcciones_reporte (id_reporte, fecha_solicitud, motivo, estado_correccion, fecha_resolucion) VALUES
(2, '2025-11-22', 'Ajustar benchmark de páginas vistas', 'resuelta', '2025-11-23'),
(2, '2025-11-24', 'Corregir redacción del resumen ejecutivo', 'resuelta', '2025-11-25'),
(4, '2026-03-06', 'Sumar evolución diaria de clics', 'abierta', NULL),
(5, '2026-03-16', 'Agregar comparativa de interacciones por audiencia', 'abierta', NULL),
(7, '2025-11-14', 'Actualizar gráfica de alcance', 'resuelta', '2025-11-15'),
(7, '2025-11-16', 'Modificar slide final de conclusiones', 'resuelta', '2025-11-17'),
(9, '2026-01-03', 'Incluir CTR promedio del período', 'abierta', NULL),
(3, '2026-03-02', 'Cambiar orden de slides del reporte', 'resuelta', '2026-03-03'),
(10, '2026-02-03', 'Revisar fecha de corte informada', 'abierta', NULL),
(1, '2026-02-22', 'Agregar performance por ciudad', 'resuelta', '2026-02-23');