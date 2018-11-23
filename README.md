# RAM_biomass_coverage_ggplot_function
Function that creates a plot for biomass coverage for fish stocks in RAM Legacy stock assessment data

### Inputs needed in function: 
- A dataframe with columns for stock name, mean biomass per stock, the first year the stock was assessed, the last year the  stock was assessed, the taxonomy group of each stock and the jittered mean biomass per stock. My dataframe is called mean_biomass, and is a list of dataframes, with a dataframe for each region
- A vector of region names to be used in the plot title - this vector is called regions
- A vector with the total number of stocks in each region is not required for the function to run, but it is needed if any regions have more than 30 stocks - this vector is called max_stocks

### Function argument definitions:
- dataframe = the dataframe
- regions = region names vector
first_stock = the row to start with
end_stock = the row to end with
-- I've found that 30 stocks is about the limit before the plot gets too condensed, so for regions with total number of stocks that are greater than 30, the first_stock and end_stock arguments allow a plot to be made for each set of 30 rows (first_stock = 1, end_stock = 30 for the first 30, etc.) and then the remainder with first_stock = 31 (or 61 or 91, etc.) and end_stock = max_stocks.

``` {r}
basic_biomass_by_stock_ggplot <- function(dataframe, regions, first_stock, end_stock) {
  ggplot(data = dataframe[first_stock:end_stock, ]) +
    geom_segment(aes( 
      x = as.factor(jittered_mean),
      xend = as.factor(jittered_mean),
      y = first_year,
      yend = last_year,
      color = taxGroup
    ), 
    lineend = "butt",
    size = 5) +
    scale_color_manual(name = "Taxonomy Group", values = myColors) +
    geom_text(
      data = dataframe[first_stock:end_stock, ],
      aes(
        x = as.factor(jittered_mean),
        y = first_year,
        label = stock_names
      ),
      size = 2.5,
      hjust = -0.05,
      vjust = 0.5
    ) +
    scale_y_continuous(limits = c(1950, 2020), breaks = seq(1950, 2020, 10), 
                       labels = seq(1950, 2020, 10)) +
    coord_flip() +
    theme_light() +
    theme(legend.position = "none",  
          panel.border = element_blank()) +
    labs(title = paste(regions, "Region", sep = " "), x = "Average Biomass (MT)", y = "") +
    theme(plot.title = element_text(hjust = 0.5)) +
    scale_fill_discrete(guide = guide_legend()) +
    theme(legend.position="bottom") +
    theme(plot.margin = unit(c(1.5, 1.5, 1, 1.5), "cm"))
    
    ```
}
