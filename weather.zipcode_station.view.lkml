view: zipcode_station {
  sql_table_name: `lookerdata.weather.zipcode_station` ;;

  dimension: zipcode {
    # hidden: yes
    type: zipcode
    map_layer_name: us_zipcode_tabulation_areas
    sql: cast(${TABLE}.zipcode as string);;
  }

  dimension: nearest_station_id {
    type: string
    sql: ${TABLE}.nearest_station_id ;;
  }

  dimension: year {
    type: string
    sql: cast(${TABLE}.year as string) ;;
  }

  dimension: primary_key {
    type: string
    primary_key: yes
    sql: concat(${zipcode}, ${year})  ;;
  }

  dimension: distance_from_nearest_station {
    type: number
    sql: ${TABLE}.distance_from_nearest_station ;;
  }

  measure: count {
    type: count
  }

  set: detail {
    fields: [zipcode, nearest_station_id, distance_from_nearest_station]
  }
}
