# Exploring Diversity of State Legislators

What are the signatures of legislator diversity within legislation? While we often focus on differences in political affiliation among elected officials in Congress (e.g., Republican vs. Democrat), I predict that legislature diversity at a finer-scale (e.g., age differences, male to female ratio, differences in occupation, race, religious beliefs, etc.) will also influence legislative products: the text, voting, and enactment of bills. 

For instance, the proportion of women in Congress may influence the number of bills that are related to women's health and domestic violence programs. In addition, the text of bills may vary with legislature diversity since these bills should be written for their particular audiences. Bills that are proposed in a Congress that is primarily full of older, white men should have a slightly different phrasing compared to bills presented in a more diverse Congress. Furthermore, diversity influences group dynamics and thus a more diverse Congress may be more productive (more bills are proposed and/or enacted) or have more votes without a clear majority (since the legislators should have more variable viewpoints) than a less diverse Congress. 

While, I acknowledge that political affiliation and diversity are most likely linked (e.g., people of color are more likely Democrat), I still predict that finer-scaled diversity should have a noticeable influence on bill text, voting, and enactment. I propose to study the effects of both diversity in party affiliation and fine-scaled diversity on legislation to tease apart these two factors.

I am interested in this topic, because as an educator I know the importance of group dynamics and how much these dynamics can shift with the addition or subtraction of just one person. Thus, I find the group dynamics of Congress fascinating! How does this group of people who are supposed to represent their constituents interact with each other and work with or against each other? Since, particular person-to-person interactions are not easy to assess, I think mining publicly available information on Congressional products (e.g., bill text, voting records, etc.) can act as a proxy measure for these group dynamics. I also find this interesting because the diversity among Congressmen and women rarely represent their constituents. Thus, how does this influence their work? Are Congresses that more closely resemble their constituents more productive, for instance?

To shed light on these questions, I am exploring 2015 congressional data across all 50 states. I have collected diversity metrics for each state Congress (e.g, proportion of representatives and senators that are women) from the [National Conference of State Legislatures](http://www.ncsl.org/research/about-state-legislatures/who-we-elect-an-interactive-graphic.aspx#). For this pilot study, I have also collected short summaries of all of the bills that were presented in the regular 2015-16 congressional sessions for a subset of states with varying legislature diversity. These data were scraped from [openstates.org](https://openstates.org/). For the full study, I plan to scrape the complete bill text from the archives of state congressional websites and voting records.

With this project, I plan to investigate the following questions:

1. How does the diversity (using metrics shown below) of legislatures vary across states? 
   * Generation (Millenials, GenX, Boomers, Silent, and Greatest)
   * Male:Female
   * Education level (high school, bachelors, advanced)
   * Occupation (agriculture, business, attorney, etc.)
   * Race (Native American, African American, Asian American, etc.)
   * Religion (Protestant, Catholic, Unspecified)
   * Political affiliation (Democrat, Republican, Other)
     * Analyses = I will calculate euclidean distances between pairs of states to determine how similar or different states are to each other in terms of congressional diversity. I will display these data as a clustered heatmap. I will then also plot these data using non-metric multidimensional scaling with overlaid vectors that show how the particular metrics of diversity (e.g., generation) vary across state legislators. Lastly, I will calculate Shannon diversity indices for each state legislature which takes into account both richness (the number of different represented categories, e.g., Protestant, GenX, etc.) and evenness across categories. The Shannon index scores will then be used in subsequent analyses.

2. How does the diversity of a state's legislature influence:
   * Bill productivity (number of bills in a given session), voting records (e.g., how many votes are ties?), and how many bills are enacted vs. withheld 
     * Analyses = I will perform regression analysis with the fine-scaled diversity metrics and Shannon index as predictor variables. 
   * Topics/text of bills 
     * Text analyses = I will investigate shared word frequency with correlations between pairs of state legislatures that are more similar or more different in diversity based on the above euclidean distances. These tests will help determine whether two state legislatures that are more or less similar in terms of diversity also have more or less similar bill text. I will also create n-gram networks for the text of bills from state legislatures that are at the diversity extremes based on their Shannon index values. To help tease apart the effects of fine-scale and party diversity, I will rerun these analyses (1) comparing pairs of states with more similar or different party makeups and (2) comparing text of bills from state legislatures that are at party extremes (i.e., Republican- or Democrat-dominated legislatures and legislatures that are fairly split across parties). I can then compare the results to see how much of the fine-scaled diversity trends are linked to party affiliation.
     * Secondary questions:
       * Can we predict bill enactment based on bill text?
       * Can we predict party authorship (Republican, Democrat, other) based on bill text?
 
3. What is the relationship between diversity in state legislatures and diversity in the state populace?
   * Do state legislators reflect the diversity of the population they are supposed to represent?
     * Analysis = I will use multivariate correlation (Procrustes) to determine how much of the variation in diversity in the state legislatures is explained by the diversity in the state populace. I will also use euclidean distance to determine how different these two populations are from each other across states.

4. How does gerrymandering influence legislature diversity? 
   * Case study with Wisconsin (partisan gerrymander) and North Carolina (racial gerrymander)
     * I will collect congressional information from 2008 (before gerrymandering events) and compare this with the 2015 diversity data. I can calculate Shannon index values and euclidean distances to see how the diversity in the state's legislature may have changed before and after gerrymandering.
 
Data sources (for the pilot study):
   * State legislature diversity data are from the [National Conference of State Legislatures](http://www.ncsl.org/research/about-state-legislatures/who-we-elect-an-interactive-graphic.aspx#)
   * State bill information was scraped from [openstates.org](https://openstates.org/)

 
