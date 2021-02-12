# SWATfarmR <img src="man/figures/swatfarmr_hex.svg" align="right" />

`SWATfarmR` is a pre-processing tool for the scheduling of farm management operations in SWAT+ and SWAT2012 projects. `SWATfarmR` develops management schedules for each HRU of a SWAT model setup based on user defined management tables. The user can define rules that control the timing of set operations. These rules can include information on temporal constraints, an HRU's spatial properties, or any climatic or other external variable to decide the scheduling of an operation. The concept of the `SWATfarmR` is comparable to the diecision tables concept that is implemented in SWAT+ [Arnold, 2018](https://doi.org/10.3390/w10060713). The main difference between these two concepts is that `SWATfarmR` develops the management operation schedules in a model prepocessing, whereas the decision tables are evaluated during the model execution. 

## SWAT+ implementation 

### Next actions
- routine SWAT version identification
- routine read in weather inputs
- routine read HRU properties

### Mit/Long term ideas
- comparison of farmR setup to the decision tables


## `SWATfarmR` workflow concept

![](/man/figures/swatfarmr_concept.svg)