library(RSQLite)
library(rlang)

lapply(c("E:/GitHub/SWATfarmR/R/farmR_utils.R",
         "E:/GitHub/SWATfarmR/R/demo_handling.R",
         "E:/GitHub/SWATfarmR/R/general_functions.R",
         "E:/GitHub/SWATfarmR/R/init_load_farmr.R",
         "E:/GitHub/SWATfarmR/R/read_check_management.R",
         "E:/GitHub/SWATfarmR/R/read_hru_attributes.R",
         "E:/GitHub/SWATfarmR/R/read_mgt.R",
         "E:/GitHub/SWATfarmR/R/read_variable.R",
         "E:/GitHub/SWATfarmR/R/schedule_operations.R",
         "E:/GitHub/SWATfarmR/R/write_operations.R"), source)

remotes::install_github('chrisschuerz/SWATdata')
remotes::install_github('chrisschuerz/SWATfarmR')

demo_path <- 'E:/GitHub/SWATfarmR/Demo'


proj_path <-load_demo(dataset = 'project', 
                       path = demo_path,
                       version = '2012')

project_path <- "E:/GitHub/SWATfarmR/Demo/swat2012_rev622_demo"
project_name <- "demo"
swat_version <- "2012"
t0 <- now()

hru_attributes <-  read_hru_attributes(project_path, swat_version, t0)
variables <- read_weather(project_path, swat_version)
hru_var_connect <- connect_unit_weather(project_path,
                                        hru_attributes,
                                        variables,
                                        swat_version)

api <- variable_decay(variable = variables$pcp, n_steps = -5, decay_rate = 1)
hru_asgn <- select(hru_var_connect, hru, pcp) |> 
          rename(api = pcp)
var_add <- add_variable(data = api, name = 'api', assign_unit = hru_asgn, overwrite =T,
                        con = hru_var_connect,
                        variables = variables)

variables <- var_add$variables
hru_var_connect <- var_add$con


mgt_raw <- read_mgt_init(project_path, swat_version)


hru_attributes |> distinct(luse)


file <- 'E:/GitHub/SWATfarmR/Demo2012_SwatFarm.csv'

mgt_lkp <- read_mgt_lkp(file,
             swat_version,
             project_path,
             hru_attributes)

schedule <- mgt_lkp$mgt_code
schedule_text <- mgt_lkp$mgt_text
parameter_lookup <- mgt_lkp$lookup

scheduled_operations <-   schedule_operation(mgt_schedule = schedule,
                                             variables = variables,
                                             lookup = parameter_lookup,
                                             hru_attribute = hru_attributes,
                                             var_con = hru_var_connect,
                                             start_year = 1990,
                                             end_year = 1995,
                                             n_schedule = NULL,
                                             replace = 'all' ,
                                             project_path = project_path,
                                             project_name = project_name,
                                             version = swat_version)



mgt_schedule = schedule;variables = variables;lookup = parameter_lookup;
hru_attribute = hru_attributes;var_con = hru_var_connect;start_year = 1990;
 end_year = 1995;n_schedule = NULL;
                   replace = 'all' ;
                   project_path = project_path;
                   project_name = "demo2";
                   version = swat_version



tblz <- var_tbl |> mutate (date1 = (md > 0305),
                           date2 = (md < 0320),
                           date3 = (date < prev_op + 270),
                          term1 = (1 - w_log(pcp, 2, 10)),
                          term2 = (1 - w_log(api, 10, 25)),
                          term3 = term1*term2)


tblz |>  filter( date1 == TRUE & date2  == TRUE & date3  == TRUE )
(date < prev_op + 270)
