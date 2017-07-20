# explore: inflation_yoy {}
# view: inflation_yoy {
#   derived_table: {
#     sql:
#       select dataset_code, date, value as start_inflation
#       , lag(value) OVER( order by date asc) as last_year_start_inflation
#       from
#       (
#         select *,
#         rank() over (partition by EXTRACT(YEAR FROM CAST(date  AS TIMESTAMP)) ORDER BY date asc) as row_number
#         from `lookerdata.finance.FRED_data`
#         where dataset_code = 'CPIAUCSL'
#       )
#       where row_number = 1
#       order by date asc
#     ;;
#   }
#
#   dimension: dataset_code {
#     type: string
#     sql: ${TABLE}.dataset_code ;;
#   }
#
#   dimension_group: date {
#     type: time
#     timeframes: [date, month, quarter, year]
#     sql: ${TABLE}.date ;;
#   }
#
#   dimension: start_inflation {
#     type: number
#     sql: ${TABLE}.start_inflation ;;
#   }
#
#   dimension: last_year_start_inflation {
#     type: number
#     sql: ${TABLE}.last_year_start_inflation ;;
#   }
#
#   dimension: inflation_rate_yoy {
#     type: number
#     value_format_name: percent_2
#     sql: ((${start_inflation}-${last_year_start_inflation})/${last_year_start_inflation}) ;;
#   }
#
#   set: detail {
#     fields: [dataset_code, date, start_inflation, last_year_start_inflation]
#   }
# }
