# Crafty-chocolate-brand-marketing-analysis

Crafty chocolate brand marketing analysis

Introduction:
  Chocolate is a snack that everyone loves, regardless of age. According to the research report, the global chocolate market share has reached USD 210 billion in 2022 and is expected to continue to grow in the next 10 years (Cadby & Araki, 2022). Compared with the past, the global chocolate market is very competitive, and new brands and new flavors are constantly being launched, giving consumers more choices (Ramli, 2017). At the same time, chocolate brands must accurately analyze and forecast market trends and provide products and services that consumers need in order to maintain and increase their market share in the fiercely competitive market. The data sets used in this report cover consumer information, product ingredients, and marketing performance. By analyzing these data, provide Crafty Chocolate predictions on consumer behavior and directions for future business planning. It will further explain the development and potential opportunities in the chocolate industry.

  The data used in this report is compiled from the collected information and analyzed using the R language. The content is mainly used to analyze the correlation between the data and provide suggestions for future development.

Main body:
At the data age, most of the marketing department are looking for the development of how-to analyze the origin data and trying to find out the relation which can help company to get better understand and predict with their customer's purchase path. This case is going to discuss the chocolate industry by using the statistical methods, which can help the Crafty chocolate company analysis team narrow down the customer base to segment the market and provide further thinking directions for external operation planning.


Segmentation 
According to the 1_demographics data set, which provide the wide range of customers’ personal information. After the data standardization, using cluster method to find out to explore the associations between clusters. First of all, by using R to analysis the data with mean and mode result (Figure.1), it shows that most of the customer are female form United Kingdom, and the age is under 40 years old. Their salary is more than, 10000 British ponds and have high level of regular chocolate consumption.
Managing Customer Heterogeneity
	Age group	gender	salary	Location by
region	chocolate
Consumption	Sustainability
Score
Mean			2.28		3	0.00
Mode	1	2		1		
(Figure.1)

Secondly, after comparing the results of three different clustering analyses, it can be seen that the model-based clustering effect can be more completely classified according to the similar characteristics of customers. By analyzing the BIC curve, it can be known that cluster 1 is the most reasonable choice (see Figure 2).


 
(Figure 2)

Furthermore, the model-based clustering illustrates that the third group exhibited negative correlations with other groups in sustainability. In addition, the average salary of the third group of guests is close to 15,000 pounds, which is also greater than other groups. At the same time, need to pay attention on the group 1, which have the highest chocolate consumption, this group of customers have high-class education and high level of salary, it means that group 1 will become the target customers, therefore Crafty chocolate can offer promo codes to increase their purchase motivation.

 
(Figure 3)

Factor analysis
The factor analysis is using the dataset to discuss and explore correlations among different variables and use factors to describe the relationship (Bandalos & Finney, 2018). When analyzed the file of 2_chocolate_rating, only choose the relevant factor such as organic, rating, sugar, etc. After calculating chosen data, using visualize to illustrate the correlation between these factors (see Figure.4). It has shown that coca butter has highly relevant with sugar and organic. However, sweetener and sugar have been extremely irrelevant. 
 
(Figure.4)

Before discussing the deeply relevant between the factors and brands, there are some unnecessary factors, which can be found from the correlation plot, must have been cleansing in the file. Therefore, after deleted the irrelevant factors such as counts of ingredients, product ID. The cleaned data, which will be used on analysis of the brand positioning map, is providing in the figure 5. 
(Figure 5.)

Component analysis of the filtered factors can demonstrate the correlation between brands and components through the brand positioning map (see Figure 6). According to the infographic, most of the brand get the better subjective rating of the chocolate with adding more sugar. This means that the target customer prefers the sugar more than sweetener. Brand of Bonnat, which gets the highest point at the rating, has a high level of the cocoa percentage, and added coca butter in ingredient. Furthermore, organic is not the key consideration factor when customers purchase chocolate, based on the plot, it shows that most of the customers care more about the taste rather than the other factors. However, there are still gaps in this analysis. For example, the correlation between vectors as the analysis dimension is not strong. The data in this dataset is also insufficient, and it does not cover enough factors to predict consumers’ purchasing motivations.  
(Figure 6)


Sustainable Competitive Advantage
Sustainable competitive advantage is what the company needs to pay attention to in the long-term development, and it can help the enterprise remain competitive in the market. In the following, content will explore how the company can increase market share in the market through conjoint analysis and market basket analysis.

