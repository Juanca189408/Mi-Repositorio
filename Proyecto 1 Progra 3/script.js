document.addEventListener('DOMContentLoaded', function() {
    
    function obtenerDatosRegistro() {
        const registro = localStorage.getItem('registro');
        if (registro) {
            return JSON.parse(registro);
        }
        return [];
    }

  
    function guardarDatosRegistro(datos) {
        localStorage.setItem('registro', JSON.stringify(datos));
    }

    
    document.getElementById('registroForm').addEventListener('submit', function(event) {
        event.preventDefault();
        const nombre = document.getElementById('nombre').value;
        const apellido = document.getElementById('apellido').value;
        const edad = document.getElementById('edad').value;
        const email = document.getElementById('email').value;
        const conrasena = document.getElementById('contrasena').value;

       
        const datosRegistro = obtenerDatosRegistro();
        const usuarioExistente = datosRegistro.find(usuario => usuario.email === email);
        if (usuarioExistente) {
            alert('El correo electrónico ya está registrado. Por favor, usa otro.');
            return;
        }

        const nuevoUsuario = { nombre, apellido, edad, email };
        datosRegistro.push(nuevoUsuario);
        guardarDatosRegistro(datosRegistro);

        
        window.location.href = 'inicio.html';
    });

    
    document.getElementById('loginForm').addEventListener('submit', function(event) {
        event.preventDefault();
        const email = document.getElementById('emailLogin').value;
        const password = document.getElementById('passwordLogin').value;

        
        const datosRegistro = obtenerDatosRegistro();
        const usuarioValido = datosRegistro.find(usuario => usuario.email === email);

        if (!usuarioValido) {
            alert('Correo electrónico no registrado.');
            return;
        }

    
        window.location.href = 'inicio.html';
    });
});

//Lista de materias
const materiasPorCarrera = {
    informatica: [
        { id: 'progAvanzada', nombre: 'Programación Avanzada', profesor: 'Profesor Juan Estrada', costo: 50000 },
        { id: 'basesDatos', nombre: 'Bases de Datos', profesor: 'Profesora Vanessa Rostran', costo: 50000 },
        { id: 'redesComputadoras', nombre: 'Redes de Computadoras', profesor: 'Profesor Arturo Jimenez', costo: 60000 },
        { id: 'inteligenciaArtificial', nombre: 'Inteligencia Artificial', profesor: 'Profesor Martín Ramírez', costo: 55000 },
        { id: 'seguridadInformatica', nombre: 'Seguridad Informática', profesor: 'Profesora Laura Medina', costo: 58000 }
    ],
    biologia: [
        { id: 'bioCelular', nombre: 'Biología Celular', profesor: 'Profesor Andres Carmona', costo: 50000 },
        { id: 'genetica', nombre: 'Genética', profesor: 'Profesora Maria Espinoza', costo: 50000 },
        { id: 'ecologia', nombre: 'Ecología', profesor: 'Profesor Bejamin Estrada', costo: 50000 },
        { id: 'botanica', nombre: 'Botánica', profesor: 'Profesora Laura Salazar', costo: 48000 },
        { id: 'zoologia', nombre: 'Zoología', profesor: 'Profesor Roberto García', costo: 49000 }
    ],
    arquitectura: [
        { id: 'disenoArquitectonico', nombre: 'Diseño Arquitectónico', profesor: 'Profesora Carla Gómez', costo: 55000 },
        { id: 'historiaArquitectura', nombre: 'Historia de la Arquitectura', profesor: 'Profesor Manuel Torres', costo: 52000 },
        { id: 'materialesConstruccion', nombre: 'Materiales de Construcción', profesor: 'Profesor Luis Martínez', costo: 53000 },
        { id: 'urbanismo', nombre: 'Urbanismo', profesor: 'Profesor José Pérez', costo: 54000 },
        { id: 'paisajismo', nombre: 'Paisajismo', profesor: 'Profesora Ana Gutiérrez', costo: 51000 }
    ],
    derecho: [
        { id: 'derechoCivil', nombre: 'Derecho Civil', profesor: 'Profesor Roberto Sánchez', costo: 60000 },
        { id: 'derechoPenal', nombre: 'Derecho Penal', profesor: 'Profesora Laura Vargas', costo: 58000 },
        { id: 'derechoLaboral', nombre: 'Derecho Laboral', profesor: 'Profesora Ana Ramírez', costo: 59000 },
        { id: 'derechoInternacional', nombre: 'Derecho Internacional', profesor: 'Profesora Claudia Martínez', costo: 57000 },
        { id: 'derechoConstitucional', nombre: 'Derecho Constitucional', profesor: 'Profesor David Gómez', costo: 56000 }
    ],
    medicina: [
        { id: 'anatomia', nombre: 'Anatomía Humana', profesor: 'Profesora Elena Gómez', costo: 62000 },
        { id: 'fisiologia', nombre: 'Fisiología', profesor: 'Profesor Miguel Soto', costo: 61000 },
        { id: 'patologia', nombre: 'Patología General', profesor: 'Profesora Laura Rodríguez', costo: 63000 },
        { id: 'farmacologia', nombre: 'Farmacología', profesor: 'Profesor Luis Herrera', costo: 64000 },
        { id: 'cirugia', nombre: 'Cirugía General', profesor: 'Profesor Daniel Rojas', costo: 65000 }
    ],
    economia: [
        { id: 'microeconomia', nombre: 'Microeconomía', profesor: 'Profesor Eduardo Cruz', costo: 54000 },
        { id: 'macroeconomia', nombre: 'Macroeconomía', profesor: 'Profesora Ana Martínez', costo: 55000 },
        { id: 'economiaInternacional', nombre: 'Economía Internacional', profesor: 'Profesor Roberto González', costo: 56000 },
        { id: 'finanzasPublicas', nombre: 'Finanzas Públicas', profesor: 'Profesora Laura Gómez', costo: 57000 },
        { id: 'economiaDesarrollo', nombre: 'Economía del Desarrollo', profesor: 'Profesor Juan Pérez', costo: 58000 }
    ]
};

