view: stock_prices {
  sql_table_name: finance.stock_prices ;;

  dimension: adj_close {
    type: number
    sql: ${TABLE}.adj_close ;;
  }

  dimension: adj_high {
    type: number
    sql: ${TABLE}.adj_high ;;
  }

  dimension: adj_low {
    type: number
    sql: ${TABLE}.adj_low ;;
  }

  dimension: adj_open {
    type: number
    sql: ${TABLE}.adj_open ;;
  }

  dimension: adj_volume {
    type: number
    sql: ${TABLE}.adj_volume ;;
  }

  dimension: close {
    type: number
    sql: ${TABLE}.close ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: ex_dividend {
    type: number
    sql: ${TABLE}.ex_dividend ;;
  }

  dimension: high {
    type: number
    sql: ${TABLE}.high ;;
  }

  dimension: low {
    type: number
    sql: ${TABLE}.low ;;
  }

  dimension: open {
    type: number
    sql: ${TABLE}.open ;;
  }

  dimension: split_ratio {
    type: number
    sql: ${TABLE}.split_ratio ;;
  }

  dimension: ticker {
    type: string
    sql: ${TABLE}.ticker ;;
  }

  dimension: volume {
    type: number
    sql: ${TABLE}.volume ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
