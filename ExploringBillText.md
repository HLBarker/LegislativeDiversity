Exploring differences in bill text: do more diverse state legislatures propose different kinds of legislation compared to more uniform legislatures?
====================================================================================================================================================

<img src="ExploringBillText_files/figure-markdown_github/diversity map-1.png" style="display: block; margin: auto;" />

Figure 1.
---------

Map of differences in Shannon diversity across state legislatures in 2015. Red represents low diversity and blue is high diversity. It is interesting to note that differences in legislature diversity do not fall directly in line with differences in state party majorities/control. For instance, Arizona's Congress was under Republican control and it also had one of the most diverse state legislatures. Conversely, Colorado, Minnesota and Oregon all had either Democrat-controlled or split legislatures in 2015, yet they had some of the least diverse state legislatures.

<img src="ExploringBillText_files/figure-markdown_github/diverse bigram graph-1.png" style="display: block; margin: auto;" />

Figure 2.
---------

Network of common ngrams that were selected from summaries of proposed bills (data scraped from [openstates.org](https://openstates.org/)) in states with diverse legislators. The bill summaries were collected for bills that were presented in either the state's House or Senate in the 2015 regular session. Data were collected from a subset of the three most diverse states: Arizona, New Mexico, and Maryland.

<img src="ExploringBillText_files/figure-markdown_github/not diverse bigram graph-1.png" style="display: block; margin: auto;" />

Figure 3.
---------

Network of common ngrams that were selected from summaries of proposed bills (data scraped from [openstates.org](https://openstates.org/)) in states with the least diverse legislators. The bill summaries were collected for bills that were presented in either the state's House or Senate in the 2015 regular session. Data were collected from a subset of the three least diverse states: West Virginia, New Hampshire, and Tennessee.

As shown in the ngram networks, diverse state legislatures considered bills that focused on economic development, natural resources, income tax, and safety. Conversely, more uniform legislatures considered bills focused on retirement benefits, controlled substances, utilities, community development, Title IV (federal financial aid funds) and election laws. Both addressed bills on health and safety, alcoholic beverages, law enforcement, workers compensation, and motor vehicles.

A caveat with these analyses is that the bills are not independent of each other and the unique effects of each state is likely influencing the data. Typically, I incorporate this non-independent structure with multi-level mixed models, where the variation from the random effect of state would be accounted for and the remaining variation could explain differences between diverse and uniform legislatures. Ideally, I need to create a way to adapt this multi-level approach for text analyses.
