view: unemployment_cps_series {
  sql_table_name: finance.unemployment_cps_series ;;

  dimension: absn_code {
    type: number
    sql: ${TABLE}.absn_code ;;
  }

  dimension: activity_code {
    type: number
    sql: ${TABLE}.activity_code ;;
  }

  dimension: ages_code {
    type: number
    sql: ${TABLE}.ages_code ;;
  }

  dimension: begin_period {
    type: string
    sql: ${TABLE}.begin_period ;;
  }

  dimension: begin_year {
    type: number
    sql: ${TABLE}.begin_year ;;
  }

  dimension: born_code {
    type: number
    sql: ${TABLE}.born_code ;;
  }

  dimension: chld_code {
    type: number
    sql: ${TABLE}.chld_code ;;
  }

  dimension: class_code {
    type: number
    sql: ${TABLE}.class_code ;;
  }

  dimension: disa_code {
    type: number
    sql: ${TABLE}.disa_code ;;
  }

  dimension: duration_code {
    type: number
    sql: ${TABLE}.duration_code ;;
  }

  dimension: education_code {
    type: number
    sql: ${TABLE}.education_code ;;
  }

  dimension: end_period {
    type: string
    sql: ${TABLE}.end_period ;;
  }

  dimension: end_year {
    type: number
    sql: ${TABLE}.end_year ;;
  }

  dimension: entr_code {
    type: number
    sql: ${TABLE}.entr_code ;;
  }

  dimension: expr_code {
    type: number
    sql: ${TABLE}.expr_code ;;
  }

  dimension: footnote_codes {
    type: string
    sql: ${TABLE}.footnote_codes ;;
  }

  dimension: hheader_code {
    type: number
    sql: ${TABLE}.hheader_code ;;
  }

  dimension: hour_code {
    type: number
    sql: ${TABLE}.hour_code ;;
  }

  dimension: indy_code {
    type: number
    sql: ${TABLE}.indy_code ;;
  }

  dimension: jdes_code {
    type: number
    sql: ${TABLE}.jdes_code ;;
  }

  dimension: lfst_code {
    type: number
    sql: ${TABLE}.lfst_code ;;
  }

  dimension: look_code {
    type: number
    sql: ${TABLE}.look_code ;;
  }

  dimension: mari_code {
    type: number
    sql: ${TABLE}.mari_code ;;
  }

  dimension: mjhs_code {
    type: number
    sql: ${TABLE}.mjhs_code ;;
  }

  dimension: occupation_code {
    type: number
    sql: ${TABLE}.occupation_code ;;
  }

  dimension: orig_code {
    type: number
    sql: ${TABLE}.orig_code ;;
  }

  dimension: pcts_code {
    type: number
    sql: ${TABLE}.pcts_code ;;
  }

  dimension: periodicity_code {
    type: string
    sql: ${TABLE}.periodicity_code ;;
  }

  dimension: race_code {
    type: number
    sql: ${TABLE}.race_code ;;
  }

  dimension: rjnw_code {
    type: number
    sql: ${TABLE}.rjnw_code ;;
  }

  dimension: rnlf_code {
    type: number
    sql: ${TABLE}.rnlf_code ;;
  }

  dimension: rwns_code {
    type: number
    sql: ${TABLE}.rwns_code ;;
  }

  dimension: seasonal {
    type: string
    sql: ${TABLE}.seasonal ;;
  }

  dimension: seek_code {
    type: number
    sql: ${TABLE}.seek_code ;;
  }

  dimension: series_id {
    type: string
    sql: ${TABLE}.series_id ;;
  }

  dimension: series_title {
    type: string
    sql: ${TABLE}.series_title ;;
  }

  dimension: sexs_code {
    type: number
    sql: ${TABLE}.sexs_code ;;
  }

  dimension: tdat_code {
    type: number
    sql: ${TABLE}.tdat_code ;;
  }

  dimension: vets_code {
    type: number
    sql: ${TABLE}.vets_code ;;
  }

  dimension: wkst_code {
    type: number
    sql: ${TABLE}.wkst_code ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
