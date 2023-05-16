# Air Pollution and Respiratory Disease Mortality 
Air pollution is a complex and multifaceted issue that affects not only human health but also the environment and ecosystems. The sources of air pollution are diverse and include industrial activities, transportation, and natural phenomena such as dust storms and wildfires. The effects of air pollution on human health are particularly concerning, as respiratory diseases such as asthma, chronic obstructive pulmonary disease (COPD), and lung cancer have been linked to long-term exposure to air pollutants. The severity of the health impacts of air pollution varies depending on a variety of factors, including the type and concentration of pollutants, the duration of exposure, and the susceptibility of the population. Despite efforts to reduce air pollution levels, it remains a significant public health concern globally. In this research proposal, we aim to investigate the relationship between air pollution and respiratory disease mortality using data from different countries worldwide. We hypothesize that as air pollution levels increase, the number of deaths related to respiratory diseases in a country also increases. We will use data on air pollution indices and respiratory disease-related death counts to analyze this relationship. Additionally, we will review existing literature on this topic to build our arguments and identify gaps in knowledge that our research can address.
# Method:
The study will collect data on air pollution levels and respiratory related deaths from a representative sample of countries over a period of time, while controlling for confounding variables such as age, smoking status, and socioeconomic status. A statistical analysis, such as a regression analysis, will then be performed to estimate the effect of air pollution on respiratory related deaths, while adjusting for the effects of the confounding variables. Based on these studies, I propose to use a regression analysis to model the impact of air pollution on deaths related to respiratory diseases, as well as to include other variables which also might impact the number of deaths related to respiratory diseases in a country, such as smoking rates, access to healthcare, and demographic factors. By doing so, I hope to provide additional evidence to inform policies aimed at reducing air pollution and improving respiratory health outcomes.
# Data: 
All data pulled from Our World in Data (https://ourworldindata.org).
# Model:
Mortality = β0 + β1 * air_pollution + β2 * GDP + β3 * smoking_rate + β4 * hosp_density + β5 * gov_exp + ε
## Variables:
Mortality: The dependent variable represents the number of respiratory disease-related deaths in a country over a specific time period.
Air Pollution: The main independent variable is a measure of air pollution, such as the concentration of particulate matter (PM2.5 or PM10) or specific air pollutants (ozone, nitrogen dioxide, sulfur dioxide).
Socioeconomic Factors: These variables capture the socioeconomic characteristics of the country, such as GDP per capita, education level, and income inequality. They may affect both exposure to air pollution and health outcomes.
Demographic Factors: Variables including age distribution, population density, and urbanization rate are considered to account for demographic variations that may influence respiratory health and mortality.
Other Control Variables: Additional factors that can impact mortality rates are included as control variables, such as healthcare expenditure, smoking prevalence, temperature, and weather patterns.
# Results:
1. Coefficients: The estimated coefficients represent the relationship between each predictor and the response variable. For example, the coefficient for `GDP` is 8.842e-04, indicating that for a one-unit increase in `GDP`, the `Respiratory_Deaths` is expected to increase by 8.842e-04 units, holding other predictors constant.

2. Significance of Coefficients: The p-values associated with each coefficient indicate the statistical significance of the relationship. In this model, `GDP`, `PM2.5_Pollution`, `Smoking_Prevalence`, and `Health_Expenditure` have p-values less than 0.05, suggesting that they are statistically significant predictors of `Respiratory_Deaths`. The coefficient for `Hospital_Beds` is not statistically significant as its p-value is 0.167.

3. R-squared: The R-squared value (0.7901) represents the proportion of variance in the response variable (`Respiratory_Deaths`) that can be explained by the predictors in the model. In this case, approximately 79.01% of the variability in `Respiratory_Deaths` is accounted for by the predictors.

4. Adjusted R-squared: The adjusted R-squared value (0.7871) adjusts the R-squared value based on the number of predictors and the sample size. It penalizes the inclusion of irrelevant predictors and rewards the inclusion of relevant predictors. The adjusted R-squared is slightly lower than the R-squared value, indicating that the inclusion of all the predictors may not significantly improve the model fit.

5. F-statistic: The F-statistic tests the overall significance of the regression model. In this case, the F-statistic is 264.2 with a p-value less than 2.2e-16, indicating that the model as a whole is statistically significant.

6. Residual standard error: This is the estimated standard deviation of the residuals, which represents the average distance between the observed `Respiratory_Deaths` values and the predicted values by the model. In this case, the residual standard error is 9.517.

Overall, the regression model shows a statistically significant relationship between `Respiratory_Deaths` and the predictors `GDP`, `PM2.5_Pollution`, `Smoking_Prevalence`, and `Health_Expenditure`. However, the coefficient for `Hospital_Beds` is not statistically significant. The model explains approximately 79.01% of the variability in `Respiratory_Deaths`, suggesting that these predictors have a reasonably good fit for predicting `Respiratory_Deaths`.
## Literature Referenced:
Brunekreef, B., & Holgate, S. T. (2002). Air pollution and health. The Lancet, 360(9341), 1233-1242.
Jerrett, M., et al. (2009). Long-term ozone exposure and mortality. New England Journal of Medicine, 360(11), 1085-1095.
Katanoda, K., et al. (2013). An association between long-term exposure to ambient air pollution and mortality from lung cancer and respiratory diseases in Japan. Environmental Health, 12, 43.
Pope III, C. A., et al. (2004). Cardiovascular mortality and long-term exposure to particulate air pollution: epidemiological evidence of general pathophysiological pathways of disease. Circulation, 109(1), 71-77.
Samet, J. M., et al. (2000). Fine particulate air pollution and mortality in 20 US cities, 1987–1994. New England Journal of Medicine, 343(24), 1742-1749.

