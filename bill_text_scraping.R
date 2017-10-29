library(rvest)
library(tidyverse)
library(plyr)

# scraping state abbreviations for figures
abbrv_website <- read_html("http://www.softschools.com/social_studies/state_abbreviations/")
abbrev <- abbrv_website %>% 
  html_nodes("tr td") %>% 
  html_text()
abbrev2 <- data_frame(line = 1:109, text = abbrev)
abbrev2 <- abbrev2[4:109, ]

even_indexes <- seq(2,100,2)
abbrev3 <- abbrev2[even_indexes,2]

write.csv(abbrev3, "state_abbreviations.csv")



# create list of websites to scrape bill info
websites <- vector("list", 100)

for(i in 1:100) {
  websites[[i]] <- paste("https://openstates.org/de/bills/?search_text=&chamber=&session=148&type=bill&sponsor__leg_id=&page=", i, sep = "")
}

websites[[1]] <- "https://openstates.org/de/bills/?search_text=&session=148&chamber=&sponsor__leg_id=&type=bill"

# function for extracting bill topics
topic <- function(website) {
  name <- read_html(website)
  data1 <- name %>% 
    html_nodes("td p") %>% 
    html_text()
  data2 <- data_frame(line = 1:10, text = data1)
}

topic_data <- lapply(websites[1:3], function(x) topic(x))
topic_data_df <- as_data_frame(ldply(topic_data, data.frame))

# function for extracting bill actions
action <- function(website){
  name <- read_html(website)
  data1 <- name %>% 
    html_nodes(".tip") %>% 
    html_text()
  data2 <- data_frame(line = 1:13, text = data1)
  data3 <- data2[ 3:12, ]
}

action_data <- lapply(websites[1:3], function(x) action(x))
action_data_df <- as_data_frame(ldply(action_data, data.frame))

# combine data






# To do:
# Clean up heatmap and make it interactive with plotly
  # change state names to initials
# Make NMDS plot (state initials as labels) and overlay vectors to show diversity metrics?
# Calculate shannon index - make a small heatmap, ordered by Shannon index from least to most diverse
# Select a few states of each kind of diversity level to extract bill topic text
# tidy text = 
unnest_tokens(word, text)
data(stop_words)
anti_join(stop_words)
count(word, sort = TRUE)
 
# n-gram network looking at diversity extremes


# correlation with word frequency between state's with similar diversity and different diversity (based on heatmap)

