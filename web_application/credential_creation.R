library(RSQLite)

df_credentials <- base::data.frame(
  user = c("admin", "neil_hoskings"),
  password = c("pass", "neil_hoskings"),
  strava_id = c(NA, "963223"),
  start = c("2020-01-01", "2020-01-01"),
  expire = c(NA, NA),
  # 2 is full access, 1 is godiva access, 0 is personal access
  admin_level = c(2, 0),
  comment = "Secure authentification for app",
  stringsAsFactors = F
)

base::setwd(dir="/Users/benhoskings/Documents/RStudio/Coventry_Godiva/web_application")

v_web_application_name <- "Coventry_Godiva"

v_prepared_data_path <- "data/prepared_data/"
v_database_path <- base::paste(v_prepared_data_path, v_web_application_name, ".db", sep="")
con_SQLite <- RSQLite::dbConnect(drv=RSQLite::SQLite(), dbname=v_database_path)
RSQLite::dbWriteTable(conn = con_SQLite, name = "credentials", value=df_credentials, overwrite=T)

RSQLite::dbDisconnect(conn=con_SQLite)