Conjoint analysis
Using conjoint analysis to investigate consumers’ preferences with unique attributes when customer purchase the products. And it can also help chocolate brands to determine the factor that can better satisfy customers’ needs. Before the analysis, the dataset needs to be cleaning by deleting the customer general information. Through x table function, the result illustrates that 3 pounds is the most frequency price of chocolate. Furthermore, 4, 5 and 7 pounds are also having high price competitive in the market.  
 
(Figure.7)

According to the conjoint model, after calculating the p value, the result demonstrates that P <0.05 have the positive influence, therefore most of the element have the significant impact except whether manufacture is developing. Furthermore, price estimate value present negative influence means that most of the customers didn’t like high price.
 
(Figure.8)

After the calculation of a customer willing to pay, the customer would pay more money for the chocolate, which has more energy and the ingredient contain not only nuts but also fruit. Combine the relevant result. In the future chocolate ingredient design, companies can provide more flavors and higher energy, which can better fit their target customers’ needs.

 

Market basket analysis
According to the 6_groceries dataset, through market basket analysis which can analyze the laws of consumers purchasing goods over a period, and to explore the laws through data analysis, to better predict the consumption path of consumers, to improve the shopping experience of consumers and create new business value. A graphical display of the rules will aid in the analysis using the corresponding model. The first 118 rules are plotted using plot (…, method="graph"). The XY vectors represent support and confidence respectively, and the darker the color, the larger the lift value (see figure 9).  
(Figure 9)
As can be seen from figure 10, consumers buy whole milk and butter at the same time with milk chocolate. Therefore, these items can be put together on the product display, so that consumers can buy them all at one time, and joint discount coupons can be launched, for example, if customers buy three products at the same time, they can get a 10% discount. 
(Figure 10)

Explore Figure 10 further. The circles represent the support between different factors. The larger the size and the darker the color, the higher the correlation. Therefore, from this picture, we will focus on the discussion of the relation of other items centered on milk chocolate. A flaw in this analysis, however, is that relationships within items are not categorized. Shopping basket analysis only provides a direction for brand owners to decide, and the actual application must be coordinated with distributors and re-discussed its possibilities. For example, display chocolate products in the same section as dairy products.

Managing Resource Trade-offs
Under the circumstance of limited funds, accurate allocation of resources is very important. How to maximize the effectiveness of resources will be an issue that companies must pay attention to. The following section will focus on marketing response models and marketing experiments with advertisement result in sales channel and a marketing platform. By analyzing the 7_advertising file, we can judge the performance of different marketing channels to provide a plan for future improvement. First, see if each variable has a correlation with sales by looking at the scatterplot for each variable (see Figure 11).
    
 
(Figure 11).
It is clear to see from the infographic that the magazine and newspaper variables didn’t illustrate the correlation, but tv present the liner correlation with the sales. Because of the analysis results, it is found that the relationship between the marketing platform and sales is mostly non-linear, so use the log-log function instead to further explore multiple predictors.
By analyzing the results, the adjusted R-Squared was 0.903, so about 90% of the variance in sales can be analyzed and explained. The formula is: “Log(sales)= 5.07+ 0.145 log (radio)+0.365 log (tv)+ 0.026 log (social media) +....”. By analyzing the p-values of these variables, newspaper, magazine, and social media (p>.05); means that these factors will not have a significant impact on sales. Therefore, these variables can be temporarily removed without further study.  Except for newspaper and search ad, the rest of the platforms have a positive impact on sales. When making comparisons, media synergies will be considered together.

After removing some extraneous variables, the formula output become “log(sales)= equation with interactions” Looking for the estimated score, newspaper and search ad are not good for sales. The other platform mix had a positive impact on increasing sales. TV has the highest score, so it can increase the marketing expenses of TV platform and radio, to achieve better publicity effect. Through more accurate marketing promotion, the limited funds can be maximized. Although this model can discuss the effectiveness of a platform, in practice, companies still need to consider budgeted costs and ROI, monitor the last results from time to time, and make corrections in real time. 

A/B testing
   According to the data file, it provides the information about two versions of advertisements (taste and quality) which could figure out the content detail and provide the more interest content to customers in the future. In this section, use a compression graph to compare two ads and find out how they are related. First of all, after analyzed, the average time spent on both of the ad are almost the same (quality 49.99489 and taste 49.99909). This means that consumers spend similar amounts of time on intuitive content. Moreover, the result shows that shorter video will be more attractive.
 
