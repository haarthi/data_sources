connection: "bigquery_publicdata_standard_sql"

include: "weather*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: gsod {
  join: zipcode_station {
    view_label: "Stations"
    # from: test_query
    type: left_outer
    relationship: many_to_one
    sql_on: ${gsod.station_id} = ${zipcode_station.nearest_station_id}
      and ${gsod.year} = ${zipcode_station.year};;
  }

  join: stations {
    view_label: "Stations"
    type: left_outer
    relationship: many_to_one
    sql_on: ${zipcode_station.nearest_station_id} = ${stations.station_id} ;;
  }
  join: zipcode {
    type: left_outer
    relationship: one_to_one
    sql_on: ${zipcode_station.zip_code} = ${zipcode.zip_code} ;;
  }

  join: county_zipcode_mapping{
    type: left_outer
    relationship: many_to_one
    sql_on: ${zipcode.zip_code} = ${county_zipcode_mapping.zipcode}  ;;
  }
}

explore: zipcode {
  join: zipcode_station {
    from: test_query
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
