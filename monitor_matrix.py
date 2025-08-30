#!/usr/bin/env python3
from core.sistemas.monitor_evolucion import MonitorEvolucion
from pathlib import Path
import json
import time
from datetime import datetime

def monitor_loop():
    monitor = MonitorEvolucion()
    print("🔍 Iniciando monitor Matrix Extremo...")
    
    while True:
        stats = monitor.obtener_estadisticas()
        print(f"[{datetime.now().isoformat()}] Monitor activo - Evolución máxima: {stats.get('max_evolucion', 0):.2f}")
        time.sleep(30)

if __name__ == "__main__":
    monitor_loop()
