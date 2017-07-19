connection: "lookerdata_publicdata_standard_sql"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project


explore: financial_indicators {
  join: indicators_metadata {
    type: left_outer
    sql_on: ${financial_indicators.dataset_code} = ${indicators_metadata.dataset_code} ;;
    relationship: many_to_one
  }

  join: indicator_yoy {
    type: left_outer
    relationship: many_to_one
    sql_on: ${indicator_yoy.dataset_code} = ${financial_indicators.dataset_code}
      and ${financial_indicators.indicator_year} = ${indicator_yoy.indicator_year}  ;;
  }
}
