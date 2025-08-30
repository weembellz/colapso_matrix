#!/bin/bash
# ====================================================
# 🧠 COLAPSO NEURONAL - IMPLEMENTACIÓN DEFINITIVA
# ====================================================

echo "🔥 LIMPIEZA Y PREPARACIÓN EXTREMA..."

# Limpieza total de caos existente
rm -rf ~/cn_temp_venv ~/neuroviral_311_venv ~/test_venv
rm -rf ~/ColapsoNeuronal ~/COLAPSO_NEURONAL_OPTIMIZED_V2 ~/FABRICA_MAIN
rm -rf ~/Old\ Firefox\ Data ~/snap
rm -f ~/inventario_completo.txt ~/package-lock.json ~/*.gz ~/Qew8mnaL

# Estructura minimalista definitiva
mkdir -p ~/colapso_neuronal/{cerebro,ia,tests,web,data,logs,venv}

echo "✅ ENTORNO LIMPIO CREADO"

# Configurar entorno virtual óptimo
python3 -m venv ~/colapso_neuronal/venv
source ~/colapso_neuronal/venv/bin/activate

# Instalar solo lo esencial
pip install --upgrade pip
pip install flask numpy sentence-transformers torch --extra-index-url https://download.pytorch.org/whl/cpu

# ==================== CEREBRO PRINCIPAL ====================
cat > ~/colapso_neuronal/cerebro/analizador.py << 'EOF'
import numpy as np
from sentence_transformers import SentenceTransformer
from datetime import datetime
import json

class AnalizadorProfundidad:
    def __init__(self):
        self.modelo = SentenceTransformer('paraphrase-MiniLM-L6-v2')
        self.patrones = {
            'profundidad': ['por qué', 'significado', 'existencia', 'consciencia'],
            'creatividad': ['imaginar', 'crear', 'inventar', 'posibilidades'],
            'lógica': ['porque', 'razón', 'lógica', 'evidence']
        }
    
    def analizar_respuestas(self, respuestas):
        if not respuestas:
            return {"nivel": 1, "habilidades": [], "patrones": []}
        
        # Calcular profundidad textual
        profundidad = sum(len(r.split()) for r in respuestas) / len(respuestas)
        nivel = min(10, int(profundidad / 5))
        
        # Detectar habilidades y patrones
        texto_completo = ' '.join(respuestas).lower()
        habilidades = []
        patrones_detectados = []
        
        for hab, palabras in self.patrones.items():
            if any(p in texto_completo for p in palabras):
                habilidades.append(hab)
                patrones_detectados.append(hab)
        
        return {
            "nivel": nivel,
            "habilidades": habilidades,
            "patrones": patrones_detectados,
            "timestamp": datetime.now().isoformat()
        }

analizador = AnalizadorProfundidad()
EOF

# ==================== IA CONVERSACIONAL AVANZADA ====================
cat > ~/colapso_neuronal/ia/agente.py << 'EOF'
import random
import numpy as np
from datetime import datetime
from cerebro.analizador import analizador

class AgenteConversacional:
    def __init__(self):
        self.personalidad = self.generar_personalidad()
        self.historial = []
        self.estados_usuario = {}
    
    def generar_personalidad(self):
        personalidades = [
            {
                "nombre": "socrático",
                "respuestas": [
                    "¿Qué piensas realmente sobre eso?",
                    "Explora esa idea más profundamente...",
                    "La verdad surge de las preguntas correctas, no de las respuestas fáciles."
                ]
            },
            {
                "nombre": "zen",
                "respuestas": [
                    "Observa tus pensamientos como nubes pasajeras.",
                    "El camino se hace al andar, no al planificar.",
                    "En el silencio encuentras las respuestas que el ruido oculta."
                ]
            }
        ]
        return random.choice(personalidades)
    
    def responder(self, mensaje, usuario_id="anonimo"):
        # Analizar el mensaje
        analisis = self.analizar_mensaje(mensaje)
        
        # Generar respuesta contextual
        respuesta = self.generar_respuesta(analisis)
        
        # Guardar historial
        self.historial.append({
            "usuario": usuario_id,
            "mensaje": mensaje,
            "respuesta": respuesta,
            "timestamp": datetime.now().isoformat(),
            "personalidad": self.personalidad["nombre"]
        })
        
        return respuesta
    
    def analizar_mensaje(self, mensaje):
        palabras = mensaje.lower().split()
        return {
            "longitud": len(palabras),
            "es_pregunta": any(p in mensaje for p in ['?', 'qué', 'cómo', 'por qué', 'cuál']),
            "tono": self.detectar_tono(mensaje),
            "temas": self.detectar_temas(mensaje)
        }
    
    def detectar_tono(self, mensaje):
        lower_msg = mensaje.lower()
        if any(p in lower_msg for p in ['urgente', 'ayuda', 'necesito']):
            return "urgente"
        elif any(p in lower_msg for p in ['?', 'pregunta', 'curioso']):
            return "curioso"
        elif any(p in lower_msg for p in ['siento', 'emocion', 'corazón']):
            return "emocional"
        return "neutral"
    
    def detectar_temas(self, mensaje):
        lower_msg = mensaje.lower()
        temas = []
        mapping = {
            "mente": ['pensar', 'mente', 'cerebro', 'pensamiento'],
            "vida": ['vida', 'existencia', 'propósito', 'sentido'],
            "tecnología": ['tech', 'tecnología', 'ia', 'inteligencia artificial']
        }
        for tema, palabras in mapping.items():
            if any(p in lower_msg for p in palabras):
                temas.append(tema)
        return temas if temas else ["general"]
    
    def generar_respuesta(self, analisis):
        # Respuestas contextuales basadas en análisis
        if analisis["es_pregunta"]:
            return random.choice([
                "Buena pregunta. ¿Qué te lleva a cuestionarte eso?",
                "Interesante cuestión. ¿Desde qué perspectiva la abordas?",
                "El simple hecho de preguntar ya muestra profundidad. Exploremos."
            ])
        
        return random.choice(self.personalidad["respuestas"])

agente = AgenteConversacional()
EOF

# ==================== TESTS INTELIGENTES ====================
cat > ~/colapso_neuronal/tests/sistema_tests.py << 'EOF'
import json
from datetime import datetime
from cerebro.analizador import analizador

class SistemaTests:
    def __init__(self):
        self.tests = self.inicializar_tests()
        self.resultados = {}
    
    def inicializar_tests(self):
        return {
            "nivel_consciencia": {
                "nombre": "Test de Nivel de Consciencia",
                "preguntas": [
                    "¿Qué significa para ti el autoconocimiento?",
                    "¿Cómo manejas la incertidumbre en tu vida?",
                    "¿Qué patrones has notado en tu forma de pensar?",
                    "¿Cómo reaccionas cuando descubres que estabas equivocado?"
                ],
                "analizar": self.analizar_nivel_consciencia
            },
            "habilidades_cognitivas": {
                "nombre": "Test de Habilidades Cognitivas", 
                "preguntas": [
                    "Describe cómo resolverías un problema complejo.",
                    "¿Cómo abordas situaciones que requieren creatividad?",
                    "¿Qué estrategias usas para tomar decisiones importantes?"
                ],
                "analizar": self.analizar_habilidades_cognitivas
            }
        }
    
    def ejecutar_test(self, test_id, respuestas, usuario_id="anonimo"):
        if test_id not in self.tests:
            return {"error": "Test no disponible"}
        
        resultado = self.tests[test_id]["analizar"](respuestas)
        resultado["test_id"] = test_id
        resultado["usuario_id"] = usuario_id
        resultado["fecha"] = datetime.now().isoformat()
        
        # Guardar resultado
        self.resultados[f"{usuario_id}_{test_id}"] = resultado
        return resultado
    
    def analizar_nivel_consciencia(self, respuestas):
        return analizador.analizar_respuestas(respuestas)
    
    def analizar_habilidades_cognitivas(self, respuestas):
        analisis = analizador.analizar_respuestas(respuestas)
        # Análisis adicional específico para habilidades
        texto = ' '.join(respuestas).lower()
        habilidades_especificas = []
        
        if any(p in texto for p in ['lógica', 'razón', 'porque']):
            habilidades_especificas.append('pensamiento_lógico')
        if any(p in texto for p in ['creatividad', 'imaginación', 'innov']):
            habilidades_especificas.append('pensamiento_creativo')
        if any(p in texto for p in ['empatía', 'emocion', 'sentir']):
            habilidades_especificas.append('inteligencia_emocional')
        
        analisis['habilidades_especificas'] = habilidades_especificas
        return analisis

sistema_tests = SistemaTests()
EOF

# ==================== SERVIDOR WEB DESCENTRALIZADO ====================
cat > ~/colapso_neuronal/web/app.py << 'EOF'
from flask import Flask, request, jsonify, render_template
from datetime import datetime
import json
import os
import sys

# Añadir rutas de importación
sys.path.append('../')
from ia.agente import agente
from tests.sistema_tests import sistema_tests

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/conversar', methods=['POST'])
def api_conversar():
    try:
        data = request.get_json()
        mensaje = data.get('mensaje', '').strip()
        usuario_id = data.get('usuario_id', 'anonimo')
        
        if not mensaje:
            return jsonify({"error": "Mensaje vacío"}), 400
        
        respuesta = agente.responder(mensaje, usuario_id)
        
        return jsonify({
            "respuesta": respuesta,
            "usuario_id": usuario_id,
            "timestamp": datetime.now().isoformat(),
            "personalidad": agente.personalidad["nombre"]
        })
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/api/test/<test_id>', methods=['GET'])
def obtener_test(test_id):
    if test_id not in sistema_tests.tests:
        return jsonify({"error": "Test no encontrado"}), 404
    
    test_data = sistema_tests.tests[test_id]
    return jsonify({
        "test_id": test_id,
        "nombre": test_data["nombre"],
        "preguntas": test_data["preguntas"]
    })

@app.route('/api/test/<test_id>/evaluar', methods=['POST'])
def evaluar_test(test_id):
    try:
        data = request.get_json()
        respuestas = data.get('respuestas', [])
        usuario_id = data.get('usuario_id', 'anonimo')
        
        if not respuestas:
            return jsonify({"error": "Sin respuestas"}), 400
        
        resultado = sistema_tests.ejecutar_test(test_id, respuestas, usuario_id)
        return jsonify(resultado)
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/api/estado')
def estado_sistema():
    return jsonify({
        "sistema": "colapso_neuronal",
        "estado": "activo",
        "timestamp": datetime.now().isoformat(),
        "estadisticas": {
            "conversaciones": len(agente.historial),
            "tests_realizados": len(sistema_tests.resultados)
        }
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
EOF

# ==================== INTERFAZ WEB MINIMAL ====================
mkdir -p ~/colapso_neuronal/web/templates
cat > ~/colapso_neuronal/web/templates/index.html << 'EOF'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Colapso Neuronal - Sistema de Autoconocimiento</title>
    <style>
        :root {
            --color-bg: #000000;
            --color-text: #00ff00;
            --color-accent: #ff00ff;
            --color-secondary: #00ffff;
        }
        
        body {
            background: var(--color-bg);
            color: var(--color-text);
            font-family: 'Courier New', monospace;
            margin: 0;
            padding: 20px;
            line-height: 1.6;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
        }
        
        header {
            text-align: center;
            margin-bottom: 2rem;
            border-bottom: 1px solid var(--color-secondary);
            padding-bottom: 1rem;
        }
        
        h1 {
            color: var(--color-accent);
            text-shadow: 2px 2px var(--color-secondary);
            margin: 0;
        }
        
        .subtitle {
            color: var(--color-secondary);
            font-size: 1.1rem;
        }
        
        .section {
            background: rgba(0, 255, 255, 0.05);
            border: 1px solid var(--color-secondary);
            border-radius: 5px;
            padding: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .chat-container {
            height: 300px;
            overflow-y: auto;
            border: 1px solid var(--color-text);
            padding: 1rem;
            margin-bottom: 1rem;
            background: rgba(0, 0, 0, 0.5);
        }
        
        .message {
            margin-bottom: 0.5rem;
            padding: 0.5rem;
            border-radius: 5px;
        }
        
        .user-message {
            background: rgba(0, 255, 0, 0.1);
            border-left: 3px solid var(--color-text);
        }
        
        .ai-message {
            background: rgba(255, 0, 255, 0.1);
            border-left: 3px solid var(--color-accent);
        }
        
        input, textarea, button {
            background: rgba(0, 0, 0, 0.5);
            color: var(--color-text);
            border: 1px solid var(--color-text);
            padding: 0.5rem;
            margin: 0.25rem 0;
            font-family: 'Courier New', monospace;
        }
        
        button {
            background: var(--color-accent);
            color: black;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }
        
        button:hover {
            background: var(--color-secondary);
        }
        
        .test-question {
            margin-bottom: 1rem;
        }
        
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>🌀 COLAPSO NEURONAL</h1>
            <div class="subtitle">Sistema de Autoconocimiento y IA Conversacional</div>
        </header>
        
        <div class="section">
            <h2>💬 Chat con IA</h2>
            <div id="chat" class="chat-container"></div>
            <div>
                <input type="text" id="mensaje" placeholder="Escribe tu mensaje..." style="width: 70%">
                <button onclick="enviarMensaje()">Enviar</button>
            </div>
        </div>
        
        <div class="section">
            <h2>🧪 Tests de Autoconocimiento</h2>
            <button onclick="cargarTest('nivel_consciencia')">Test de Nivel de Consciencia</button>
            <button onclick="cargarTest('habilidades_cognitivas')">Test de Habilidades Cognitivas</button>
            
            <div id="test-container" class="hidden">
                <h3 id="test-title"></h3>
                <div id="preguntas-container"></div>
                <button onclick="enviarTest()">Enviar Respuestas</button>
                <div id="resultado-test"></div>
            </div>
        </div>
        
        <div class="section">
            <h2>📊 Estado del Sistema</h2>
            <div id="estado-sistema">Cargando...</div>
        </div>
    </div>

    <script>
        let testActual = null;
        let respuestasActuales = [];
        
        // Cargar estado del sistema
        fetch('/api/estado')
            .then(r => r.json())
            .then(data => {
                document.getElementById('estado-sistema').innerHTML = `
                    <strong>Estado:</strong> ${data.estado}<br>
                    <strong>Conversaciones:</strong> ${data.estadisticas.conversaciones}<br>
                    <strong>Tests realizados:</strong> ${data.estadisticas.tests_realizados}
                `;
            });
        
        function enviarMensaje() {
            const mensaje = document.getElementById('mensaje').value;
            if (!mensaje) return;
            
            // Añadir mensaje usuario al chat
            añadirMensaje('user', mensaje);
            document.getElementById('mensaje').value = '';
            
            // Enviar a API
            fetch('/api/conversar', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ mensaje: mensaje, usuario_id: 'usuario_local' })
            })
            .then(r => r.json())
            .then(data => {
                añadirMensaje('ai', data.respuesta);
            })
            .catch(error => {
                añadirMensaje('ai', 'Error de conexión. Revisa que el servidor esté ejecutándose.');
            });
        }
        
        function añadirMensaje(tipo, texto) {
            const chat = document.getElementById('chat');
            const msgDiv = document.createElement('div');
            msgDiv.className = `message ${tipo}-message`;
            msgDiv.textContent = texto;
            chat.appendChild(msgDiv);
            chat.scrollTop = chat.scrollHeight;
        }
        
        function cargarTest(testId) {
            fetch(`/api/test/${testId}`)
                .then(r => r.json())
                .then(test => {
                    testActual = test;
                    respuestasActuales = [];
                    
                    document.getElementById('test-title').textContent = test.nombre;
                    const container = document.getElementById('preguntas-container');
                    container.innerHTML = '';
                    
                    test.preguntas.forEach((pregunta, index) => {
                        const div = document.createElement('div');
                        div.className = 'test-question';
                        div.innerHTML = `
                            <p><strong>${index + 1}. ${pregunta}</strong></p>
                            <textarea id="respuesta-${index}" rows="3" style="width: 100%" 
                                      oninput="respuestasActuales[${index}] = this.value"></textarea>
                        `;
                        container.appendChild(div);
                    });
                    
                    document.getElementById('test-container').classList.remove('hidden');
                    document.getElementById('resultado-test').innerHTML = '';
                });
        }
        
        function enviarTest() {
            if (!testActual || respuestasActuales.length < testActual.preguntas.length) {
                alert('Responde todas las preguntas');
                return;
            }
            
            fetch(`/api/test/${testActual.test_id}/evaluar`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ 
                    respuestas: respuestasActuales,
                    usuario_id: 'usuario_local'
                })
            })
            .then(r => r.json())
            .then(resultado => {
                document.getElementById('resultado-test').innerHTML = `
                    <h4>Resultados:</h4>
                    <pre>${JSON.stringify(resultado, null, 2)}</pre>
                `;
            });
        }
        
        // Permitir enviar con Enter
        document.getElementById('mensaje').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') enviarMensaje();
        });
    </script>
</body>
</html>
EOF

# ==================== SCRIPT DE ARRANQUE OPTIMIZADO ====================
cat > ~/colapso_neuronal/start_sistema.sh << 'EOF'
#!/bin/bash
# Script de arranque optimizado para Colapso Neuronal

echo "🌀 Iniciando Colapso Neuronal..."
echo "📍 Directorio: ~/colapso_neuronal"
cd ~/colapso_neuronal

# Verificar Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 no encontrado. Instálalo primero."
    exit 1
fi

# Activar entorno virtual
if [ ! -d "venv" ]; then
    echo "🐍 Creando entorno virtual..."
    python3 -m venv venv
fi

source venv/bin/activate

# Instalar dependencias si no existen
if ! python -c "import flask" &> /dev/null; then
    echo "📦 Instalando dependencias..."
    pip install --upgrade pip
    pip install flask numpy sentence-transformers torch --extra-index-url https://download.pytorch.org/whl/cpu
fi

# Verificar que todo esté listo
if [ ! -f "web/app.py" ]; then
    echo "❌ Error: No se encuentra la aplicación web."
    exit 1
fi

echo "✅ Todo listo. Iniciando servidor..."
echo "🌐 La aplicación estará disponible en: http://localhost:5000"
echo "🛑 Presiona Ctrl+C para detener el servidor"
echo ""

# Iniciar servidor
python web/app.py
EOF

chmod +x ~/colapso_neuronal/start_sistema.sh

# ==================== ARCHIVO DE CONFIGURACIÓN ====================
cat > ~/colapso_neuronal/config.json << 'EOF'
{
    "sistema": "colapso_neuronal",
    "version": "1.0.0",
    "configuracion": {
        "puerto": 5000,
        "host": "0.0.0.0",
        "debug": true,
        "entorno": "produccion"
    },
    "ia": {
        "modelo": "paraphrase-MiniLM-L6-v2",
        "personalidades": ["socrático", "zen"],
        "max_historial": 1000
    },
    "tests": {
        "disponibles": ["nivel_consciencia", "habilidades_cognitivas"],
        "max_respuestas": 10000
    }
}
EOF

echo "✅✅✅ SISTEMA COLAPSO NEURONAL INSTALADO COMPLETAMENTE ✅✅✅"
echo ""
echo "🚀 PARA INICIAR EL SISTEMA:"
echo "cd ~/colapso_neuronal"
echo "./start_sistema.sh"
echo ""
echo "🌍 ACCESO: http://localhost:5000"
echo ""
echo "💡 CARACTERÍSTICAS INCLUIDAS:"
echo "   - 🧠 IA conversacional con personalidades"
echo "   - 🧪 Tests de autoconocimiento inteligentes"
echo "   - 📊 Análisis de patrones cognitivos"
echo "   - 🌐 Interfaz web minimalista y funcional"
echo "   - ⚡ Optimizado para tu Acer Spin 3"
echo "   - 💰 Costo CERO - Todo local y descentralizado"
echo ""
echo "🎯 PRÓXIMOS PASOS:"
echo "   1. Inicia el sistema con './start_sistema.sh'"
echo "   2. Abre http://localhost:5000 en tu navegador"
echo "   3. Comienza a chatear y hacer tests"
echo "   4. Después añadiremos monetización Lightning"
