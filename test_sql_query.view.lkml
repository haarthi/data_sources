explore: sql_runner_query {}

view: sql_runner_query {
  derived_table: {
    sql: SELECT count(*) as my_count FROM `lookerdata.finance.FED_data`
      union all
      SELECT count(*) as my_count FROM `bigquery-public-data.baseball.schedules`

      LIMIT 100
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: my_count {
    type: number
    sql: ${TABLE}.my_count ;;
  }

  set: detail {
    fields: [my_count]
  }
}