(Figure 12)
Then, by visualizing the clicked like data (see Figure 12), it can be observed that taste is slightly higher than quality in terms of the percentage of likes, but the content of both articles does not get a high number of likes.

Through cross-comparison of taste and quality in click sharing and click article, taste is better than quality, which shows that consumers are more interested in taste-type advertising content. The results tell that, after refining the advertising content, the company can find that consumers prefer taste-related content. This result provides a new direction in ad design in the future to make it easier to catch consumers’ eye.

The sample size of taste and quality are the same (15000). Therefore, in this stage is going to use calculating the chi-square to test group frequencies. The clicked like and condition will test by chi-square; the result shows that clicked like and condition, p-value < 0.05, so it can be seen that the null hypothesis should be rejected and can show that these two types of ads differ significantly from clicked like. In other view click article and click share respectively perform chi-square test with condition, both of the test result demonstrate p-value > 0.05, which means that the null hypothesis could not be rejected and shows that click article and click share didn’t have significantly different with condition.

To further explore the results of the analysis, ANOVA was used to compare the amount of change between the means of different factors. According to the Figure 13, two ads can easily be compared with a 95% confidence interval for the difference in view time. To sum up, taste is the advertising content that consumers are most concerned about. Therefore, increasing this type of advertising and reducing the quality of advertising content can greatly increase the exposure to an effective budget. Although consumers’ preferences were analyzed, there are still many considerations that have not been discussed. Therefore, in the case of incomplete data, this result can only provide future decision-making directions, and the real implementation still needs to be flexible.
 
(Figure 13)


Future works:
Through the above analysis, the company can have a more in-depth understanding and planning of the chocolate industry. However, the factors discussed are still not comprehensive enough. In the future, various factors can be collected to help find the optimization direction and bring benefits to the company. For a greater competitive advantage. This section will discuss potential opportunities for analysis and possibilities for future commercial development.
From a practical application level, chocolate is often given as a gift besides being eaten by itself. Therefore, related gift-giving data can be added to the data collection and analyzed with festivals, such as Valentine’s Day and Children’s Day. In the analysis and execution, the proportion of chocolate gifts or self-use should be compared, and then combined with the sales data of specific festivals to judge the correlation (such as Kendall Rank, Spearman Rank). Conjoint analysis can explore whether there are commodities that consumers will buy when they choose chocolate, such as wrapping paper, cards. Through the conclusion, bundled promotions can be launched to enhance consumers’ purchase intention. At the same time, limited chocolate gift boxes can be launched for different festivals, such as Valentine’s Day and Halloween. On special festivals, there will be a celebratory atmosphere, which will increase the desire of customers to buy, and then achieve the effect of festival marketing.
In recent years, online shopping has become popular, and it is particularly important to build recommendation systems and AI chatbots on websites. A good recommendation system can allow consumers quickly find out the products they want, while AI chatbots can instantly answer consumers’ questions and speed up the purchase process (Sivapalan et al., 2014). According to Dabrowski, M. and Acton, T. mention in 2013, when customers shop online, they rarely determine the products they want to buy, so they will spend a lot of time browsing the products, and there will be many questions need to be solved, such as arrival time, shelf life. Therefore, perfect website services which can improve the consumer experience and enhance the competitiveness of the brand (Sugandini et al., 2018). Such data can be collected by web cookies and federated by Google’s Federated Learning of Cohorts system to help analyze consumers’ needs and predict their shopping habits (Mammen, 2021). This type of analysis can help brands add value to their products while enhancing their brand image.
In addition, when choosing a store location, relevant data analysis can ensure the operation and capital operation of the company. There are many factors to consider when choosing a storefront, such as rent, the flow of people, and surrounding consumer groups. This type of data can be collected through questionnaires, field visits, and the Google business profile API. Further analysis of such data (Heat Map, ggmap), and cross-comparison with chocolate types, can find the most suitable store (Evangelista & Beskow ,2018). Site selection analysis can reduce operating costs and maximize operating results while ensuring profits.

To sum up, the era of data is taking place, with massive amounts of data and ever-increasing consumer demands. How Craft chocolate brand use data to satisfy consumers and improve their company’s operations will be the focus of attention in the future. Although data can bring new development possibilities, it also has privacy risks. Therefore, in the future use of data, companies must be more careful and protect consumers’ rights while exploring potential developments, so that brands can develop in the long run (Han, et al., 2019).
