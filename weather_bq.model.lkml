connection: "lookerdata_publicdata_standard_sql"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project



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
#   join: weather {
#     type:
#   }


}

explore: weather {
  join: stations {}

  join: zipcode_station {}

}
explore: stations {}

explore: zipcode_station {}


# explore: zipcode {
#   sql_preamble:
#     CREATE TEMP FUNCTION RADIANS(x FLOAT64) AS (
#       ACOS(-1) * x / 180
#     );
#   ;;
# }
