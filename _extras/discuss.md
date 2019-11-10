---
title: Data Tips
---

## Data Tips

> ## Organising your Analysis Project
> 
> A key step for a successful analysis is to start with a tidy directory structure. 
> This ensures that you can keep track of what each file is and can avoid many 
> headaches when analysis gets more complex. 
> 
> Here's some practical suggestions: 
> 
> - Early in your project create a few sub-directories such as `scripts`, `data/raw`, 
>   `data/processed`, `figures` and any others that might be relevant for your specific 
>   work. 
> - To ensure reproducibility, save your code in _scripts_ and define file paths 
>   _relative_ to your project's folder.
> - Keep your raw data separate from processed data, so that you can go back to it 
>   if needed. 
> - In RStudio specifically, you can create an "R Project" within your project's folder 
>   (<kbd>File</kbd> > <kbd>New Project...</kbd>). This will ensure you always have 
>   the right working directory set up.
{: .discussion}

> ## Variable Types
> 
> In data we often have variables (i.e. columns in a table) of different types. 
> An important step when starting your analysis is to recognise which kind each 
> variable is. 
> 
> - Categorical
>   - nominal (non-ordered categories) - e.g. country
>   - ordinal (ordered categories) - e.g. "low < medium < high", ratings in surveys, Likert scale
>   - binary (True/False, Yes/No, 1/0)
> - Numerical
>   - continuous (any real number) - e.g. height, time
>   - discrete (whole numbers) - e.g. counts
{: .discussion}


> ## Quality Control Checks
> 
> Whenever you read data into R, it's always good practice to do some quality 
> checks. Here's a list of things to lookout for:
> 
> - Do you have the expected number of rows and columns?
> - Are your variables (columns) of the expected type? (e.g. numeric, character)
> - Is the range of numeric data within expected boundaries? For example: a column with 
> months should go from 1 to 12; a column with human heights in cm should not 
> have values below 30 or so; etc...
> - Do you have the expected number of unique values in categorical (character) variables?
> - Do you have missing values in the data, and were these imported correctly?
> 
> In R, you can answer many of these questions with the help of the following 
> functions: `str()`, `summary()`, `length()` + `unique()`, `nrow()`, `ncol()`, 
> `is.na()`.
> 
> There are also some R packages that can help making these diagnostic analysis 
> easier. One good one is the `skimr` package (which has a good 
> [`introduction document`](https://cran.r-project.org/web/packages/skimr/vignettes/Using_skimr.html). 
> If you use the `skim()` function with your `data.frame` it will give you a tabular 
> summary that will help you answer all these questions in one go!
{: .discussion}


## Further reading

- [Cheatsheets for dplyr, ggplot2 and more](https://www.rstudio.com/resources/cheatsheets/)
    - [dplyr cheatsheet](https://github.com/rstudio/cheatsheets/raw/master/data-transformation.pdf)
    - [ggplot2 cheatsheet](https://github.com/rstudio/cheatsheets/raw/master/data-visualization-2.1.pdf)
- [Data-to-Viz](https://www.data-to-viz.com/) website with great tips for choosing the right graphs for your data
- [Summary of dplyr functions and their equivalent in base R](https://tavareshugo.github.io/data_carpentry_extras/base-r_tidyverse_equivalents/base-r_tidyverse_equivalents.html)


**Reference books:**

- Holmes S, Huber W, [Modern Statistics for Modern Biology](https://www.huber.embl.de/msmb/) - covers many aspects of data analysis relevant for biology/bioinformatics from statistical modelling to image analysis.
- Peng R, [Exploratory Data Analysis with R](https://bookdown.org/rdpeng/exdata/) - a general introduction to exploratory data analysis techniques.
- Grolemund G & Wickham H, [R for Data Science](http://r4ds.had.co.nz/) - a good follow up from this course if you want to learn more about `tidyverse` packages.
- McElreath R, [Statistical Rethinking](https://xcelab.net/rm/statistical-rethinking/) - an introduction to statistical modelling and inference using R (a more advanced topic, but written in an accessible way to non-statisticians).
    - Also see the [lecture materials](https://github.com/rmcelreath/statrethinking_winter2019), which include access to the draft of the book's second edition. 
-  James G, Witten D, Hastie T & Tibshirani R, [Introduction to Statistical Learning](http://www-bcf.usc.edu/~gareth/ISL/) - an introductory book about machine learning using R (also advanced topic).
    - Also see [this course material](https://lgatto.github.io/IntroMachineLearningWithR/) for a practical introduction to this topic.


{% include links.md %}
