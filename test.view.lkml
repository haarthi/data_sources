explore: test {}

view: test {
  derived_table: {
    sql_trigger_value: select 1 ;;
    sql: SELECT
        CASE WHEN gsod.wban = '99999' THEN gsod.stn ELSE gsod.wban END AS gsod_station_id
        , stations.lat
        , stations.lon
      FROM `lookerdata.weather.gsod*`  AS gsod
      LEFT JOIN `lookerdata.weather.stations`  AS stations ON (CASE WHEN gsod.wban = '99999' THEN gsod.stn ELSE gsod.wban END) = (CASE WHEN stations.wban = '99999' THEN stations.usaf ELSE stations.wban END)

      GROUP BY 1, 2, 3
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: gsod_station_id {
    type: string
    sql: ${TABLE}.gsod_station_id ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: lon {
    type: number
    sql: ${TABLE}.lon ;;
  }

  set: detail {
    fields: [gsod_station_id, lat, lon]
  }
}


explore: test_query {}

view: test_query {
  derived_table: {
    sql_trigger_value: select 1 ;;

    sql:

     CREATE TEMP FUNCTION RADIANS(x FLOAT64) AS (
        ACOS(-1) * x / 180
      );

      CREATE TEMP FUNCTION DEGREES(x FLOAT64) AS (
        180 * x / ACOS(-1)
      );

    Select
      zip_code, nearest_station_id, min(distance_in_km) as distance_from_nearest_station
      from (
      select *
  -- , first_value(distance_in_km) OVER (PARTITION BY zip_code ORDER BY distance_in_km asc) AS nearest_distance_in_km
      , first_value(gsod_station_id) OVER (PARTITION BY zip_code ORDER BY distance_in_km asc) AS nearest_station_id
      from (
      SELECT zip_code
              , gsod_station_id
              ,lat, lon
              , 111.045* DEGREES(ACOS(COS(RADIANS(latpoint))
                         * COS(RADIANS(lat))
                         * COS(RADIANS(longpoint) - RADIANS(lon))
                         + SIN(RADIANS(latpoint))
                         * SIN(RADIANS(lat)))) AS distance_in_km

         FROM `lookerdata.looker_scratch.LR_NEXIECFM0RJOMAQE4E78F_test` as stations
         CROSS JOIN (
          SELECT  latitude  AS latpoint,  longitude AS longpoint, zip_code,
            City,
            100.0 AS radius,
            111.045 AS distance_unit
            from `lookerdata.weather.zipcode`
        --    where zip_code in (11211, 20171, 20170, 10009)
            where State in ('NY')
            and latitude is not null
        --    limit 100
         ) AS p

           WHERE
           lat
             BETWEEN p.latpoint  - (p.radius / p.distance_unit)
                 AND p.latpoint  + (p.radius / p.distance_unit)
            AND lon
             BETWEEN p.longpoint - (p.radius / (p.distance_unit * COS(RADIANS(p.latpoint))))
                 AND p.longpoint + (p.radius / (p.distance_unit * COS(RADIANS(p.latpoint))))

         order by zip_code, distance_in_km asc

         )

      )
      group by 1, 2

      ;;

    }


    dimension: zip_code {
      primary_key: yes
      # hidden: yes
      type: zipcode
      map_layer_name: us_zipcode_tabulation_areas
      sql: cast(${TABLE}.zip_code as string);;
    }

    dimension: nearest_station_id {
      type: string
      sql: ${TABLE}.nearest_station_id ;;
    }

    dimension: distance_from_nearest_station {
      description: "Distance From Station in Kilometers"
      type: number
      sql: ${TABLE}.distance_from_nearest_station ;;
    }

    set: detail {
      fields: [zip_code, nearest_station_id, distance_from_nearest_station]
    }
  }
