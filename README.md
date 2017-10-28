# Exploring Diversity of State Legislators

What are the signatures of legislator diversity within legislation? While we often focus on differences in political affiliation among elected officials in Congress (e.g., Republican vs. Democrat), I predict that legislature diversity at a finer-scale (e.g., age differences, male to female ratio, differences in occupation, race, religious beliefs, etc.) will also influence legislative products: the text, voting, and enactment of bills. 

For instance, the proportion of women in Congress may influence the number of bills that are related to women's health and domestic violence programs. In addition, the text of bills may vary with legislature diversity since these bills should be written for their particular audiences. Bills that are proposed in a Congress that is primarily full of older, white men should have a slightly different phrasing compared to bills presented in a more diverse Congress. Futhermore, diversity influences group dynamics and thus a more diverse Congress may be more productive (more bills are proposed and/or enacted) or have more votes without a clear majority (since the legislators should have more variable viewpoints). 

While, I acknowledge that political affiliation and diversity are most likely linked (e.g., people of color are more likely Democrat), I still predict that finer-scaled diversity should have a noticeable influence on bill text, voting, and enactment. I propose to study the effects of both diversity in party affiliation and fine-scaled diversity on legislation to tease apart these two factors.

I am interested in this topic, because as an educator I know the importance of group dynamics and how much these dynamics can shift with the addition or subtraction of just one person. 

Thus, I find the group dynamics of Congress fascinating! How does this group of people who are supposed to represent their constituents interact with each other and work with or against each other? Since, particular person-to-person interactions are not easy to assess, I think mining publicly available information on Congressional products (e.g., bill text, voting records, etc.) can act as a proxy measure for these group dynamics. I also find this interesting because the diversity among Congressmen and women rarely represent their constituents. Thus, how does this influence their work? Are Congresses that more closely resemble their constituents more productive, for instance?

To shed light on these questions, I am exploring congressional data 



Propose a project that uses a large, publicly accessible dataset. Explain your motivation for tackling this problem, discuss the data source(s) you are using, and explain the analysis you are performing. At a minimum, you will need to do enough exploratory data analysis to convince someone that the project is viable and generate two interesting non-trivial plots supporting this.


1. How does the diversity of legislatures vary across states? (unstructured data analysis)
   * Generation (Millenials, GenX, Boomers, Silent, and Greatest)
   * Male:Female
   * Education level (high school, bachelors, advanced)
   * Occupation (agriculture, business, attorney, etc.)
   * Race (Native American, African American, Asian American, etc.)
   * Religion (Protestant, Catholic, Unspecified)
   * Political affiliation (Democrat, Republican, Other)
     * Analyses = heatmap of dissimilarity matrix, Shannon index of diversity

2. How does the diversity of a state's legislature influence:
   * Bill productivity (number of bills in a given session)
   * How many bills are enacted vs. withheld 
   * Topics of bills (e.g., how many bills are related to criminal justice?)
     * Text analyses = can we predict legislator diversity based on bill text?
     * Secondary questions:
       * Can we predict bill enactment based on bill text?
       * Can we predict party authorship (Republican, Democrat, other) based on bill text?
 
3. What is the relationship between diversity in state legislatures and diversity in the state populace?
   * Do state legislators reflect the diversity of the population they are supposed to represent?
     * Analysis = multivariate correlation (Procrustes) 

4. How does gerrymandering influence legislature diversity? 
   * Case study with Wisconsin (partisan gerrymander) and North Carolina (racial gerrymander)
 
Data sources:
   * State legislature diversity data are from the [National Conference of State Legislatures](http://www.ncsl.org/research/about-state-legislatures/who-we-elect-an-interactive-graphic.aspx#)
   * State bill information was scraped from [openstates.org](https://openstates.org/)
   * Wisconsin and North Carolina 2006 legislature diversity information was collected from Wikipedia, VoteSmart, and Ballotpedia
 
