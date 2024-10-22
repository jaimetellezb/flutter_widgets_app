import os
import re
import argparse
import subprocess

# Colores para la salida en la consola
RED = '\033[0;31m'
GREEN = '\033[0;32m'
BLUE = '\033[0;34m'
YELLOW = '\033[1;33m'
CYAN = '\033[1;36m'
NC = '\033[0m'  # Sin color

def snake_to_kebab(snake_str):
    """Convertir de snake_case a kebab-case."""
    return snake_str.replace('_', '-')

def snake_to_pascal(snake_str):
    """Convertir de snake_case a PascalCase."""
    components = snake_str.split('_')
    return ''.join(x.title() for x in components)

def snake_to_camel(snake_str):
    """Convertir de snake_case a camelCase."""
    components = snake_str.split('_')
    return components[0] + ''.join(x.title() for x in components[1:])

def insert_before_end(file_path, code_to_insert):
    """Insertar el bloque de código antes de la línea //END en un archivo."""
    with open(file_path, 'r') as file:
        lines = file.readlines()

    with open(file_path, 'w') as file:
        for line in lines:
            if '//END' in line:
                file.write(code_to_insert + '\n')
            file.write(line)

def format_code(file_path):
    """Formatear el código en el archivo usando Black."""
    try:
        subprocess.run(['black', file_path], check=True)
        print(f"{GREEN}El archivo {file_path} ha sido formateado exitosamente.{NC}")
    except subprocess.CalledProcessError:
        print(f"{RED}Error al formatear el archivo {file_path}.{NC}")

def format_all_files_in_directory(directory):
    """Formatear todos los archivos de Python en un directorio usando Black."""
    try:
        subprocess.run(['black', directory], check=True)
        print(f"{GREEN}Todos los archivos en {directory} han sido formateados exitosamente.{NC}")
    except subprocess.CalledProcessError:
        print(f"{RED}Error al formatear los archivos en {directory}.{NC}")

def create_widget(widget_name):
    """Crear el widget y modificar los archivos necesarios."""
    new_name_snake = widget_name
    new_name_kebab = snake_to_kebab(widget_name)
    new_name_pascal = snake_to_pascal(widget_name)
    new_name_camel = snake_to_camel(widget_name)

    print(f"{GREEN}Agregando constante.{NC}")
    print(f"New Widget: {new_name_pascal}")
    print(f"newWidget: {new_name_camel}")

    const_file = "lib/configs/constants/constants.dart"

    # Comprobar si el archivo de constantes existe
    if not os.path.isfile(const_file):
        print(f"Error: El archivo {const_file} no existe.")
        return

    # Crear el bloque de código para constantes
    const_code = f"""
    {new_name_camel}Screen(
        name: '{new_name_kebab}-screen',
        path: '{new_name_kebab}',
        label: '{new_name_pascal}',
    ),
    """

    insert_before_end(const_file, const_code.strip())
    #format_code(const_file)  # Formatear el archivo de constantes

    # Crear la estructura del widget
    print(f"{BLUE}Creando estructura del widget...{NC}")
    file_widget = f"lib/screens/{new_name_snake}_screen.dart"
    
    with open(file_widget, 'w') as f:
        f.write(f"""
import 'package:flutter/material.dart';

/// Clase Screen para widget {new_name_snake}
class {new_name_pascal}Screen extends StatelessWidget {{
  const {new_name_pascal}Screen({{super.key}});

  @override
  Widget build(BuildContext context) {{
    return Scaffold(
      appBar: AppBar(
        title: const Text('{new_name_pascal} Screen'),
      ),
      body: const Placeholder(),
    );
  }}
}}
""")
    
    print(f"El archivo {file_widget} fue creado exitosamente.")
    #format_code(file_widget)  # Formatear el archivo del widget

    # Agregar export en el archivo de pantallas
    file_screens = "lib/screens/screens.dart"

    if os.path.isfile(file_screens):
        print("Agregando export del nuevo widget en el archivo de barril...")
        with open(file_screens, 'a') as f:
            f.write(f"export '{new_name_snake}_screen.dart';\n")
        #format_code(file_screens)  # Formatear el archivo de pantallas
    else:
        print(f"Error: El archivo {file_screens} no existe.")
        return

    # Agregar la ruta en el archivo de rutas
    route_file = "lib/configs/router/app_router.dart"

    if not os.path.isfile(route_file):
        print(f"Error: El archivo {route_file} no existe.")
        return

    route_code = f"""
    GoRoute(
        name: RouteProperties.{new_name_camel}Screen.name,
        path: RouteProperties.{new_name_camel}Screen.path,
        builder: (context, state) => const {new_name_pascal}Screen(),
    ),
    """
    
    insert_before_end(route_file, route_code.strip())
    #format_code(route_file)  # Formatear el archivo de rutas

    # Agregar la categoría en el archivo de categorías
    category_file = "lib/configs/widget_category.dart"

    if os.path.isfile(category_file):
        category_code = f"""
    WidgetCategory(
        title: RouteProperties.{new_name_camel}Screen.label,
        path: RouteProperties.{new_name_camel}Screen.path,
        icon: Icons.refresh_outlined,
    ),
    """
        
        insert_before_end(category_file, category_code.strip())
        #format_code(category_file)  # Formatear el archivo de categorías
    else:
        print(f"Error: El archivo {category_file} no existe.")
        return


if __name__ == "__main__":
    # Configurar el parser de argumentos
    parser = argparse.ArgumentParser(description='Crear un widget en Flutter.')
    parser.add_argument('widget_name', type=str, help='Nombre del widget en formato snake_case')
    args = parser.parse_args()

    widget_name = args.widget_name

    # Validar el nombre del widget
    if re.match(r'^[a-zA-Z0-9_]+$', widget_name):
        create_widget(widget_name)
        
        # Formatear todos los archivos en el directorio lib
        format_all_files_in_directory('lib')
    else:
        print(RED + "Error: El nombre del widget solo puede contener letras, números y guiones bajos, y debe contener al menos un guion bajo." + NC)
