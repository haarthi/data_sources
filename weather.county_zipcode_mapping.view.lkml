## NEED BETTER COUNTY ZIPCODE MAPPING FILE

view: county_zipcode_mapping {
  sql_table_name: `lookerdata.weather.zcta_county_map` ;;

  dimension: zipcode {
#     primary_key: yes
    type: zipcode
    sql: ${TABLE}.zcta5 ;;
    map_layer_name: us_zipcode_tabulation_areas
  }

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: concat(${zipcode}, ${state_county_fips}) ;;
  }

  dimension: arealandpt {
    hidden: yes
    type: string
    sql: ${TABLE}.arealandpt ;;
  }

  dimension: areapt {
    hidden: yes
    type: string
    sql: ${TABLE}.areapt ;;
  }

  dimension: coarea {
    hidden: yes
    type: string
    sql: ${TABLE}.coarea ;;
  }

  dimension: coarealand {
    hidden: yes
    type: string
    sql: ${TABLE}.coarealand ;;
  }

  dimension: coarealandpct {
    hidden: yes
    type: string
    sql: ${TABLE}.coarealandpct ;;
  }

  dimension: coareapct {
    hidden: yes
    type: string
    sql: ${TABLE}.coareapct ;;
  }

  dimension: cohu {
    hidden: yes
    type: string
    sql: ${TABLE}.cohu ;;
  }

  dimension: cohupct {
    hidden: yes
    type: string
    sql: ${TABLE}.cohupct ;;
  }

  dimension: copop {
    hidden: yes
    type: string
    sql: ${TABLE}.copop ;;
  }

  dimension: copoppct {
    hidden: yes
    type: string
    sql: ${TABLE}.copoppct ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: geoid {
    hidden: yes
    type: string
    sql: ${TABLE}.geoid ;;
  }

  dimension: hupt {
    hidden: yes
    type: string
    sql: ${TABLE}.hupt ;;
  }

  dimension: poppt {
    hidden: yes
    type: string
    sql: ${TABLE}.poppt ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    hidden: yes
  }

  dimension: zarea {
    hidden: yes
    type: string
    sql: ${TABLE}.zarea ;;
  }

  dimension: zarealand {
    hidden: yes
    type: string
    sql: ${TABLE}.zarealand ;;
  }

  dimension: zarealandpct {
    hidden: yes
    type: string
    sql: ${TABLE}.zarealandpct ;;
  }

  dimension: zareapct {
    hidden: yes
    type: string
    sql: ${TABLE}.zareapct ;;
  }

  dimension: zhu {
    hidden: yes
    type: string
    sql: ${TABLE}.zhu ;;
  }

  dimension: zhupct {
    hidden: yes
    type: string
    sql: ${TABLE}.zhupct ;;
  }

  dimension: zpop {
    hidden: yes
    type: string
    sql: ${TABLE}.zpop ;;
  }

  dimension: zpoppct {
    hidden: yes
    type: string
    sql: ${TABLE}.zpoppct ;;
  }

  dimension: state_county_fips {
    type: string
    sql: concat (${state}, ${county}) ;;
    map_layer_name: us_counties_fips
  }

  measure: count {
#     hidden: yes
    type: count
    drill_fields: []
  }
}
