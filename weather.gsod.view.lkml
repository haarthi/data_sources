view: gsod {
  sql_table_name: `bigquery-public-data.noaa_gsod.gsod*` ;;

  dimension: station_id {
    type: string
    sql: CASE WHEN ${wban} = '99999' THEN ${station} ELSE ${wban} END;;
  }

  dimension: primary_key {
    hidden: yes
    primary_key: yes
    type: string
    sql: concat(cast(${station} as string), ${wban}, cast(${date_date} as string)) ;;
  }

  dimension: station {
    hidden: yes
    type: string
    sql: ${TABLE}.stn ;;
  }

  dimension: wban {
    hidden: yes
    type: string
    sql: ${TABLE}.wban ;;
  }

  dimension: windspeed {
#     hidden: yes
    type: string
    sql: ${TABLE}.wdsp ;;
  }

  dimension: year {
    type: string
    sql: REGEXP_EXTRACT(_TABLE_SUFFIX,r'\d\d\d\d') ;;
  }

  dimension_group: date {
    type: time
    timeframes: [date, month, month_name, year]
    sql: TIMESTAMP(concat(${TABLE}.year,'-',${month},'-',${day})) ;;
  }

  dimension: dew_point {
    type: number
    sql: ${TABLE}.dewp ;;
  }

  dimension: flag_prcp {
    type: string
    sql: ${TABLE}.flag_prcp ;;
  }

  dimension: max_temperature {
    group_label: "Temperature"
    type: number
    sql: ${TABLE}.max ;;
  }

  dimension: min_temperature {
    group_label: "Temperature"
    type: number
    sql: ${TABLE}.min ;;
  }

  dimension: max_wind_speed {
    type: string
    sql: ${TABLE}.mxpsd ;;
  }

  dimension: gust {
    type: number
    sql: ${TABLE}.gust ;;
  }

  dimension: visibility {
    type: number
    sql: ${TABLE}.visib ;;
  }

  dimension: precipitation {
    type: number
    sql: case when ${TABLE}.prcp = 99.99 then null else ${TABLE}.prcp end;;
  }

  measure: total_precipitation {
    type: sum
    sql: ${precipitation} ;;
    value_format_name: decimal_2
  }

  dimension: rain_drizzle {
    type: yesno
    sql: ${TABLE}.rain_drizzle = '1' ;;
  }

  dimension: fog {
    type: yesno
    sql: ${TABLE}.fog = '1';;
  }

  dimension: hail {
    type: yesno
    sql: ${TABLE}.hail = '1' ;;
  }

  dimension: snow_ice_pellets {
    type: yesno
    sql: ${TABLE}.snow_ice_pellets = '1' ;;
  }

  dimension: thunder {
    type: yesno
    sql: ${TABLE}.thunder = '1';;
  }

  dimension: tornado_funnel_cloud {
    type: yesno
    sql: ${TABLE}.tornado_funnel_cloud = '1' ;;
  }

  dimension: sea_level_pressure {
    type: number
    sql: ${TABLE}.slp ;;
  }

  dimension: snow_inches {
    type: number
    sql: case when ${TABLE}.sndp = 999.9 then null else ${TABLE}.sndp end;;
  }

  measure: total_snow_inches {
    type: sum
    sql: ${snow_inches};;
    value_format_name: decimal_2
  }

  dimension: mean_station_pressure {
    type: number
    sql: ${TABLE}.stp ;;
  }

  dimension: temperature {
    hidden: yes
    type: number
    sql: case when ${TABLE}.temp = 9999.9 then null else ${TABLE}.temp end ;;
  }

  measure: average_temperature {
    type: average
    sql: ${temperature} ;;
    value_format_name: decimal_2
  }






  ## Unused Fields

  dimension: month {
    hidden: yes
    type: string
    sql: ${TABLE}.mo ;;
  }

  dimension: day {
    hidden: yes
    type: string
    sql: ${TABLE}.da ;;
  }

  dimension: count_dewp {
    hidden: yes
    type: number
    sql: ${TABLE}.count_dewp ;;
  }

  dimension: count_slp {
    hidden: yes
    type: number
    sql: ${TABLE}.count_slp ;;
  }

  dimension: count_stp {
    hidden: yes
    type: number
    sql: ${TABLE}.count_stp ;;
  }

  dimension: count_temp {
    hidden: yes
    type: number
    sql: ${TABLE}.count_temp ;;
  }

  dimension: flag_max_temp {
    hidden: yes
    type: string
    sql: ${TABLE}.flag_max ;;
  }

  dimension: flag_min_temp {
    hidden: yes
    type: string
    sql: ${TABLE}.flag_min ;;
  }

  dimension: count_visib {
    hidden: yes
    type: number
    sql: ${TABLE}.count_visib ;;
  }

  dimension: count_wdsp {
    hidden: yes
    type: string
    sql: ${TABLE}.count_wdsp ;;
  }
}
