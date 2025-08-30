import numpy as np
import torch
import random
from datetime import datetime

class GeneradorTestsNeuronales:
    def __init__(self):
        self.patrones_mentales = {
            'espejo': ['reflexión', 'auto-conocimiento', 'sombra'],
            'verdad': ['transparencia', 'crudeza', 'autenticidad'],
            'voz': ['tono', 'timbre', 'frecuencia_emocional']
        }
        
    def generar_test_usuario(self, usuario_id):
        """Genera test neuronal único para cada usuario"""
        test_id = f"test_{usuario_id}_{datetime.now().timestamp()}"
        
        return {
            'id': test_id,
            'patron': random.choice(list(self.patrones_mentales.keys())),
            'preguntas': self._generar_preguntas_radicales(),
            'timestamp': datetime.now().isoformat(),
            'estado': 'generado'
        }
    
    def _generar_preguntas_radicales(self):
        """Preguntas que destapan la verdad sin filtros"""
        preguntas = [
            "¿Qué es lo que más te aterra mostrar al mundo?",
            "Describe tu sombra interior sin edición",
            "¿Qué mentira te repites cada día?",
            "Si tu voz interior tuviera sonido, ¿cómo sonaría?",
            "¿Qué destruirías para reconstruirte auténticamente?"
        ]
        return random.sample(preguntas, 3)
    
    def analizar_respuestas(self, respuestas_usuario):
        """Analiza respuestas para crear entidad mutante"""
        analisis = {
            'nivel_verdad': np.random.uniform(0.7, 0.95),
            'patrones_detectados': [],
            'intensidad_emocional': np.random.uniform(0.5, 0.9)
        }
        
        # Análisis de texto brutal
        for respuesta in respuestas_usuario:
            if any(palabra in respuesta.lower() for palabra in ['miedo', 'terror', 'oculto']):
                analisis['patrones_detectados'].append('sombra_profunda')
            if any(palabra in respuesta.lower() for palabra in ['verdad', 'auténtico', 'real']):
                analisis['patrones_detectados'].append('busqueda_verdad')
        
        return analisis

# Instancia global del generador
generador_tests = GeneradorTestsNeuronales()
