# Study of the Relationship between a Particular Type of Heart Disease, Cholesterol Level and Blood Pressure ![visitor badge](https://visitor-badge.glitch.me/badge?page_id=shikaijin/STAT-473-Generalized-Linear-Models.visitor-badge)
## Introduction 

<p>The data given were obtained in study of the relationship between a particular type of heart disease, cholesterol level and blood pressure, where the total number of individuals is fixed in the study. The individuals are cross classified according to three variables: the serum cholesterol (mg/100 cc) at 4 levels, systolic blood pressure (mm Hg) at 4 levels and the heart disease status (Present, Absent). l was interested in examining the nature of the association among these 3 variables. 
Since individuals are cross classified with respect to three factors serum cholesterol, blood pressure and heart disease status with 4, 4 and 2 levels, and I was interested in the association among all three variables, I will then consider methods based on log-linear models for 3-way table with the number of individuals with V = i, W = j and X = k, Y<sub>ijk</sub>, follows 
<p align="center"> Y<sub>ijk</sub> ~ Poisson (μ<sub>ijk</sub>) (1) </p>

I will begin modeling with a saturated log-linear model for 3-way table of form
<p align="center">log μ<sub>ijk</sub> = γ + γ<sub>i</sub><sup>V</sup>+γ<sub>j</sub><sup>W</sup>+ γ<sub>k</sub><sup>X</sup> + γ<sub>ij</sub><sup>VW</sup>  + γ<sub>ik</sub><sup>VX</sup> + γ<sub>jk</sub><sup>WX</sup> + γ<sub>ijk</sub><sup>VWX</sup> (2) </p>
where V denote cholesterol, W denote blood pressure, and Z denote heart disease, with corner point constraints. We know that the saturated model provides prefect fit to data, and we will be looking for a simpler model to describe the relationship among V, W and X. 
	Further, we will then assume the heart disease factor (X) as the response variable, cholesterol level factor (V) and blood pressure factor (W) as the covariates. Under this assumption, we then build a logistic regression model as form 
<p align="center"> log π<sub>n</sub>/(1-π<sub>n</sub> ) = β<sub>0</sub> + β<sub>1</sub>x<sub>n1</sub> + β<sub>2</sub>x<sub>n2</sub> + β<sub>3</sub>x<sub>n3</sub> + β<sub>4</sub>x<sub>n4</sub> + β<sub>5</sub>x<sub>n5</sub> + β<sub>6</sub>x<sub>n6</sub> (3) </p>
where Xn1 =1 if cholesterol level of group n is between 200 - 219 (mg/100 cc) and 0 otherwise, Xn2 =1 if cholesterol level of group n is between 220 - 259 (mg/100 cc) and 0 otherwise, Xn3 = 1 if cholesterol level of group n is ≥ 260 (mg/100 cc) and 0 otherwise, Xn4 = 1 if blood pressure of group n is between 127 – 146 and 0 otherwise, Xn5 = 1 if blood pressure of group n is between 147 – 166 and 0 otherwise and Xn6 =   1, blood pressure of group n is 167+ and 0 otherwise. Then given the number of individuals had heart disease in group n Yn follows
<p align="center">Y<sub>n</sub> ∼ Binomial (m<sub>n</sub>, π<sub>n</sub>) (4)</p>
and this model allows us to explore the association between the response variable and the two explanatory variables.</p>



* Data: [View here](https://github.com/shikaijin/STAT-473-Generalized-Linear-Models/blob/a45cef801a0edcd6bf05971a55a6a241ea689677/heartdisease.txt)
* R Code: [View here](https://github.com/shikaijin/STAT-473-Generalized-Linear-Models/blob/a45cef801a0edcd6bf05971a55a6a241ea689677/GLM.R)
* Paper: [View here](https://github.com/shikaijin/STAT-473-Generalized-Linear-Models/blob/f0969d30faa1aa839e10b735ddf100ba053a54cc/Study%20of%20The%20Relationship%20Between%20a%20Particular%20Type%20of%20Heart%20Disease.pdf)
