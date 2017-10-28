# Exploring Diversity of State Legislators

What are the signatures of legislator diversity within legislation? While we typically consider differences in political affiliation  among elected officials in Congress, I predict that legislature diversity at a finer-scale (e.g., age differences, male to female ratio, differences in occupation, race, religious beliefs, etc.) will also influence legislative products: the text, voting, and enactment of bills. group dynamics and writing for the audience



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
 
