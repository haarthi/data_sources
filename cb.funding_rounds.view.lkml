view: funding_rounds {
  sql_table_name: crunchbase.funding_rounds ;;

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

  dimension: closed_on {
    type: string
    sql: ${TABLE}.closed_on ;;
  }

  dimension: closed_on_trust_code {
    type: string
    sql: ${TABLE}.closed_on_trust_code ;;
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

  dimension: funding_type {
    type: string
    sql: ${TABLE}.funding_type ;;
  }

  dimension: money_raised {
    type: number
    sql: ${TABLE}.money_raised ;;
  }

  dimension: money_raised_currency_code {
    type: string
    sql: ${TABLE}.money_raised_currency_code ;;
  }

  dimension: money_raised_usd {
    type: number
    sql: ${TABLE}.money_raised_usd ;;
  }

  dimension: permalink {
    type: string
    sql: ${TABLE}.permalink ;;
  }

  dimension: series {
    type: string
    sql: ${TABLE}.series ;;
  }

  dimension: series_qualifier {
    type: string
    sql: ${TABLE}.series_qualifier ;;
  }

  dimension: target_money_raised {
    type: string
    sql: ${TABLE}.target_money_raised ;;
  }

  dimension: target_money_raised_currency_code {
    type: string
    sql: ${TABLE}.target_money_raised_currency_code ;;
  }

  dimension: target_money_raised_usd {
    type: number
    sql: ${TABLE}.target_money_raised_usd ;;
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