//Funcion muestra las materias segun la carrera seleccionada
function mostrarMaterias() {
    const carreraSeleccionada = document.getElementById('selectCarreras').value;
    const materias = materiasPorCarrera[carreraSeleccionada];

    const materiasContainer = document.getElementById('materiasContainer');
    materiasContainer.innerHTML = '';

    if (materias && materias.length > 0) {
        materias.forEach(materia => {
            const materiaHTML = `
                <div class="materia">
                    <input type="checkbox" id="${materia.id}" name="materia" value="${materia.nombre}">
                    <label for="${materia.id}">${materia.nombre} - Profesor: ${materia.profesor} - Costo: $${materia.costo}</label>
                </div>
            `;
            materiasContainer.innerHTML += materiaHTML;
        });
    } else {
        materiasContainer.innerHTML = '<p>No hay materias disponibles para esta carrera.</p>';
    }
}

//Funcion del boton matricularse despues de elegir las materias seleccionadas por checkbox
function matricular() {
    const materiasSeleccionadas = document.querySelectorAll('input[name="materia"]:checked');
    
    if (materiasSeleccionadas.length === 0) {
        alert('Debes seleccionar al menos una materia.');
        return;
    }

    const resumenMatricula = document.getElementById('resumenMatricula');
    resumenMatricula.innerHTML = '';

    let totalCosto = 0;

    materiasSeleccionadas.forEach(materia => {
        const materiaNombre = materia.value;
        const materiaInfo = obtenerInfoMateria(materiaNombre);

        if (materiaInfo) {
            totalCosto += materiaInfo.costo;
            const materiaHTML = `
                <p>${materiaNombre} <br>  Profesor: ${materiaInfo.profesor} <br> Costo: $${materiaInfo.costo}</p>
            `;
            resumenMatricula.innerHTML += materiaHTML;
        }
    });
    //Costos de pago
    const costoMatricula = 40000;
    const costoTotal = totalCosto + costoMatricula;

    const mensajeMatricula = document.getElementById('mensajeMatricula');
    mensajeMatricula.style.display = 'block';
    const totalHTML = `
        <p><strong>Total a pagar:</strong> $${costoTotal}</p>
        <p><strong>Costo de matrícula:</strong> $${costoMatricula}</p>
    `;
    resumenMatricula.innerHTML += totalHTML;

    const irAPagoBtn = document.getElementById('irAPagoBtn');
    irAPagoBtn.style.display = 'block';
}

