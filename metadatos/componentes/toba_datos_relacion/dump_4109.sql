------------------------------------------------------------
--[4109]--  - dr_personas 
------------------------------------------------------------

------------------------------------------------------------
-- apex_objeto
------------------------------------------------------------

--- INICIO Grupo de desarrollo 0
INSERT INTO apex_objeto (proyecto, objeto, anterior, identificador, reflexivo, clase_proyecto, clase, punto_montaje, subclase, subclase_archivo, objeto_categoria_proyecto, objeto_categoria, nombre, titulo, colapsable, descripcion, fuente_datos_proyecto, fuente_datos, solicitud_registrar, solicitud_obj_obs_tipo, solicitud_obj_observacion, parametro_a, parametro_b, parametro_c, parametro_d, parametro_e, parametro_f, usuario, creacion, posicion_botonera) VALUES (
	'aprender', --proyecto
	'4109', --objeto
	NULL, --anterior
	NULL, --identificador
	NULL, --reflexivo
	'toba', --clase_proyecto
	'toba_datos_relacion', --clase
	'2000001', --punto_montaje
	NULL, --subclase
	NULL, --subclase_archivo
	NULL, --objeto_categoria_proyecto
	NULL, --objeto_categoria
	'- dr_personas', --nombre
	NULL, --titulo
	NULL, --colapsable
	NULL, --descripcion
	'aprender', --fuente_datos_proyecto
	'aprender', --fuente_datos
	NULL, --solicitud_registrar
	NULL, --solicitud_obj_obs_tipo
	NULL, --solicitud_obj_observacion
	NULL, --parametro_a
	NULL, --parametro_b
	NULL, --parametro_c
	NULL, --parametro_d
	NULL, --parametro_e
	NULL, --parametro_f
	NULL, --usuario
	'2017-08-07 00:37:16', --creacion
	NULL  --posicion_botonera
);
--- FIN Grupo de desarrollo 0

------------------------------------------------------------
-- apex_objeto_datos_rel
------------------------------------------------------------
INSERT INTO apex_objeto_datos_rel (proyecto, objeto, debug, clave, ap, punto_montaje, ap_clase, ap_archivo, sinc_susp_constraints, sinc_orden_automatico, sinc_lock_optimista) VALUES (
	'aprender', --proyecto
	'4109', --objeto
	'0', --debug
	NULL, --clave
	'2', --ap
	'2000001', --punto_montaje
	NULL, --ap_clase
	NULL, --ap_archivo
	'0', --sinc_susp_constraints
	'1', --sinc_orden_automatico
	'1'  --sinc_lock_optimista
);

------------------------------------------------------------
-- apex_objeto_dependencias
------------------------------------------------------------

--- INICIO Grupo de desarrollo 0
INSERT INTO apex_objeto_dependencias (proyecto, dep_id, objeto_consumidor, objeto_proveedor, identificador, parametros_a, parametros_b, parametros_c, inicializar, orden) VALUES (
	'aprender', --proyecto
	'2910', --dep_id
	'4109', --objeto_consumidor
	'4311', --objeto_proveedor
	'dt_actividades', --identificador
	'', --parametros_a
	'', --parametros_b
	NULL, --parametros_c
	NULL, --inicializar
	NULL  --orden
);
INSERT INTO apex_objeto_dependencias (proyecto, dep_id, objeto_consumidor, objeto_proveedor, identificador, parametros_a, parametros_b, parametros_c, inicializar, orden) VALUES (
	'aprender', --proyecto
	'2722', --dep_id
	'4109', --objeto_consumidor
	'4127', --objeto_proveedor
	'dt_cambio_linea', --identificador
	'', --parametros_a
	'', --parametros_b
	NULL, --parametros_c
	NULL, --inicializar
	'4'  --orden
);
INSERT INTO apex_objeto_dependencias (proyecto, dep_id, objeto_consumidor, objeto_proveedor, identificador, parametros_a, parametros_b, parametros_c, inicializar, orden) VALUES (
	'aprender', --proyecto
	'2912', --dep_id
	'4109', --objeto_consumidor
	'4313', --objeto_proveedor
	'dt_fotos_telefonos', --identificador
	'', --parametros_a
	'', --parametros_b
	NULL, --parametros_c
	NULL, --inicializar
	NULL  --orden
);
INSERT INTO apex_objeto_dependencias (proyecto, dep_id, objeto_consumidor, objeto_proveedor, identificador, parametros_a, parametros_b, parametros_c, inicializar, orden) VALUES (
	'aprender', --proyecto
	'2705', --dep_id
	'4109', --objeto_consumidor
	'2000049', --objeto_proveedor
	'dt_personas', --identificador
	NULL, --parametros_a
	NULL, --parametros_b
	NULL, --parametros_c
	NULL, --inicializar
	'1'  --orden
);
INSERT INTO apex_objeto_dependencias (proyecto, dep_id, objeto_consumidor, objeto_proveedor, identificador, parametros_a, parametros_b, parametros_c, inicializar, orden) VALUES (
	'aprender', --proyecto
	'2710', --dep_id
	'4109', --objeto_consumidor
	'2000050', --objeto_proveedor
	'dt_telefonos', --identificador
	NULL, --parametros_a
	NULL, --parametros_b
	NULL, --parametros_c
	NULL, --inicializar
	'3'  --orden
);
--- FIN Grupo de desarrollo 0

