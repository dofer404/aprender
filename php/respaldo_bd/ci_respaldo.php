<?php
class ci_respaldo extends aprender_ci
{
	protected $s__datos = [];
	protected $scriptCrearBackup = "/var/local/aprender/bin/crearBackup";
	protected $modoDesarrollador = false;

	function ejecutarComando($comando)
	{
		$output = [];
		$resultado = -1;
		exec("$comando 2>&1", $output, $resultado);

		// Valor de retorno de la funci�n
		$unResultado = ['resultado' => $resultado,
			 							'output' => $output];

		// Usamos s__datos['backup-log'] en la funci�n esta_backupCreado para
		// determinar si el backup fue exitoso o no
		$this->s__datos['backup-log'] = $unResultado;

		// == DEBUG ==
		// Usamos esta variable para imprimir informaci�n de debug
		$unaInformacionLog = array_merge(['comando' => $comando],
	 											             $unResultado);
		// Si la orden se ejecut� correctamente
		if ($resultado == 0) {
			// Imprimimos la informaci�n de debug
			toba::logger()->debug('Se ejecut� la orden: '.$unaInformacionLog['comando']);
		} else {
			// De lo contrario imprimimos la informaci�n de debug informando de un error
			toba::logger()->error('Fall� la orden: '.$unaInformacionLog['comando']);
		}
		// Imprimimos todo lo guardado en $unaInformacionLog
		toba::logger()->var_dump($unaInformacionLog, 'Ejecucion de comando');
		// == FIN DEBUG ==

		return $unResultado;
	}

	function crearBackup()
	{
		// Obtenemos la clave
		$unResultado = $this->ejecutarComando($this->scriptCrearBackup. " get-pass");

		if ($unResultado['resultado']==0) {
			if (isset($unResultado['output'][0])) {
				// Seteamos la clave
				putenv("PGPASSWORD=" . $unResultado['output'][0]);
			}
		}

		// Creamos el backup
		$this->ejecutarComando($this->scriptCrearBackup);
	}

	function ini()
	{
		// Esto se puede implementar usando AJAX para mostrar al usuario una
		// Animaci�n con la que brindarlee un aproximaci�n al porcentaje de completado de la acci�n
		$this->crearBackup();
	}

	//-----------------------------------------------------------------------------------
	//---- JAVASCRIPT -------------------------------------------------------------------
	//-----------------------------------------------------------------------------------

	function esta_backupCreado()
	{
		if (isset($this->s__datos['backup-log']['resultado'])) {
			if ($this->s__datos['backup-log']['resultado'] == 0) {
				return true;
			}
		}
		return false;
	}

	function extender_objeto_js()
	{
		if ($this->esta_backupCreado()) {
			$funcionDescargar = " {$this->objeto_js}.descargar = function(dataurl, filename) {".'
															var a = document.createElement("a");
															a.href = dataurl;
															a.setAttribute("download", filename);
															var b = document.createEvent("MouseEvents");
															b.initEvent("click", false, true);
															a.dispatchEvent(b);
														}';
			$accionBoton = "{$this->objeto_js}.descargar('temp/backup.backup.gz', 'backup.gz');";
			$accionDefecto = $accionBoton;
		} else {
			$funcionDescargar = "";
			$accionDefecto = "";
			$accionBoton = "alert('No se pudo generar el bakcup. Intente nuevamente m�s tarde.');";
			// Aqu� se puede utilizar el log $this->s__datos['backup-log']
			// para dar un mensaje m�s concreto sobre qu� fall�.
			toba::notificacion()->agregar("Fall� la creaci�n del backup. Intente nuevamente m�s tarde.", 'error');
		}

		echo "
		$funcionDescargar
		$accionDefecto

		//---- Eventos ---------------------------------------------
		{$this->objeto_js}.evt__descargar = function()
		{
			$accionBoton
			return false;
		}
		";
	}

}
?>
