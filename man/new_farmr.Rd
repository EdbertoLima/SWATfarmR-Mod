% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/init_load_farmr.R
\name{new_farmr}
\alias{new_farmr}
\title{Initiate a new SWATfarmR project}
\usage{
new_farmr(project_name, project_path)
}
\arguments{
\item{project_name}{the name of the farmr project.}

\item{project_path}{Path to the SWAT TxtInOut folder to which the farmr
should be applied.}
}
\value{
Generates a new farmr_project in the working environment (as an R6
object) and saves the project the TxtInOut folder.
}
\description{
Initiate a new SWATfarmR project
}
