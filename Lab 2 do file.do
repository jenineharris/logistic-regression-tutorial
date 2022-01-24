***Logistic regression

***rename variables from the mtcars
rename vs lungCancer 
rename mpg yearsSmoke 
rename am bmi 

label define lungca 0 "No lungCA" 1 "lungCA"
label values lungCancer lungca
label define bmi 0 "Underweight or Normal" 1 "Overweight or Obese"
label values bmi bmi

***Table 1
tab1 lungCancer bmi
sum yearsSmoke, 

***Fig 1
histogram yearsSmoke


***Table 2
tab bmi lung, col
sort lung
by lung: tabstat yearsSmoke, stat(median p25 p75)

***Checking linearity assumptions - Fig 2


