view: event {
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  sql_table_name: `looker__internal__analytics.event` ;;

  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: Category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension_group: Created{
    type: time
    timeframes: [
      date,
      day_of_month,
      day_of_week,
      day_of_week_index,
      hour_of_day,
      hour,
      minute,
      month,
      month_name,
      month_num,
      quarter,
      quarter_of_year,
      time,
      time_of_day,
      week,
      week_of_year,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: isAdmin(Yes/No) {
    type: string
    sql: ${TABLE}.is_admin ;;
  }

  dimension: isAPICall(Yes/No) {
    type: string
    sql: ${TABLE}.is_api_call ;;
  }

  dimension: Name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: SudoUserID {
    type: string
    sql: ${TABLE}.sudo_user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, Category, Created_date, isAdmin(Yes/No), isAPICall(Yes/No), Name, SudoUserID]
  }


}
