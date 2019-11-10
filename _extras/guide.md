---
title: "Instructor Notes"
---

----

(Hugo's notes)

My idea is to have two objectives going in parallel: 

- teach R syntax
- teach EDA concepts and principles

In that sense, R is being taught as a _tool_ for data analysis. 
I would not aim to teach _programming_, thus the choice of focusing on `tidyverse`
(although this choice is somewhat debatable, we could just as easily have chosen 
`data.table` or even base R).

I'm hoping that eventually the materials are rooted in a higher-level conceptual framework, inspired by: 

- [The Art of Data Science](https://leanpub.com/artofdatascience), by Roger D. Peng and Elizabeth Matsui
- [Elements and Principles for Characterizing Variation between Data Analyses](https://arxiv.org/abs/1903.07639), by Stephanie C. Hicks and Roger D. Peng

----

#### Session 1:

This session is about getting started with working with data in R + RStudio:

- how to setup and organise an analysis project
- using functions and access their documentation
- import tabular data into R
- understand and distinguish between the fundamental data structures and data types in R
- discuss the importance of and apply basic quality control checks of data


#### Session 2:

This session is all about the visual display of information:

- recognise the necessary elements to build a plot using the `ggplot2` package
- use `ggplot2` to produce several kinds of visualisations (for continuous and/or discrete data)
- distinguish which types of visualisation are adequate for different types of data and questions
- discuss the importance of scales when analysing and/or visualising data


#### Session 3:

This session is about starting to manipulate tables and cleaning up data:

- use of the `dplyr` package to manipulate tabular data (add or modify variables, select and rename columns)
- understand and use "pipes" as a way to build a chain of operations on data
- discuss some common issues with data cleaning and use functions from the `stringr` package to help solve them
- discuss how to deal with missing data


#### Session 4:

This session is about subseting data based on specific questions or conditions:

- introduction to logical comparisons and logical data type
- remember and distinguish between different types of logical operators
- choose the right conditional operations to obtain specific observations from data using the `filter()` function
- apply conditional operations to clean data mistakes and/or highlight elements of interest in graphs using the `ifelse()` function
- how to save processed data into a file


#### Session 5:

This session is about working on sub-groups of data:

- recognise when to use grouped operations in data analysis
- differentiate between grouped summaries and other types of grouped operations
- apply grouped summaries using the `group_by()` + `summarise()` functions
- apply other grouped operations such as: `group_by()` + `filter()` and `group_by()` + `mutate()`
- recognise the importance of the `ungroup()` function


#### Session 6:

This session is about combining different datasets together and how to modify the "shape" of our data:

- understand and apply functions that _reshape_ data from "long" to "wide" formats
- appreciate when each format is useful and which one to choose for the intended tasks
- join different datasets together
- distinguish between different ways to join data, and understand which one to choose depending on the desired outcome


{% include links.md %}
