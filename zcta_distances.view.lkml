view: zcta_distances {
  sql_table_name: datablocks_spectrum.zcta_distances ;;

  dimension: mi_to_zcta5 {
    type: number
    sql: ${TABLE}.mi_to_zcta5 ;;
  }

  dimension: zip1 {
    type: number
    sql: ${TABLE}.zip1 ;;
  }

  dimension: zip2 {
    type: number
    sql: ${TABLE}.zip2 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
