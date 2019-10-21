---
title: Setup
---

If you have any problems with software installation or dowloading data, please 
contact your instructors before the course.

## Software installation

- Download and install R ([here](https://cran.r-project.org/))
- Download and install RStudio ([here](https://www.rstudio.com/products/rstudio/download/#download))
- Install necessary R packages: 
  - open RStudio and from the upper menu press <kbd>Tools</kbd> > <kbd>Install Packages...</kbd>
  - under "Packages" type: `tidyverse,naniar`
  - press <kbd>Install</kbd>

Make sure you test your installation by doing the following:

- Open RStudio
- On the panel called "Console" type `library(tidyverse)` and press <kbd>Enter</kbd>

A message should print starting with "Attaching packages", etc. 

If instead you get the message: 
`Error in library(tidyverse) : there is no package called ‘tidyverse’`, 
then your package installation did not work. Please ask the instructors for 
assistance before the course. 


#### Setting up RStudio

After installing RStudio, change some of its default options (you only need to 
do this once): 

- From the upper menu go to <kbd>Tools</kbd> > <kbd>Global Options...</kbd> 
- _Untick_ the option "Restore .RData to workspace on startup."
- Change "Save workspace to .RData on exit" option to "Never"


## Getting data

On your computer create a folder called `r-workshop` (or other name of your choice).
Within that folder create a folder called `data` and within that another folder called 
`raw`. Schematically:

```
r-workshop/
└── data
    └── raw
```
<p></p>

Download the following files and save them in the `data/raw` folder (<kbd>right-click</kbd> 
the file link and choose "Save link as..."):

- [Gapminder socio-economic dataset 2010](https://github.com/tavareshugo/r-eda-gapminder/raw/gh-pages/_episodes_rmd/data/gapminder2010_socioeconomic.csv)
- [Gapminder socio-economic dataset 1960-2010](https://github.com/tavareshugo/r-eda-gapminder/raw/gh-pages/_episodes_rmd/data/gapminder1960to2010_socioeconomic.csv)
- [Gapminder energy dataset 1960-2010](https://raw.githubusercontent.com/tavareshugo/r-eda-gapminder/raw/gh-pages/_episodes_rmd/data/gapminder1960to2010_energy.csv)


{% include links.md %}
