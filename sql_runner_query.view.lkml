view: sql_runner_query {
  derived_table: {
    sql_trigger_value: select 1 ;;
    sql: SELECT * FROM `looker-datablocks.acs.fips_states` LIMIT 10
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.state_name ;;
  }

  dimension: fips {
    type: number
    sql: ${TABLE}.fips ;;
  }

  dimension: state_abbreviation {
    type: string
    sql: ${TABLE}.state_abbreviation ;;
  }

  set: detail {
    fields: [state_name, fips, state_abbreviation]
  }
}
