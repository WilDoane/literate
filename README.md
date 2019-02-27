# literate

The goal of literate is to convert heavily commented R scripts into a more human-reader-friendly style

## Installation

<!--You can install the released version of literate from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("literate")
```
-->

YTou can install the development version of literate from [Github](https://github.com/WilDoane/literate) using devtools:

```r
if (!require(devtools)) install.packages("devtools", dependencies = TRUE)
devtools::install_github("WilDoane/literate")
```

## Purpose

This is a very early stage hack to present heavily commented R scripts in a style where code comments are visually distinct from executable code. The intent is two-fold: (1) to allow programmers to code and comment as they always do and (2) to represent the code in a way that may be more easily understood by novice programmers.

There is a pedagogical intent here: to facilitate the inclusion of full-text descriptions of code purpose and function in order to be able to lead human readers through the programmer's reasoning and intent.

## Use

This package installs an add-in to RStudio. To use it, open an R script in RStduio's source code editor, then select **Literate** from the Addins menu. This will generate an HTML file which will open in the RStudio Viewer pane or in your local default web browser.

![Example of literate output](/images/sample.png?raw=true "Literate output")

## Options

Users can override the default color, background-color, and font-family CSS properties used by literate by setting R options:

options(literate.code.font.family = "Arial")
options(literate.code.color = "#ffffff")
options(literate.code.background.color = "#999999")
options(literate.comments.font.family = "serif")
options(literate.comments.background.color = "#cccccc")
options(literate.comments.color = "#0000cc")



