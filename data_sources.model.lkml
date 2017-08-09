connection: "bq-looker-datablocks"

# include all the views
include: "*.view"

# include all the dashboards
# include: "*.dashboard"


explore: sql_runner_query {}
