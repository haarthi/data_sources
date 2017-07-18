view: indicators_metadata {
  sql_table_name: finance.FRED_metadata ;;

  dimension: dataset_code {
    primary_key: yes
    type: string
    sql: REGEXP_REPLACE(${TABLE}.dataset_code, 'FRED/', '') ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
