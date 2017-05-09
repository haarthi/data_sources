connection: "lookerdata_publicdata_standard_sql"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: gsod {
  join: stations {
    type: full_outer
    relationship: many_to_one
    sql_on: ${gsod.station_id} = ${stations.station_id} ;;
  }
  # join: zipcode_station {
  #   type: left_outer
  #   relationship: one_to_many
  #   sql_on: ${stations.station_id} = ${zipcode_station.nearest_station_id} ;;
  # }
  # join: zipcode {
  #   type: left_outer
  #   relationship: one_to_one
  #   sql_on: ${zipcode_station.zip_code} = ${zipcode.zip_code} ;;
  # }
  join: zipcode_station {
    from: test_query
    type: left_outer
    relationship: one_to_many
    sql_on: ${stations.station_id} = ${zipcode_station.nearest_station_id} ;;
  }
  join: zipcode {
    type: left_outer
    relationship: one_to_one
    sql_on: ${zipcode_station.zip_code} = ${zipcode.zip_code} ;;
  }


}

explore: stations {

}
explore: zipcode_station {}

explore: zipcode {
  join: zipcode_station {
    type: left_outer
    relationship: many_to_one
    sql_on: ${zipcode.zip_code} = ${zipcode_station.zip_code} ;;
  }
  join: stations {
    type: left_outer
    relationship: one_to_one
    sql_on: ${zipcode_station.nearest_station_id} = ${stations.station_id} ;;
  }
}



# explore: zipcode {
#   sql_preamble:
#     CREATE TEMP FUNCTION RADIANS(x FLOAT64) AS (
#       ACOS(-1) * x / 180
#     );
#   ;;
# }
