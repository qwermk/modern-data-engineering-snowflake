# Configura una nueva conexión a Snowflake (cuenta, usuario, contraseña, rol, warehouse, etc.)
snow connection add
# Enter connection name: modern_data_engineering_snowflake
# ....

# Verifica que la conexión a Snowflake funciona correctamente
snow connection test

# Go to the folder where the sample_orders.csv file is located and run the following commands:

# Sube el archivo CSV con datos de órdenes al stage interno de Snowflake
snow stage copy sample_orders.csv "@snowflake_cli_stage"

# Lista los archivos que se encuentran actualmente en el stage para confirmar la subida
snow stage list-files "@snowflake_cli_stage"

# Sube el script SQL de carga al stage para poder ejecutarlo remotamente
snow stage copy load_from_cli_stage.sql "@snowflake_cli_stage"

# Ejecuta el script SQL en Snowflake, que crea la tabla y carga los datos del CSV con COPY INTO
snow stage execute "@snowflake_cli_stage/load_from_cli_stage.sql"
