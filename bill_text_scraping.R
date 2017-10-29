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


extract_summary <- function(num, website_page, website_nopage){
  state_websites <- vector("list", num)
  
  for(i in 1:num) {
    state_websites[[i]] <- paste(website_page, i, sep = "")
  }
  
  state_websites[[1]] <- website_nopage
  
  topic_data_state <- lapply(state_websites, function(x) topic(x))
  as_data_frame(ldply(topic_data_state, data.frame))
}



# bill info from three most diverse states
topic_data_df_nm <- extract_summary(135, "https://openstates.org/nm/bills/?chamber=&session=2015&type=bill&search_text=&sponsor__leg_id=&page=",
                                    "https://openstates.org/nm/bills/?search_text=&session=2015&chamber=&sponsor__leg_id=&type=bill")
topic_data_df_nm["State"] <- "New Mexico"
topic_data_df_nm["ShanDiv"] <- 1

topic_data_df_az <- extract_summary(108, "https://openstates.org/az/bills/?chamber=&session=53rd-1st-regular&type=bill&search_text=&sponsor__leg_id=&page=",
                                    "https://openstates.org/az/bills/?search_text=&session=53rd-1st-regular&chamber=&sponsor__leg_id=&type=bill")
topic_data_df_az["State"] <- "Arizona"
topic_data_df_az["ShanDiv"] <- 1

topic_data_df_md <- extract_summary(223, "https://openstates.org/md/bills/?chamber=&session=2015&type=bill&search_text=&sponsor__leg_id=&page=",
                                    "https://openstates.org/md/bills/?search_text=&session=2015&chamber=&sponsor__leg_id=&type=bill")
topic_data_df_md["State"] <- "Maryland"
topic_data_df_md["ShanDiv"] <- 1


# bill info from three least diverse states
topic_data_df_nh <- extract_summary(85, "https://openstates.org/nh/bills/?chamber=&session=2015&type=bill&search_text=&sponsor__leg_id=&page=",
                                    "https://openstates.org/nh/bills/?search_text=&session=2015&chamber=&sponsor__leg_id=&type=bill")
topic_data_df_nh["State"] <- "New Hampshire"
topic_data_df_nh["ShanDiv"] <- 0

topic_data_df_wv <- extract_summary(160, "https://openstates.org/wv/bills/?chamber=&session=2015&type=bill&search_text=&sponsor__leg_id=&page=",
                                    "https://openstates.org/wv/bills/?search_text=&session=2015&chamber=&sponsor__leg_id=&type=bill")
topic_data_df_wv["State"] <- "West Virginia"
topic_data_df_wv["ShanDiv"] <- 0

topic_data_df_tn <- extract_summary(535, "https://openstates.org/tn/bills/?chamber=&session=109&type=bill&search_text=&sponsor__leg_id=&page=",
                                    "https://openstates.org/tn/bills/?search_text=&session=109&chamber=&sponsor__leg_id=&type=bill")
topic_data_df_tn["State"] <- "Tennessee"
topic_data_df_tn["ShanDiv"] <- 0

bill_data <- bind_rows(topic_data_df_az, topic_data_df_md, topic_data_df_nh, topic_data_df_nm, topic_data_df_tn, topic_data_df_wv)
write_csv(bill_data, "scraped_bill_data.csv")


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
"relative to"
"relating to"

# correlation with word frequency between state's with similar diversity and different diversity (based on heatmap)

