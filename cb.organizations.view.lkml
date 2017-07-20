view: organizations {
  sql_table_name: crunchbase.organizations ;;

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

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: facebook_url {
    type: string
    sql: ${TABLE}.facebook_url ;;
  }

  dimension: google_url {
    type: string
    sql: ${TABLE}.google_url ;;
  }

  dimension: homepage_url {
    type: string
    sql: ${TABLE}.homepage_url ;;
  }

  dimension: instagram_url {
    type: string
    sql: ${TABLE}.instagram_url ;;
  }

  dimension: linkedin_url {
    type: string
    sql: ${TABLE}.linkedin_url ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: permalink {
    type: string
    sql: ${TABLE}.permalink ;;
  }

  dimension: pinterest_url {
    type: string
    sql: ${TABLE}.pinterest_url ;;
  }

  dimension: primary_role {
    type: string
    sql: ${TABLE}.primary_role ;;
  }

  dimension: profile_image_url {
    type: string
    sql: ${TABLE}.profile_image_url ;;
  }

  dimension: region_name {
    type: string
    sql: ${TABLE}.region_name ;;
  }

  dimension: short_description {
    type: string
    sql: ${TABLE}.short_description ;;
  }

  dimension: tumblr_url {
    type: string
    sql: ${TABLE}.tumblr_url ;;
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

  dimension: youtube_url {
    type: string
    sql: ${TABLE}.youtube_url ;;
  }

  measure: count {
    type: count
    drill_fields: [city_name, region_name, name]
  }
}
