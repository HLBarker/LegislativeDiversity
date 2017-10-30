library(rvest)
library(tidyverse)
library(plyr)

### Scraping data
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


### Exploring legislature diversity
library(tidyverse)
library(vegan)

div <- read.csv("state_legislative_diversity.csv")
abbrev_state <- read.csv("state_abbreviations.csv")

div2 <- div %>% 
  select(-EDU_NoData, -Pop_female, -NoData_job, -Male) %>% 
  filter(States != "Puerto Rico")

dismat <- as.matrix(vegdist(div2[, -1], method = "euclidean"))

library(colorspace)
palette <- diverge_hcl(16, h = c(260, 0), c = 80, l = c(30, 90), p = 1.5)

# make distance heatmap
heatmap(dismat, col  = palette, labCol = abbrev_state$text, labRow = abbrev_state$text, 
        cexRow = 0.9, cexCol = 0.9)

# perform NMDS on distance matrix
mds <- metaMDS(dismat, k = 2, try = 20, trymax = 20)
mds.point <- as.data.frame(mds$points)
# overlay diversity categories
div.vec <- envfit(mds ~ div2$EDU_LessThanBachelors + div2$EDU_Bachelors + div2$EDU_Advanced +
                    div2$Female + div2$Millenials_Gen + div2$GenX_Gen + div2$Boomers_Gen +
                    div2$Silent_Gen + div2$Greatest_Gen + div2$Agriculture + div2$Attorney +
                    div2$BusinessOwner + div2$BusinessOther + div2$Educator +
                    div2$Consult_Nonprofit_Professional + div2$Legislator + div2$Retired +
                    div2$Other_job + div2$NativeAmerican + div2$Asian_PacIsl +
                    div2$Black_AfAmer + div2$Hisp_Latino + div2$Multiracial_Other +
                    div2$Total_minorities + div2$White_Caucasian + div2$Protestant +
                    div2$Catholic + div2$OtherChristian + div2$NonChristian +
                    div2$Unspecified_Religion,
                  permutations = 999, srata = NULL)
# only include significant terms
div.vec2 <- envfit(mds ~ div2$EDU_Advanced +
                     div2$Female + div2$GenX_Gen + div2$Boomers_Gen +
                     div2$Agriculture + div2$Attorney +
                     div2$BusinessOwner +
                     div2$Total_minorities + div2$White_Caucasian + div2$Protestant +
                     div2$NonChristian +
                     div2$Unspecified_Religion,
                   permutations = 999, srata = NULL)

str(div.vec2$vectors$arrows)
dimnames(div.vec2$vectors$arrows)[[1]] <- c("Advanced degree", "Female", "GenX", "Boomers",
                                            "Agriculture", "Attorney", "Business owner", 
                                            "Minorities", "White", "Protestant", 
                                            "Non Christian", "Unspecified religion")

div2["shannon_index"] <- diversity(div2[ ,-1], index = "shannon", MARGIN = 1)
shan_div <- diversity(div2[ ,-1], index = "shannon", MARGIN = 1)
rbPal <- colorRampPalette(c("red", "blue"))
div_col <- rbPal(10)[as.numeric(cut(shan_div, breaks = 10))]


# make NMDS plot with overlaid vectors
{plot(mds, type = "n") # make an empty NMDS plot
  text(mds.point, label = abbrev_state$text, cex = 1.3, col = div_col) # Add the NMDS points for each site
  # and label them as the site number (1-30)
  plot(div.vec2, cex = 1, col = rgb(0,0,0, alpha = 0.5))}


### Explore bill text
library(tidyverse)
library(tidytext)
library(igraph)
library(ggraph)
library(fiftystater)

state_diversity <- as_tibble(read.csv("shannon_div_state.csv"))
bill_text <- as_tibble(read.csv("scraped_bill_data.csv"))

bill_text$text <- as.character(bill_text$text) 

# upload and add stop words
data("stop_words")
bill_stop_words <- tibble(word = c("relative", "relating", "tca", "west", "virginia", "tennessee", "new", "mexico", "maryland", "hampshire", "arizona"), lexicon = "Bill")
bill_stop_words

stop_words2 <- bind_rows(stop_words, bill_stop_words)

# separate data by diversity (high = 1; low = 0)
diverse <- bill_text %>% 
  filter(ShanDiv == 1)

notdiverse <- bill_text %>% 
  filter(ShanDiv == 0)

# function to make bigram networks
text_network <- function(data, num){
  bill_bigrams <- data %>% 
    unnest_tokens(bigram, text, token = "ngrams", n = 2) 
  
  bigrams_separated <- bill_bigrams %>%
    separate(bigram, c("word1", "word2"), sep = " ")
  
  bigrams_filtered <- bigrams_separated %>%
    filter(!word1 %in% stop_words2$word) %>%
    filter(!word2 %in% stop_words2$word)
  
  bigram_counts <- bigrams_filtered %>% 
    dplyr::count(word1, word2, sort = TRUE)
  
  bigrams_united <- bigrams_filtered %>%
    unite(bigram, word1, word2, sep = " ")
  
  bigram_counts %>%
    filter(n > num) %>%
    graph_from_data_frame()
}

bigram_graph_diverse <- text_network(diverse, 20)
bigram_graph_notdiverse <- text_network(notdiverse, 40)


# diverse bigram network
set.seed(2016)

a <- grid::arrow(type = "closed", length = unit(.15, "inches"))

ggraph(bigram_graph_diverse, layout = "fr") +
  geom_edge_link(aes(edge_alpha = n), show.legend = FALSE,
                 arrow = a, end_cap = circle(.07, 'inches')) +
  geom_node_point(color = "lightblue", size = 5) +
  geom_node_text(aes(label = name), vjust = 1, hjust = 1) +
  theme_void()

# not diverse bigram network
set.seed(2016)

a <- grid::arrow(type = "closed", length = unit(.15, "inches"))

ggraph(bigram_graph_notdiverse, layout = "fr") +
  geom_edge_link(aes(edge_alpha = n), show.legend = FALSE,
                 arrow = a, end_cap = circle(.07, 'inches')) +
  geom_node_point(color = "lightblue", size = 5) +
  geom_node_text(aes(label = name), vjust = 1, hjust = 1) +
  theme_void()

# state map that is colored via Shannon diversity index (red = low, blue = high)
state_diversity$statelower <- tolower(state_diversity$States)

p <- ggplot(state_diversity, aes(map_id = state_diversity$statelower)) + 
  # map points to the fifty_states shape data
  geom_map(aes(fill = state_diversity$shannon_index), map = fifty_states) + 
  scale_fill_gradient(low = "red", high = "blue", guide = guide_legend(
    title = "Diversity")) +
  expand_limits(x = fifty_states$long, y = fifty_states$lat) +
  coord_map() +
  scale_x_continuous(breaks = NULL) + 
  scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "") +
  theme(legend.position = "bottom", 
        panel.background = element_blank())
p