//Boton ir a pago
function irAPago() {
    const carreraSeleccionada = document.getElementById('selectCarreras').value;
    const materiasSeleccionadas = Array.from(document.querySelectorAll('input[name="materia"]:checked')).map(input => input.value);

    if (materiasSeleccionadas.length === 0) {
        alert('Debes seleccionar al menos una materia.');
        return;
    }

    const urlParams = new URLSearchParams();
    urlParams.append('carrera', carreraSeleccionada);
    materiasSeleccionadas.forEach(materia => {
        urlParams.append('materia', materia);
    });

    window.location.href = `pago.html?${urlParams.toString()}`;
}

//funcion de traer la información de la matricula para el resumen de matrícula
function obtenerResumenMatricula() {
    const urlParams = new URLSearchParams(window.location.search);
    const carreraSeleccionada = urlParams.get('carrera');
    const materiasSeleccionadas = urlParams.getAll('materia');

    const materiasContainer = document.getElementById('materiasMatriculadas');
    const totalContainer = document.getElementById('totalAPagar');
    const carreraContainer = document.getElementById('carreraUniversitaria');

    let totalCosto = 0;

    carreraContainer.innerHTML = `<p><strong>Carrera Universitaria:</strong> ${carreraSeleccionada}</p>`;

    materiasContainer.innerHTML = '';
    materiasSeleccionadas.forEach(materiaNombre => {
        const materiaInfo = obtenerInfoMateria(materiaNombre);
        if (materiaInfo) {
            totalCosto += materiaInfo.costo;
            const materiaHTML = `<p>${materiaNombre} <br> Profesor: ${materiaInfo.profesor} <br> Costo: $${materiaInfo.costo}</p>`;
            materiasContainer.innerHTML += materiaHTML;
        }
    });

    const costoMatricula = 40000;
    const costoTotal = totalCosto + costoMatricula;

    totalContainer.innerHTML = `
        <p><strong>Total a pagar:</strong> $${costoTotal}</p>
        <p><strong>Costo de matrícula:</strong> $${costoMatricula}</p>
    `;
}

//funcion de las opciones de metodos de pago
function realizarPago() {
    const opcionSeleccionada = document.getElementById('selectOpcionesPago').value;
    const totalAPagar = document.getElementById('totalAPagar').textContent.trim();

    let mensajePago = `Se seleccionó la opción de pago: ${opcionSeleccionada}\n${totalAPagar}`;

    if (opcionSeleccionada === 'Letra de Cambio') {
        const lapsosPago = 3;
        const costoMatricula = 40000;
        const costoTotal = parseFloat(totalAPagar.replace('$', '').replace(',', ''));
        const costoLapso = Math.ceil(costoTotal / lapsosPago);

        mensajePago += `\nPago dividido en ${lapsosPago} lapsos de: $${costoLapso} cada uno`;

        const lapseoInfo = document.getElementById('lapseoInfo');
        lapseoInfo.textContent = `Pago dividido en ${lapsosPago} lapsos de: $${costoLapso} cada uno`;
        const lapseoPago = document.getElementById('lapseoPago');
        lapseoPago.style.display = 'block';
    }

    alert(mensajePago);

    const fechaMatricula = new Date().toLocaleDateString('es-ES');
    const mensajeFinal = `
        Nombre de la Universidad: Universidad Politécnica Internacional
        Día de la matrícula: ${fechaMatricula}
        Monto pagado: ${totalAPagar}
        ¡Gracias por tu pago!
    `;

    alert(mensajeFinal);

    window.location.href = 'inicio.html';
}

function obtenerInfoMateria(nombreMateria) {
    for (let carrera in materiasPorCarrera) {
        const materias = materiasPorCarrera[carrera];
        const materiaEncontrada = materias.find(materia => materia.nombre === nombreMateria);
        if (materiaEncontrada) {
            return materiaEncontrada;
        }
    }
    return null;
}

document.addEventListener('DOMContentLoaded', function() {
    obtenerResumenMatricula();
});


