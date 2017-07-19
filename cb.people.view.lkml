view: people {
  sql_table_name: crunchbase.people ;;

  dimension: angellist_url {
    type: string
    sql: ${TABLE}.angellist_url ;;
  }

  dimension: api_path {
    type: string
    sql: ${TABLE}.api_path ;;
  }

  dimension: blog_url {
    type: string
    sql: ${TABLE}.blog_url ;;
  }

  dimension: blogspot_url {
    type: string
    sql: ${TABLE}.blogspot_url ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: facebook_url {
    type: string
    sql: ${TABLE}.facebook_url ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: flickr_url {
    type: string
    sql: ${TABLE}.flickr_url ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: homepage_url {
    type: string
    sql: ${TABLE}.homepage_url ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: linkedin_url {
    type: string
    sql: ${TABLE}.linkedin_url ;;
  }

  dimension: organization_api_path {
    type: string
    sql: ${TABLE}.organization_api_path ;;
  }

  dimension: organization_name {
    type: string
    sql: ${TABLE}.organization_name ;;
  }

  dimension: organization_permalink {
    type: string
    sql: ${TABLE}.organization_permalink ;;
  }

  dimension: organization_web_path {
    type: string
    sql: ${TABLE}.organization_web_path ;;
  }

  dimension: permalink {
    type: string
    sql: ${TABLE}.permalink ;;
  }

  dimension: profile_image_url {
    type: string
    sql: ${TABLE}.profile_image_url ;;
  }

  dimension: quora_url {
    type: string
    sql: ${TABLE}.quora_url ;;
  }

  dimension: region_name {
    type: string
    sql: ${TABLE}.region_name ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: twitter_url {
    type: string
    sql: ${TABLE}.twitter_url ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.uuid ;;
  }

  dimension: web_path {
    type: string
    sql: ${TABLE}.web_path ;;
  }

  measure: count {
    type: count
    drill_fields: [city_name, region_name, first_name, last_name, organization_name]
  }
}
