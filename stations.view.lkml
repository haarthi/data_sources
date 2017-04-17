view: stations {
  sql_table_name: `lookerdata.weather.stations` ;;

  dimension: station_id {
    primary_key: yes
    type: string
    sql: CASE WHEN ${usaf} = '999999' THEN ${wban} ELSE ${usaf} END;;
  }

  dimension: usaf {
    type: string
    sql: ${TABLE}.usaf ;;
  }

  dimension: wban {
    type: string
    sql: ${TABLE}.wban ;;
  }

  dimension: begin {
    type: string
    sql: ${TABLE}.begin ;;
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

  dimension: end {
    type: string
    sql: ${TABLE}.end ;;
  }

  dimension: fips {
    type: string
    sql: ${TABLE}.fips ;;
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
}
