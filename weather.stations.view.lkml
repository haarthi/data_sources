view: stations {
  sql_table_name: `lookerdata.weather.stations` ;;

  dimension: station_id {
    primary_key: yes
    type: string
    sql: CASE WHEN ${wban} = '99999' THEN ${usaf} ELSE ${wban} END;;
  }

  dimension: usaf {
    type: string
    sql: ${TABLE}.usaf ;;
  }

  dimension: wban {
    type: string
    sql: ${TABLE}.wban ;;
  }

  dimension_group: begin {
    type: time
    timeframes: [year, month, date]
    sql: PARSE_DATE('%Y%m%d', ${TABLE}.begin) ;;
  }

  dimension: call {
    type: string
    sql: ${TABLE}.call ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: elev {
    type: string
    sql: ${TABLE}.elev ;;
  }

  dimension_group: end {
    type: time
    timeframes: [year, month, date]
    sql: PARSE_DATE('%Y%m%d', ${TABLE}.`end`) ;;
  }

  dimension: latitude {
    hidden: yes
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: longitude {
    hidden: yes
    type: number
    sql: ${TABLE}.lon ;;
  }

  dimension: location {
    type: location
    sql_latitude:${latitude};;
    sql_longitude:${longitude};;
  }


  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  measure: count {
    type: count
#     approximate_threshold: 100000
    drill_fields: [name]
  }


  measure: count_distinct_station {
    type: count_distinct
    sql: ${station_id} ;;
  }
}
