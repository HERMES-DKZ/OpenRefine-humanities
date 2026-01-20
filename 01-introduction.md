---
title: "Introduction to OpenRefine"
teaching: 0
exercises: 0
---

:::::::::::::::::::::::::::::::::::::: questions 

+ What is OpenRefine and how can it help with messy data?
+ What kinds of tasks and analyses can you perform with OpenRefine?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

+ Explain what OpenRefine is
+ Explain the key-features of OpenRefine

::::::::::::::::::::::::::::::::::::::::::::::::



::::::::::::: discussion

### Discussion: Do you often work with digital data in your research, your studies or your work?

For example, cleaning it, processing it, converting it or analyzing it?
Do you have an idea what problems could arise when working with data, especially external data?

::::::::::::::::::::


Good data organization is the foundation of any research project. In the humanities, you might work with lists of artworks, artists, historical events, or other information collected from museums, archives, or fieldwork. Often, this data is stored in spreadsheets or tables, and at first glance, it may seem tidy. But as you look closer, you may notice small issues: names spelled in different ways, missing details, or dates written in various formats. These challenges are common and can make it difficult to analyze or share your data.

OpenRefine is a free, open-source tool designed to help you work with messy data. Think of OpenRefine as a workbench for your data, a place where you can clean, organize, and explore information, even if you have no technical background. OpenRefine runs locally on your computer and opens in your web browser, providing a user-friendly interface that guides you through each step. Working in your web browser might be confusing, but nothing of your data will be in the internet, everything runs local.


## Advantages of OpenRefine

With OpenRefine, you can import your data, discover patterns, fix mistakes, and transform your information so it’s ready for analysis or sharing. You don’t need to know how to code or use complicated software. OpenRefine is built for researchers who want to focus on their work, not on technical details.

One of the strengths of OpenRefine is its ability to help you explore your data and perform simple analysis right from the start. You can quickly filter and sort your data, group similar entries, and visualize distributions to spot trends or outliers. This makes it easy to get a sense of your dataset before diving deeper into research questions. You can also use built-in functions to split or merge columns, remove duplicates, and transform data formats, making your information more consistent and reliable.

OpenRefine supports a wide range of data formats, including CSV, Excel, and JSON, and can connect to online sources and databases. Its reconciliation feature allows you to match your data against external databases, such as Wikidata, to enrich your dataset with additional information. Because OpenRefine is open source, it can be extended with add-ons and custom scripts, giving you even more possibilities. The active community around OpenRefine has developed many plugins that add new features, such as connecting to other data sources, exporting to different formats, or automating repetitive tasks.


## Our Dataset

Throughout this lesson, you will use a sample dataset from the Museum of Modern Art (MoMA). This real-world data will help you learn how to use OpenRefine to solve common problems in humanities research. Even if you have never worked with data before, you will see how OpenRefine can make your research easier, more accurate, and more enjoyable.

Much of your time as a researcher will be spent in the initial cleaning stage, where you need to organize and clean your data before you can analyze it. It’s not always the most exciting part, but it is essential. With OpenRefine, you will learn how to think about data organization and develop practices for more effective data cleaning. By the end of this lesson, you will feel confident using OpenRefine to clean, explore, and analyze your own data. You don’t need to be a technical expert, just curious and willing to try something new.








::::::::::::::::::::::::::::::::::::: challenge

### Challenge: Spot the Messy Data

Look at the small sample below. It contains only a few records from the MoMA dataset you will work with later.  
Identify anything that might cause problems during analysis.

| Title                               | Artist                 | Nationality | BeginDate | EndDate | Gender | Date     | Medium                            |
|------------------------------------|-------------------------|-------------|-----------|---------|--------|----------|------------------------------------|
| Figuier                            | Eugène Atget           | French      | 1857      | 1927    | male   | n.d.     | Albumen silver print               |
| Beach Runner (Clara)               | Nicole Eisenman        | (American)  | 1965      | 0       | female | 2014     | Oil on canvas                     |
| "Untitled"                         | Felix Gonzalez-Torres  | (American)  | 1957      | 1996    | male   | 1990     | Three stacks of photolithographs   |
| Untitled                           | Man Ray                | American    | 1890      | 1976    | male   | 1930     | Gelatin silver print               |
| «KO» N° 165 from Alphabet Bété     | Frédéric Bruly Bouabré | Ivorian     | 1923      | 2014    | male   | 1991     | Colored pencil on board            |

**Questions to discuss:**

1. What inconsistencies or formatting issues can you spot?  
2. Which values might make filtering or sorting difficult?  
3. Are there entries where you would want to investigate further before analysis?  
4. Why might these issues matter later in OpenRefine?

::::::::::::::::::::::::::::::::::::::::::::::::




::::::::::::::::::::::::::::::::::::: keypoints

+ OpenRefine is a free, open-source tool for cleaning, organizing, and exploring messy data.
+ You can easily import, filter, sort, and analyze your data, even without technical experience.
+ OpenRefine supports many data formats and can be extended with add-ons and custom scripts for even more possibilities.
+ Using OpenRefine helps you prepare your data for analysis, making your research more accurate, efficient, and enjoyable.
  
::::::::::::::::::::::::::::::::::::::::::::::::
