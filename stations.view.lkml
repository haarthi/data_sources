view: stations {
  sql_table_name: [fh-bigquery:weather_gsod.stations]
    ;;

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

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: lon {
    type: number
    sql: ${TABLE}.lon ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: usaf {
    type: string
    sql: ${TABLE}.usaf ;;
  }

  dimension: wban {
    type: string
    sql: ${TABLE}.wban ;;
  }

  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [name]
  }
}
