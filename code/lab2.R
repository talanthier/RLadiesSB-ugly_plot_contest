library(tidyverse)
sweaters <- read.csv('data/use_this_data/holiday_sweaters-2020-12-15-clean.csv')


# view(sweaters)
# str(sweaters)
# 'data.frame':	107 obs. of  9 variables:
#   $ sweater   : chr  "sweater1" "sweater2" "sweater3" "sweater4" ...
# $ hs_tf     : chr  "Yes" "Yes" "Yes" "No" ...
# $ sparkly   : chr  "Yes" "No" "No" "No" ...
# $ noise     : chr  "No" "No" "No" "No" ...
# $ lights    : chr  "No" "No" "No" "No" ...
# $ objects   : chr  "No" "No" "No" "No" ...
# $ colors    : chr  "Red, Yellow, Blue, White, teal" "Green" "Red, Yellow, Green, Brown, White, Black" "the limit does not exist" ...
# $ image_tf  : chr  "Yes" "No" "Yes" "No" ...
# $ image_desc: chr  "octopus dressed like santa" NA "Houses" NA ...



# Taken from 00-cleaning_script.R
#       "hs_tf" = 'Do you have a holiday sweater?',
#       "sparkly" = 'Is it sparkly?',
#       "noise" = 'Does it make noise?',
#       "lights" = 'Does it light up?',
#       "objects" = 'Are things attached to it (i.e. is there anything that is normally not part of a sweater on it)?',
#       "colors" = 'What colors does it have?',
#       "image_tf" = 'Does it have a major image on it (i.e. something outside of the main pattern)?',
#       "image_desc" = 'If yes, what is the image?')

sweaters['length_color_string'] <- nchar(sweaters$colors)

ugly_plot <- ggplot(sweaters, aes(image_desc, objects)) +
  geom_raster(aes(fill = length_color_string), interpolate = TRUE, alpha = 1) +
  labs(x = 'y-axis', 
       y='x-axis',
       title = 'What not to do.') +
  theme_dark() +
  scale_fill_gradient2(low = 'blue', high = 'springgreen', mid = 'tan2', na.value = 'deeppink', midpoint = 40) +
  theme(text=element_text(color = 'yellow3', family = 'serif', angle = 1),
        legend.background = element_rect(fill = 'black', colour = 'black'),
        legend.position = 'bottom')
