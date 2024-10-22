#!/bin/bash

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

# Solicitar al usuario que ingrese el nombre del widget
read -p "Ingresa el nombre del widget (debe contener guiones bajos): " widget_name

# Validar que el nombre contenga solo letras, números y guiones bajos
if [[ "$widget_name" =~ ^[a-zA-Z0-9_]+$ ]]; then
    
    echo "Agregando constante."

    # Convertir a new-widget
    new_name_snake=$(echo "$widget_name" | sed 's/_/-/g')
    
    # Convertir a NewWidget (PascalCase)
    new_name_pascal=$(echo "$widget_name" | sed 's/_\([a-z]\)/\U\1/g' | sed 's/^/\U&/')

    # Convertir a newWidget (CamelCase)
    new_name_camel=$(echo "$widget_name" | sed 's/_\([a-z]\)/\U\1/g' | sed 's/^//;s/_//')

    echo "New Widget: ${new_name_pascal}"
    echo "newWidget: $new_name_camel"

    const_file="lib/configs/constants/constants.dart"

    # Comprobar si el archivo de constantes existe
    if [ -f "$const_file" ]; then
    # Crear un archivo temporal con el bloque de código
    temp_file=$(mktemp)

        cat <<EOL >> "$const_file"
    ${new_name_camel}Screen(
        name: '$new_name_snake-screen',
        path: '$new_name_snake',
        label: '$new_name_pascal',
    ),
EOL

    # Insertar el contenido del archivo temporal antes de la línea //END
    sed -i "/\/\/END/i $temp_file" $const_file

    # Eliminar el archivo temporal
    rm "$temp_file"

    else
        echo "Error: El archivo $const_file no existe."
        exit 1
    fi

    # Crear estructura de directorios
    echo -e "${BLUE}Creando estructura del widget...${NC}"

    file_widget="lib/screens/${new_name_snake}_screen.dart"
    touch "$file_widget"

    cat <<EOL > "$file_widget"
// Se crea screen para widget $new_name_snake
import 'package:flutter/material.dart';

class ${new_name_pascal}Screen extends StatelessWidget {
  const ${new_name_pascal}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('${new_name_pascal} Screen'),
      ),
      body: const Placeholder(),
    );
  }
}
EOL

    # Verificar si el archivo fue creado correctamente
    if [ -f "$file_widget" ]; then
        echo "El archivo $file_widget fue creado exitosamente."
    else
        echo "Error al crear el archivo $file_widget."
        exit 1
    fi

    # Ruta del archivo
    file_screens="lib/screens/screens.dart"

    # Comprobar si el archivo de pantallas existe
    if [ -f "$file_screens" ]; then
        echo "Agregando export del nuevo widget en el archivo de barril..."
        echo "export '${new_name_snake}_screen.dart';" >> "$file_screens"
    else
        echo "Error: El archivo $file_screens no existe."
        exit 1
    fi

    route_file="lib/configs/router/app_router.dart"
    

    # Comprobar si el archivo de rutas existe
    if [ -f "$route_file" ]; then
    # Crear un archivo temporal con el bloque de código
    temp_file=$(mktemp)

        cat <<EOL >> "$route_file"
    GoRoute(
        name: RouteProperties.${new_name_camel}Screen.name,
        path: RouteProperties.${new_name_camel}Screen.path,
        builder: (context, state) => const ${new_name_pascal}Screen(),
    ),
EOL

    # Insertar el contenido del archivo temporal antes de la línea //END
    sed -i "/\/\/END/i $temp_file" $route_file

    # Eliminar el archivo temporal
    rm "$temp_file"

    else
        echo "Error: El archivo $route_file no existe."
        exit 1
    fi

    category_file="lib/configs/wigdet_category.dart"
    

    # Comprobar si el archivo de categorías existe
    if [ -f "$category_file" ]; then
    # Crear un archivo temporal con el bloque de código
    temp_file=$(mktemp)

        cat <<EOL >> "$category_file"
    WidgetCategory(
        title: RouteProperties.${new_name_camel}Screen.label,
        path: RouteProperties.${new_name_camel}Screen.path,
        icon: Icons.refresh_outlined,
    ),
EOL

    # Insertar el contenido del archivo temporal antes de la línea //END
    sed -i "/\/\/END/i $temp_file" $category_file

    # Eliminar el archivo temporal
    rm "$temp_file"

    else
        echo "Error: El archivo $category_file no existe."
        exit 1
    fi

else
    echo "Error: El nombre del widget solo puede contener letras, números y guiones bajos, y debe contener al menos un guion bajo."
fi
