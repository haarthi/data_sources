view: acquisitions {
  sql_table_name: crunchbase.acquisitions ;;

  dimension: acquisition_status {
    type: string
    sql: ${TABLE}.acquisition_status ;;
  }

  dimension: acquisition_type {
    type: string
    sql: ${TABLE}.acquisition_type ;;
  }

  dimension: announced_on {
    type: string
    sql: ${TABLE}.announced_on ;;
  }

  dimension: announced_on_trust_code {
    type: string
    sql: ${TABLE}.announced_on_trust_code ;;
  }

  dimension: api_path {
    type: string
    sql: ${TABLE}.api_path ;;
  }

  dimension: completed_on {
    type: string
    sql: ${TABLE}.completed_on ;;
  }

  dimension: completed_on_trust_code {
    type: string
    sql: ${TABLE}.completed_on_trust_code ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: disposition_of_acquired {
    type: string
    sql: ${TABLE}.disposition_of_acquired ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: price_currency_code {
    type: string
    sql: ${TABLE}.price_currency_code ;;
  }

  dimension: price_usd {
    type: number
    sql: ${TABLE}.price_usd ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.uuid ;;
  }

  dimension: web_path {
    type: string
    sql: ${TABLE}.web_path ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
