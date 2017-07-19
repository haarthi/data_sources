# explore: my_test {}

view: my_test {
  sql_table_name: `lookerdata.crunchbase.test` ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: column_names {
    type: string
    sql: ${TABLE}.column_names ;;
  }

  dimension: database_code {
    type: string
    sql: ${TABLE}.database_code ;;
  }

  dimension: database_id {
    type: number
    sql: ${TABLE}.database_id ;;
  }

  dimension: dataset_code {
    type: string
    sql: ${TABLE}.dataset_code ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: frequency {
    type: string
    sql: ${TABLE}.frequency ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: newest_available {
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
    sql: ${TABLE}.newest_available_date ;;
  }

  dimension_group: oldest_available {
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
    sql: ${TABLE}.oldest_available_date ;;
  }

  dimension: premium {
    type: yesno
    sql: ${TABLE}.premium ;;
  }

  dimension_group: refreshed {
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
    sql: ${TABLE}.refreshed_at ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
