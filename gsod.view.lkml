view: gsod {
  sql_table_name: `lookerdata.weather.gsod*` ;;

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
    type: string
    sql: ${TABLE}.stn ;;
  }

  dimension: wban {
    # hidden: yes
    type: string
    sql: ${TABLE}.wban ;;
  }

  dimension: wdsp {
    hidden: yes
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
    type: string
    sql: ${TABLE}.fog ;;
  }

  dimension: gust {
    type: number
    sql: ${TABLE}.gust ;;
  }

  dimension: hail {
    type: string
    sql: ${TABLE}.hail ;;
  }

  dimension: max_temp_day {
    type: number
    sql: ${TABLE}.max ;;
  }

  dimension: min_temp_day {
    type: number
    sql: ${TABLE}.min ;;
  }


  dimension: max_wind_speed {
    type: string
    sql: ${TABLE}.mxpsd ;;
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
  }

  dimension: snow_ice_pellets {
    type: yesno
    sql: ${TABLE}.snow_ice_pellets = '1' ;;
  }

  dimension: mean_station_pressure {
    type: number
    sql: ${TABLE}.stp ;;
  }

  dimension: temperature {
    type: number
    sql: ${TABLE}.temp ;;
  }

  dimension: thunder {
    type: yesno
    sql: ${TABLE}.thunder = '1';;
  }

  dimension: tornado_funnel_cloud {
    type: yesno
    sql: ${TABLE}.tornado_funnel_cloud = '1' ;;
  }

  dimension: visibility {
    type: number
    sql: ${TABLE}.visib ;;
  }

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

  measure: count {
    type: count
    # approximate_threshold: 100000
    drill_fields: []
  }
}
