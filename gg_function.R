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
}
