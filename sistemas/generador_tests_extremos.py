import random, time, json
from cerebro.analizador import AnalizadorProfundidad

class TestVertigo:
    def __init__(self):
        self.analizador = AnalizadorProfundidad()

    def generar_estimulo(self):
        # patrones visuales abstractos o secuencias imposibles
        formas = ["espiral", "fractales", "lineas caóticas", "distorsión temporal"]
        colores = ["gris", "negro", "blanco sucio", "rojo profundo"]
        return {"forma": random.choice(formas), "color": random.choice(colores)}

    def evaluar_respuesta(self, interaccion):
        # analizar reacción emocional, temporal y cognitiva
        puntaje = self.analizador.evaluar_estado(interaccion)
        return {"vertigo_score": puntaje, "interpretacion": "Profundidad extrema"}

    def iniciar_test(self, interacciones_usuario):
        resultados = []
        for interaccion in interacciones_usuario:
            stim = self.generar_estimulo()
            analisis = self.evaluar_respuesta(interaccion)
            resultados.append({"estimulo": stim, "analisis": analisis})
        return resultados

# Ejemplo de uso brutal
if __name__ == "__main__":
    tv = TestVertigo()
    interacciones = ["usuario mira pantalla", "usuario reacciona sonido", "usuario mueve raton caoticamente"]
    print(json.dumps(tv.iniciar_test(interacciones), indent=2))
