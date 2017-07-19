view: indicators_metadata {
  sql_table_name: finance.FRED_metadata ;;

  dimension: dataset_code {
    primary_key: yes
    hidden: yes
    type: string
    sql: REGEXP_REPLACE(${TABLE}.dataset_code, 'FRED/', '') ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
}
