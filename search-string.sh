#!/bin/bash

# Ruta de la carpeta a buscar
carpeta="/Users/rigolizarraga/fortpoint/analytics/dvtl-databricks-notebooks/aks-airflow"

# Palabra a buscar
palabra="tag"

# Utiliza find para obtener una lista de todos los archivos en la carpeta y subcarpetas
archivos=$(find "$carpeta" -type f)

# Recorre la lista de archivos y utiliza grep para buscar la palabra
for archivo in $archivos; do
  if grep -q "$palabra" "$archivo"; then
    echo "La palabra '$palabra' se encuentra en el archivo: $archivo"
  fi
done
