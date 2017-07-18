view: unemployment_cps {
  sql_table_name: finance.unemployment_cps ;;
#Primary Key

# count(distinct(concat(series_id, cast(date as string), period)))


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

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension: series_id {
    type: string
    sql: ${TABLE}.series_id ;;
  }

  dimension: series_title {
    type: string
    sql: ${TABLE}.series_title ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
