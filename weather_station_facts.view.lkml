# removing stations that have incorrect percipitation

view: station_facts {
  derived_table: {
    persist_for: "10000 hours"
    sql: SELECT
        CASE WHEN gsod.wban = '99999' THEN gsod.stn ELSE gsod.wban END AS station_id,
        COUNT(CASE WHEN (case when gsod.prcp = 99.99 then null else gsod.prcp end) > 0.0  THEN 1 ELSE NULL END) AS total_days_with_rainfall
      FROM `bigquery-public-data.noaa_gsod.gsod*`  AS gsod

      GROUP BY 1
      HAVING
        (COUNT(CASE WHEN (case when gsod.prcp = 99.99 then null else gsod.prcp end) > 0.0  THEN 1 ELSE NULL END) = 0)
      ORDER BY 2 DESC
       ;;
  }

  dimension: station_id {
    type: string
    sql: ${TABLE}.station_id ;;
  }

  dimension: total_days_with_rainfall {
    type: number
    sql: ${TABLE}.total_days_with_rainfall ;;
  }

  set: detail {
    fields: [station_id, total_days_with_rainfall]
  }
}
