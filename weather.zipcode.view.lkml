view: zipcode {
  sql_table_name: `lookerdata.weather.zipcode` ;;

  dimension: zipcode {
    primary_key: yes
    map_layer_name: us_zipcode_tabulation_areas
    type: zipcode
    sql: cast(${TABLE}.zip_code as string);;
  }

  dimension: latitude {
    hidden: yes
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    hidden: yes
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  measure: count {
    type: count
  }

  set: detail {
    fields: [
      zipcode,
      latitude,
      longitude,
      city,
      state,
      county,
      location
    ]
  }
}
