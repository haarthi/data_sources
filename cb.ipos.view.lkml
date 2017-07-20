view: ipos {
  sql_table_name: crunchbase.ipos ;;

  dimension: api_path {
    type: string
    sql: ${TABLE}.api_path ;;
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

  dimension: opening_share_price {
    type: number
    sql: ${TABLE}.opening_share_price ;;
  }

  dimension: opening_share_price_currency_code {
    type: string
    sql: ${TABLE}.opening_share_price_currency_code ;;
  }

  dimension: opening_share_price_usd {
    type: number
    sql: ${TABLE}.opening_share_price_usd ;;
  }

  dimension: opening_valuation {
    type: number
    sql: ${TABLE}.opening_valuation ;;
  }

  dimension: opening_valuation_currency_code {
    type: string
    sql: ${TABLE}.opening_valuation_currency_code ;;
  }

  dimension: opening_valuation_usd {
    type: number
    sql: ${TABLE}.opening_valuation_usd ;;
  }

  dimension: shares_sold {
    type: number
    sql: ${TABLE}.shares_sold ;;
  }

  dimension: stock_exchange_symbol {
    type: string
    sql: ${TABLE}.stock_exchange_symbol ;;
  }

  dimension: stock_symbol {
    type: string
    sql: ${TABLE}.stock_symbol ;;
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

  dimension: went_public_on {
    type: string
    sql: ${TABLE}.went_public_on ;;
  }

  dimension: went_public_on_trust_code {
    type: string
    sql: ${TABLE}.went_public_on_trust_code ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
