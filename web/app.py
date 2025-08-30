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
