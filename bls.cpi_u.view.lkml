view: cpi {
  sql_table_name: finance.cpi_u ;;

  dimension: primary_key {
    primary_key: yes
    type: string
    sql: concat(series_id, cast(date as string)) ;;
  }

  dimension: area_code {
    type: string
    sql: ${TABLE}.area_code ;;
  }

  dimension: area_name {
    type: string
    sql: ${TABLE}.area_name ;;
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
    sql: ${TABLE}.date ;;
  }

  dimension: footnote_codes {
    type: string
    sql: ${TABLE}.footnote_codes ;;
  }

  dimension: item_code {
    type: string
    sql: ${TABLE}.item_code ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension: periodicity_code {
    type: string
    sql: ${TABLE}.periodicity_code ;;
  }

  dimension: seasonal_code {
    type: string
    sql: ${TABLE}.seasonal_code ;;
  }

  dimension: series_id {
    type: string
    sql: ${TABLE}.series_id ;;
  }

  dimension: survey_abbreviation {
    type: string
    sql: ${TABLE}.survey_abbreviation ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

#need to exclude summary rows for this data
  measure: average_cpi {
    type: average
    sql: ${value} ;;
    value_format_name: usd
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [area_name, item_name]
#   }
}
