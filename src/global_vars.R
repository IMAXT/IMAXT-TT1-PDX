## plotting themes --------------------------------

theme_cowplot2 <- function(...) {
  theme_cowplot(font_size = 16, font_family = "sans", ...) %+replace%
    theme(strip.background = element_blank(),
          panel.background = element_rect(fill = "transparent", color = NA),
          plot.background = element_rect(fill = "transparent", color = NA),
          panel.border = element_blank())
}
theme_set(theme_cowplot2())

remove_xaxis <- theme(axis.title.x = element_blank(),
                      axis.text.x = element_blank(),
                      axis.ticks.x = element_blank(),
                      axis.line.x = element_blank())

remove_yaxis <- theme(axis.title.y = element_blank(),
                      axis.text.y = element_blank(),
                      axis.ticks.y = element_blank(),
                      axis.line.y = element_blank())

remove_guides <- guides(color = F, fill = F, shape = F, alpha = F)


## ggsave wrapper suppressing dingbats symbols 
## for adobe illustrator compatibility
ggsave_pdf <- function(filename, plot = last_plot(), device = NULL, path = NULL, 
                       scale = 1, width = NA, height = NA, units = c("in", "cm", "mm"), 
                       dpi = 300, limitsize = TRUE, ...) {
  ggsave(filename = filename, plot = plot, device = cairo_pdf, path = path, 
         scale = scale, width = width, height = height, units = units, 
         dpi = dpi, limitsize = limitsize, ...)
}

ggsave_png <- function(filename, plot = last_plot(), device = NULL, path = NULL, 
                       scale = 1, width = NA, height = NA, units = c("in", "cm", "mm"), 
                       dpi = 300, limitsize = TRUE, type = "cairo", ...) {
  ggsave(filename = filename, plot = plot, device = device, path = path, 
         scale = scale, width = width, height = height, units = units, 
         dpi = dpi, limitsize = limitsize, type = type, ...)
}

## load color code --------------------------------

clrs <- yaml::read_yaml("resources/annotation/colors.yaml") %>%
  lapply(function(x) map_depth(x, vec_depth(x)-2, unlist))

# clrs$patient_id_short <- clrs$patient_id
# names(clrs$patient_id_short) <- str_remove_all(names(clrs$patient_id), "SPECTRUM-OV-")

shps <- yaml::read_yaml("resources/annotation/shapes.yaml") %>% 
  lapply(function(x) map_depth(x, vec_depth(x)-2, unlist))

