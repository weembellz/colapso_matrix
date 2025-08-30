
# Módulo principal de la aplicación
def create_app():
    from web.app import app
    return app

def get_routes():
    return ['/', '/status', '/api/health']

