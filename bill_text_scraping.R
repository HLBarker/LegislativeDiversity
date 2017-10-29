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

# function for extracting bill summaries
topic <- function(website) {
  name <- read_html(website)
  data1 <- name %>% 
    html_nodes("td p") %>% 
    html_text()
  data2 <- data_frame(line = 1:10, text = data1)
}


# create list of websites to scrape bill info
nm_websites <- vector("list", 135)

for(i in 1:135) {
  nm_websites[[i]] <- paste("https://openstates.org/nm/bills/?chamber=&session=2015&type=bill&search_text=&sponsor__leg_id=&page=", i, sep = "")
}

nm_websites[[1]] <- "https://openstates.org/nm/bills/?search_text=&session=2015&chamber=&sponsor__leg_id=&type=bill"

topic_data_nm <- lapply(nm_websites, function(x) topic(x))
topic_data_df_nm <- as_data_frame(ldply(topic_data, data.frame))



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

