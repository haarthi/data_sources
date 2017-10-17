connection: "bigquery_publicdata_standard_sql"

include: "weather*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: gsod {
  join: zipcode_station {
    view_label: "Geography"
    type: left_outer
    relationship: many_to_one
    sql_on: ${gsod.station_id} = ${zipcode_station.nearest_station_id}
      and ${gsod.year} = ${zipcode_station.year};;
  }

  join: gsod_yoy_facts {
    type: left_outer
    relationship: many_to_one
    sql_on: ${gsod.station_id} = ${gsod_yoy_facts.station_id}
      and ${gsod.year} = ${gsod_yoy_facts.year} ;;
  }
  join: stations {
    type: left_outer
    relationship: many_to_one
    sql_on: ${zipcode_station.nearest_station_id} = ${stations.station_id} ;;
  }
  join: zipcode_county{
    view_label: "Geography"
    type: left_outer
    relationship: many_to_one
    sql_on: ${zipcode_station.zipcode} = ${zipcode_county.zipcode}  ;;
  }
  join: zipcode_facts {
    view_label: "Geography"
    type: left_outer
    relationship: one_to_many
    sql_on: ${zipcode_county.zipcode} = ${zipcode_facts.zipcode} ;;
  }
}

explore: zipcode_county {
  join: zipcode_facts {
    type: left_outer
    sql_on: ${zipcode_county.zipcode} = ${zipcode_facts.zipcode} ;;
    relationship: one_to_many
  }
  join: zipcode_station {
    type: left_outer
    relationship: many_to_one
    sql_on: ${zipcode_county.zipcode} = ${zipcode_station.zipcode} ;;
  }
  join: stations {
    type: left_outer
    relationship: one_to_one
    sql_on: ${zipcode_station.nearest_station_id} = ${stations.station_id} ;;
  }
}