------------------------------------------------------------
-- apex_objeto_datos_rel_asoc
------------------------------------------------------------

--- INICIO Grupo de desarrollo 0
INSERT INTO apex_objeto_datos_rel_asoc (proyecto, objeto, asoc_id, identificador, padre_proyecto, padre_objeto, padre_id, padre_clave, hijo_proyecto, hijo_objeto, hijo_id, hijo_clave, cascada, orden) VALUES (
	'aprender', --proyecto
	'4109', --objeto
	'126', --asoc_id
	NULL, --identificador
	'aprender', --padre_proyecto
	'2000049', --padre_objeto
	'dt_personas', --padre_id
	NULL, --padre_clave
	'aprender', --hijo_proyecto
	'2000050', --hijo_objeto
	'dt_telefonos', --hijo_id
	NULL, --hijo_clave
	NULL, --cascada
	'1'  --orden
);
INSERT INTO apex_objeto_datos_rel_asoc (proyecto, objeto, asoc_id, identificador, padre_proyecto, padre_objeto, padre_id, padre_clave, hijo_proyecto, hijo_objeto, hijo_id, hijo_clave, cascada, orden) VALUES (
	'aprender', --proyecto
	'4109', --objeto
	'127', --asoc_id
	NULL, --identificador
	'aprender', --padre_proyecto
	'2000050', --padre_objeto
	'dt_telefonos', --padre_id
	NULL, --padre_clave
	'aprender', --hijo_proyecto
	'4127', --hijo_objeto
	'dt_cambio_linea', --hijo_id
	NULL, --hijo_clave
	NULL, --cascada
	'2'  --orden
);
INSERT INTO apex_objeto_datos_rel_asoc (proyecto, objeto, asoc_id, identificador, padre_proyecto, padre_objeto, padre_id, padre_clave, hijo_proyecto, hijo_objeto, hijo_id, hijo_clave, cascada, orden) VALUES (
	'aprender', --proyecto
	'4109', --objeto
	'160', --asoc_id
	NULL, --identificador
	'aprender', --padre_proyecto
	'4127', --padre_objeto
	'dt_cambio_linea', --padre_id
	NULL, --padre_clave
	'aprender', --hijo_proyecto
	'4311', --hijo_objeto
	'dt_actividades', --hijo_id
	NULL, --hijo_clave
	NULL, --cascada
	'3'  --orden
);
INSERT INTO apex_objeto_datos_rel_asoc (proyecto, objeto, asoc_id, identificador, padre_proyecto, padre_objeto, padre_id, padre_clave, hijo_proyecto, hijo_objeto, hijo_id, hijo_clave, cascada, orden) VALUES (
	'aprender', --proyecto
	'4109', --objeto
	'161', --asoc_id
	NULL, --identificador
	'aprender', --padre_proyecto
	'2000050', --padre_objeto
	'dt_telefonos', --padre_id
	NULL, --padre_clave
	'aprender', --hijo_proyecto
	'4313', --hijo_objeto
	'dt_fotos_telefonos', --hijo_id
	NULL, --hijo_clave
	NULL, --cascada
	'4'  --orden
);
--- FIN Grupo de desarrollo 0

------------------------------------------------------------
-- apex_objeto_rel_columnas_asoc
------------------------------------------------------------
INSERT INTO apex_objeto_rel_columnas_asoc (proyecto, objeto, asoc_id, padre_objeto, padre_clave, hijo_objeto, hijo_clave) VALUES (
	'aprender', --proyecto
	'4109', --objeto
	'126', --asoc_id
	'2000049', --padre_objeto
	'2000003', --padre_clave
	'2000050', --hijo_objeto
	'2000009'  --hijo_clave
);
INSERT INTO apex_objeto_rel_columnas_asoc (proyecto, objeto, asoc_id, padre_objeto, padre_clave, hijo_objeto, hijo_clave) VALUES (
	'aprender', --proyecto
	'4109', --objeto
	'127', --asoc_id
	'2000050', --padre_objeto
	'2000008', --padre_clave
	'4127', --hijo_objeto
	'1870'  --hijo_clave
);
INSERT INTO apex_objeto_rel_columnas_asoc (proyecto, objeto, asoc_id, padre_objeto, padre_clave, hijo_objeto, hijo_clave) VALUES (
	'aprender', --proyecto
	'4109', --objeto
	'160', --asoc_id
	'4127', --padre_objeto
	'1869', --padre_clave
	'4311', --hijo_objeto
	'2019'  --hijo_clave
);
INSERT INTO apex_objeto_rel_columnas_asoc (proyecto, objeto, asoc_id, padre_objeto, padre_clave, hijo_objeto, hijo_clave) VALUES (
	'aprender', --proyecto
	'4109', --objeto
	'161', --asoc_id
	'2000050', --padre_objeto
	'2000008', --padre_clave
	'4313', --hijo_objeto
	'2023'  --hijo_clave
);
