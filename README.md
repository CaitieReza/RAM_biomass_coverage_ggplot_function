# RAM_biomass_coverage_ggplot_function
Function that creates a plot for biomass coverage for fish stocks in RAM Legacy stock assessment data

### Inputs needed in function: 
- A dataframe with columns for stock name, mean biomass per stock, the first year the stock was assessed, the last year the  stock was assessed, the taxonomy group of each stock and the jittered mean biomass per stock. My dataframe is called mean_biomass, and is a list of dataframes, with a dataframe for each region
- A vector of region names to be used in the plot title - this vector is called regions
- A vector with the total number of stocks in each region is not required for the function to run, but it is needed if any regions have more than 30 stocks - this vector is called max_stocks

### Function argument definitions:
- dataframe = the dataframe
- regions = region names vector
- first_stock = the row to start with
- end_stock = the row to end with
- *I've found that 30 stocks is about the limit before the plot gets too condensed, so for regions with total number of stocks that are greater than 30, the first_stock and end_stock arguments allow a plot to be made for each set of 30 rows (first_stock = 1, end_stock = 30 for the first 30, etc.) and then the remainder with first_stock = 31 (or 61 or 91, etc.) and end_stock = max_stocks.
