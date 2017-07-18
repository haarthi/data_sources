connection: "lookerdata_publicdata_standard_sql"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project


explore: financial_indicators {
  join: indicators_metadata {
    type: left_outer
    sql_on: ${financial_indicators.dataset_code} = ${indicators_metadata.dataset_code} ;;
    relationship: many_to_one
  }
}

# explore: cpi {}
#
# # explore: c_cpi_u {}
#
# explore: unemployment_cps {}
#
# explore: unemployment_cps_series {}
