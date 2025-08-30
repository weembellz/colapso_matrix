# Agente IA - Agente inteligente base
class AgenteIA:
    def __init__(self, nombre="neuro_agente"):
        self.nombre = nombre
    
    def procesar(self, input_data):
        return {"procesado": True, "agente": self.nombre, "input": input_data}
