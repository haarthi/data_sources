view: gsod_yoy_facts {
  derived_table: {
    sql_trigger_value: select count(*) ;;
    sql: CREATE TEMPORARY FUNCTION looker_array_sum(ar ARRAY<STRING>) AS ((SELECT SUM(CAST(REGEXP_EXTRACT(val, '\\|\\|(\\-?\\d+(?:.\\d+)?)$') AS FLOAT64)) FROM UNNEST(ar) as val));

      SELECT
        REGEXP_EXTRACT(_TABLE_SUFFIX,r'\d\d\d\d')  AS year,
        CASE WHEN gsod.wban = '99999' THEN gsod.stn ELSE gsod.wban END AS station_id,
        COUNT(CASE WHEN (case when gsod.prcp = 99.99 then null else gsod.prcp end) > 0.0  THEN 1 ELSE NULL END) AS total_days_with_rainfall,
        AVG((case when gsod.prcp = 99.99 then null else gsod.prcp end) ) AS average_rainfall,
        COALESCE(SUM((case when gsod.prcp = 99.99 then null else gsod.prcp end) ), 0) AS total_rainfall,
        COALESCE(SUM((case when gsod.sndp = 999.9 then null else gsod.sndp end)), 0) AS total_snow_inches,
        AVG((case when gsod.temp = 9999.9 then null else gsod.temp end) ) AS average_temperature
      FROM `bigquery-public-data.noaa_gsod.gsod*`  AS gsod

      WHERE
        ((REGEXP_EXTRACT(_TABLE_SUFFIX,r'\d\d\d\d')) IN ('2015', '2016'))
      GROUP BY 1,2
      ORDER BY 4 DESC
       ;;
  }
  dimension: primary_key {
    type: string
    hidden: yes
    primary_key: yes
    sql: concat(${year}, ${station_id});;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }

  dimension: station_id {
    type: string
    sql: ${TABLE}.station_id ;;
  }

  measure: total_days_with_rainfall {
    type: sum
    sql: ${TABLE}.total_days_with_rainfall ;;
  }

  measure: average_rainfall {
    type: average
    sql: ${TABLE}.average_rainfall ;;
    value_format_name: decimal_2

  }

  measure: total_rainfall {
    type: sum
    sql: ${TABLE}.total_rainfall ;;
    value_format_name: decimal_2
  }

  measure: total_snow_inches {
    type: sum
    sql: ${TABLE}.total_snow_inches ;;
    value_format_name: decimal_2

  }

  measure: average_temperature {
    type: average
    sql: ${TABLE}.average_temperature ;;
    value_format_name: decimal_2

  }

  set: detail {
    fields: [
      year,
      station_id,
      total_days_with_rainfall,
      average_rainfall,
      total_rainfall,
      total_snow_inches,
      average_temperature
    ]
  }
}
