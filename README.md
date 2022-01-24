# A Primer on Binary Logistic Regression (in R)

This repository contains the statistical source code for the logistic regression primer by Jenine K. Harris. If you are new to R, follow the instructions below to install the appropriate software and download the source code.

(Update January 24, 2022) The repository now also contains the Stata code and data files to reproduce the analyses. The files are called **lab 2 data.dta** and **Lab 2 do file.do**. These files were contributed by <a href = "mailto:sdoi@qu.edu.qa">Suhail A. R. Doi</a> and <a href = "mailto: tchivese@qu.edu.qa">Tawanda Chivese</a> of the College of Medicine at Qatar University in Doha, Qatar. 

### Getting Started in R

R is a statistical software that is <a href = "https://www.r-project.org">free, open-source, and can run on most operating systems</a>. This means that anyone in the world with access to a computer and the internet can use it and anyone in the world can contribute to the development of new tools in R. 

R can do everything that paid statistical software like SPSS and SAS can do, and often more! <a href = "http://r4stats.com/2019/05/28/data-science-jobs-report-2019-python-way-up-tensorflow-growing-rapidly-r-use-double-sas/">Analysis of data on job openings and other metrics</a> shows that R is increasingly included as a desired or required skill, often surpassing traditional closed source software like SPSS and SAS. R is particularly great for **data management** and developing amazing **data visualizations**.

### Install R and RStudio

R is the software and RStudio is the IDE (Interactive Development Environment) that makes R easier to use. Install R **before** you install RStudio because RStudio will look for R during installation.

First, download and install R:

<ul>
  <li> Click the <b>download R</b> link on the <a href = "https://www.r-project.org">R Project for Statistical Computing</a> website
  <li> Choose one of the options from the <a href = "https://cran.r-project.org/mirrors.html">CRAN Mirrors</a> list (it doesn't matter which one!)
  <li> Click on the download that is appopropriate for your operating system, Linux, Mac, or Windows; if you are not given this option, go back to the <a href = "https://cran.r-project.org/mirrors.html">CRAN Mirrors</a> and try a different one
  <li> Find the link for <b>install R for the first time</b> and click on it
  <li> Click on the the <b>Download R</b> link on the page that opens
  <li> Use the installer that downloads to install R 
</ul>

Second, download and install RStudio:

<ul>
  <li> Go to the RStudio <a href = "https://rstudio.com/products/rstudio/download/"> downloads page</a> 
  <li> Click on the DOWNLOAD button under the RStudio Desktop column on the downloads page
  <li> Choose the Download for the operating system you have and click on it  
  <li> Use the installer that downloads to install RStudio 
</ul>

### Download and save R code file

Download the code file:

<ul>
<li> Click on the green Code button toward the top of this GitHub page
<li> Choose Download ZIP
<li> Unzip the downloaded zip file and save all the files in a single folder on your computer
</ul>

### Install the tidyverse, finalfit, knitr, car, odds.n.ends, and table1 packages

Open RStudio and follow these instructions :

<ul>
<li> Click on the Tools menu
<li> Type <b>tidyverse, table1, finalfit, knitr, car, odds.n.ends</b> into the dialog box that opens
<li> Click install (R will do stuff for a while, this might look like errors but is fine)
</ul>

### Open, highlight, and run the downloaded R code file
