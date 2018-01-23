<?php
class form extends aprender_ei_formulario
{
	//-----------------------------------------------------------------------------------
	//---- JAVASCRIPT -------------------------------------------------------------------
	//-----------------------------------------------------------------------------------

	function extender_objeto_js()
	{
		echo "
		//---- Procesamiento de EFs --------------------------------

		{$this->objeto_js}.inicializarCaches = function() {
			if (typeof(js_form_2000046_form.cache_esDniExistente) == 'undefined') {
				js_form_2000046_form.cache_esDniExistente = {};
			}
		}

		{$this->objeto_js}.evt__nro_documento__procesar = function(es_inicial)
		{
			if (!es_inicial) {
				id_ef = 'nro_documento';
				if (this.ef(id_ef).tiene_estado()) {
					var datos_consulta = {'dni_ingresado': this.ef(id_ef).get_estado()};
					this.controlador.ajax('get_esDniExistente', datos_consulta, this, this.procesarRespuesta_dniExistente);
				}
			} else {
				this.inicializarCaches();
			}
		}

		{$this->objeto_js}.evt__nro_documento__validar = function(es_inicial)
		{
			if (!es_inicial) {
				id_ef = 'nro_documento';
				ef_estado = this.ef(id_ef).get_estado();
				msgError_dniExistente = ' ' + ef_estado + ' ya se encuentra registrado para otra persona.';
				msgError_dniFaltaInfo = ': El servidor está tardando en responder la solicitud sobre si el DNI ' + ef_estado + ' ya existe. Vuelva a ingresar el DNI para volver a intentar.';

				// Si tenemos información sobre el dni ingresado actualmente procedemos
				if (ef_estado in this.cache_esDniExistente) {
					// Si el DNI existe para otra persona
					if (this.cache_esDniExistente[ef_estado]) {
						this.ef(id_ef).set_error(msgError_dniExistente);
					} else { //< El DNI no existe, todo ok.
						this.ef(id_ef).resetear_error();
						return true;
					}
				} else { //< Si NO tenemos información sobre el dni ingresado actualmente
					this.ef(id_ef).set_error(msgError_dniFaltaInfo);
					return false;
				}
				return false;
			} else {
				this.inicializarCaches();
			}
			return true
		}

		{$this->objeto_js}.procesarRespuesta_dniExistente = function (datos)
		{
			id_ef = 'nro_documento';
			ef_estado = this.ef(id_ef).get_estado();
			// Si la respuesta es para el estado actual del ef procedemos
			if (datos['dni_ingresado'] == ef_estado) {
				// Guardamos la información en this
				this.cache_esDniExistente[datos['dni_ingresado']] = datos['existe'];
				// hacemos validar el ef ahora que tenemos la respuesta del servidor
				this.validar_ef(id_ef, true);
			}
		}

		{$this->objeto_js}.evt__id_provincia__procesar = function(es_inicial)
		{
			var parametros = [];
      parametros['id_provincia'] = this.ef('id_provincia').get_estado();
			this.controlador.ajax('getLocalidades', parametros, this, this.cascada_manual_formuntelefono_idlocalidad);
		}

		{$this->objeto_js}.cascada_manual_formuntelefono_idlocalidad = function(datos)
		{
      var opciones = [];
			var opcion = [];
      datos.forEach(function(elemento)
      {
				opcion=[]
				opcion.push(elemento['id_localidad']);
				opcion.push(elemento['nombre']);
				opciones.push(opcion);
      })
      this.controlador.dep('form_untelefono').ef('idlocalidad_cascada_manual').set_opciones_rs(opciones);
		}
		";
	}

}

?>
