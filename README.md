# Introduction to Modern Data Engineering with Snowflake

Repositorio del curso **[Introduction to Modern Data Engineering with Snowflake](https://www.coursera.org/learn/data-engineering-snowflake/)** de Coursera, donde se recorre el ciclo completo de ingeniería de datos moderna usando Snowflake y el caso de estudio **Tasty Bytes** (red ficticia de food trucks).

## Progreso

| Módulo | Tema | Estado |
|--------|------|--------|
| 1 | Analytics & Streamlit Dashboard | ✅ Completado |
| 2 | Ingesta y Carga de Datos | 🔄 En progreso |
| 3 | Analytics Avanzado (Dynamic Tables, Streams, UDFs) | ⬚ Pendiente |
| 4 | Snowflake Native Apps & Streamlit-in-Snowflake | ⬚ Pendiente |
| 5 | Orquestación y Automatización (Tasks, DAGs) | ⬚ Pendiente |

## Estructura del Proyecto

### Module 1 — Analytics & Streamlit Dashboard
Dashboard interactivo de ventas de Tasty Bytes con Streamlit y Snowpark.
- **`streamlit.py`** — App que visualiza ventas por ciudad (2020–2023) con filtros de fecha y gráficos de línea (Altair).
- **`transformations.sql`** — Consultas de transformación que cruzan datos de salarios anuales (OECD) y CPI mensual (Bureau of Labor Statistics).

### Module 2 — Ingesta y Carga de Datos
Configuración de la infraestructura del data warehouse y carga desde múltiples orígenes.
- **`load_tasty_bytes.sql`** — Crea la base de datos `tasty_bytes` con esquemas (raw_pos, raw_customer, harmonized, analytics), stage externo en S3 y tablas raw.
- **`frostbyte_weathersource.sql`** — Consulta de datos meteorológicos (temperatura, precipitación) de ciudades francesas con promedios móviles de 7 días.
- **`load_from_cli_stage.sql`** — Carga de `sample_orders.csv` desde Snowflake CLI con COPY INTO.
- **`sample_menu.sql`** — Carga de datos de menú desde un stage externo en AWS S3.
- **`sample_orders.csv`** — Dataset de ejemplo con órdenes.

### Module 3 — Analytics Avanzado y Procesamiento en Tiempo Real
Funcionalidades avanzadas de Snowflake aplicadas a ventas en Hamburgo y correlación climática.
- **`hamburg_sales.sql`** — Ventas diarias en Hamburgo (Feb 2022), vistas de clima y anomalías de temperatura/viento.
- **`hamburg_sales_dynamic_table.sql`** — Dynamic Table que agrega ventas diarias por ubicación con refresh automático.
- **`hamburg_sales_expanded.sql`** / **`hamburg_sales_vs_code.sql`** — Variantes extendidas de las consultas de ventas.
- **`hamburg_sales_snowpark.ipynb`** — Notebook Snowpark para análisis interactivo.
- **`orders_header_sproc.sql`** — Stored procedure (Snowpark Python) que procesa datos de streaming y calcula ventas diarias para Hamburgo.
- **`orders_header_stream.sql`** — Stream sobre `order_header` para capturar cambios (INSERT).
- **`udf_temp_length.sql`** — UDFs: `fahrenheit_to_celsius()` e `inch_to_millimeter()`.

### Module 4 — Native Apps & Streamlit-in-Snowflake
Distribución de datos y visualización interactiva como aplicaciones nativas.
- **`snowflake-native-app/`** — Native App completa con setup script, manifest, esquema versionado y UI Streamlit que expone datos meteorológicos a consumidores.
- **`streamlit-in-snowflake/streamlit_weather_hamburg.py`** — Dashboard que correlaciona ventas en Hamburgo con temperatura, precipitación y viento.

### Module 5 — Orquestación y Automatización
Workflows programados y reportes automáticos.
- **`orders_header_task.sql`** — Task ejecutado cada minuto (CRON) que invoca el stored procedure de procesamiento de órdenes.
- **`dag_email_integration.sql`** — DAG con integración de email: genera reporte HTML con las últimas 7 entradas de ventas y lo envía por correo.

## Tech Stack

- **Snowflake** — Data warehouse, Streams, Dynamic Tables, Tasks, Native Apps
- **Snowpark** (Python) — DataFrames, stored procedures, UDFs
- **Streamlit** — Dashboards interactivos
- **SQL** — Transformaciones, COPY INTO, vistas
- **AWS S3** — Stage externo para ingesta

