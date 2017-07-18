view: financial_indicators{
  sql_table_name: finance.FRED_data ;;

  dimension: primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql:  ${dataset_code} + ${TABLE}.date ;;
  }

  dimension: dataset_code {
    type: string
    sql: ${TABLE}.dataset_code ;;
  }

  dimension: category {
    type: string
    case: {
      when: {
        sql: ${dataset_code} in ('GDP', 'GDPC1', 'GDPPOT') ;;
        label: "Economic Growth"
      }
      when: {
        sql: ${dataset_code} in ('CPIAUCSL', 'CPILFESL', 'GDPDEF') ;;
        label: "Prices and Inflation"
      }
      when: {
        sql: ${dataset_code} in ('BASE','M1', 'M2', 'M1V', 'M2V') ;;
        label: "Money Supply"
      }
      when: {
        sql: ${dataset_code} in ('DFF','DTB3','DGS5','DGS10','DGS30','T5YIE','T10YIE','T5YIFR','TEDRATE','DPRIME') ;;
        label: "Interest Rates"
      }
      when: {
        sql: ${dataset_code} in ('UNRATE','NROU','NROUST','CIVPART','EMRATIO','UNEMPLOY','PAYEMS','MANEMP','ICSA','IC4WSA') ;;
        label: "Employment"
      }
      when: {
        sql: ${dataset_code} in ('MEHOINUSA672N','DSPIC96','PCE','PCEDG','PSAVERT','RRSFS','DSPI') ;;
        label: "Income and Expenditures"
      }
      when: {
        sql: ${dataset_code} in ('INDPRO','TCU','HOUST','GPDI','CP','STLFSI','DCOILWTICO','USSLIND','DTWEXM','DTWEXB') ;;
        label: "Other Economic Indicators"
      }
      when: {
        sql: ${dataset_code} in ('GFDEBTN','GFDEGDQ188S','EXCSRESNW','TOTCI') ;;
        label: "Debt"
      }
        # Possibly more when statements
        else: "Non-Key Indicator"
      }
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: total_value {
    type: sum
    sql: ${value} ;;
  }

  measure: average_value {
    type: average
    sql: ${value} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
