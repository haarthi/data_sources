view: zipcode_station {
  sql_table_name: `lookerdata.weather.zipcode_station` ;;

  dimension: zip_code {
    primary_key: yes
    # hidden: yes
    type: zipcode
    map_layer_name: us_zipcode_tabulation_areas
    sql: cast(${TABLE}.zip_code as string);;
  }

  dimension: nearest_station_id {
    type: string
    sql: ${TABLE}.nearest_station_id ;;
  }

  dimension: distance_from_nearest_station {
    type: number
    sql: ${TABLE}.distance_from_nearest_station ;;
  }

  measure: count {
    type: count
  }

  set: detail {
    fields: [zip_code, nearest_station_id, distance_from_nearest_station]
  }
}
