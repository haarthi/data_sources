
view: gsod_pdt {
  derived_table: {
    persist_for: "100 hours"
    distribution_style: all
    sql: SELECT count(*) as total_weather FROM datablocks_spectrum.zcta_distances
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: total_weather {
    type: number
    sql: ${TABLE}.total_weather ;;
  }

  set: detail {
    fields: [total_weather]
  }
}





view: gsod_spectrum {
  sql_table_name: datablocks_spectrum.gsod ;;

  dimension: count_dewp {
    type: number
    sql: ${TABLE}.count_dewp ;;
  }

  dimension: count_slp {
    type: number
    sql: ${TABLE}.count_slp ;;
  }

  dimension: count_stp {
    type: number
    sql: ${TABLE}.count_stp ;;
  }

  dimension: count_temp {
    type: number
    sql: ${TABLE}.count_temp ;;
  }

  dimension: count_visib {
    type: number
    sql: ${TABLE}.count_visib ;;
  }

  dimension: count_wdsp {
    type: number
    sql: ${TABLE}.count_wdsp ;;
  }

  dimension: da {
    type: number
    sql: ${TABLE}.da ;;
  }

  dimension: dewp {
    type: string
    sql: ${TABLE}.dewp ;;
  }

  dimension: flag_max {
    type: string
    sql: ${TABLE}.flag_max ;;
  }

  dimension: flag_min {
    type: string
    sql: ${TABLE}.flag_min ;;
  }

  dimension: flag_prcp {
    type: string
    sql: ${TABLE}.flag_prcp ;;
  }

  dimension: fog {
    type: number
    sql: ${TABLE}.fog ;;
  }

  dimension: gust {
    type: string
    sql: ${TABLE}.gust ;;
  }

  dimension: hail {
    type: number
    sql: ${TABLE}.hail ;;
  }

  dimension: max {
    type: string
    sql: ${TABLE}.max ;;
  }

  dimension: min {
    type: string
    sql: ${TABLE}.min ;;
  }

  dimension: mo {
    type: number
    sql: ${TABLE}.mo ;;
  }

  dimension: mxpsd {
    type: string
    sql: ${TABLE}.mxpsd ;;
  }

  dimension: prcp {
    type: number
    sql: ${TABLE}.prcp ;;
  }

  dimension: rain_drizzle {
    type: number
    sql: ${TABLE}.rain_drizzle ;;
  }

  dimension: slp {
    type: string
    sql: ${TABLE}.slp ;;
  }

  dimension: sndp {
    type: string
    sql: ${TABLE}.sndp ;;
  }

  dimension: snow_ice_pellets {
    type: number
    sql: ${TABLE}.snow_ice_pellets ;;
  }

  dimension: stn {
    type: number
    sql: ${TABLE}.stn ;;
  }

  dimension: stp {
    type: string
    sql: ${TABLE}.stp ;;
  }

  dimension: temp {
    type: number
    sql: ${TABLE}.temp ;;
  }

  dimension: thunder {
    type: number
    sql: ${TABLE}.thunder ;;
  }

  dimension: tornado_funnel_cloud {
    type: number
    sql: ${TABLE}.tornado_funnel_cloud ;;
  }

  dimension: visib {
    type: string
    sql: ${TABLE}.visib ;;
  }

  dimension: wban {
    type: number
    sql: ${TABLE}.wban ;;
  }

  dimension: wdsp {
    type: string
    sql: ${TABLE}.wdsp ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
