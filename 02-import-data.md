---
title: "Importing Data and Getting to Know the OpenRefine User Interface"
teaching: 0
exercises: 0
---

::::::::::::::::::::::::::::::::::::: questions

+ How do I start a new project in OpenRefine?
+ How do I import a CSV file?
+ What options and settings are available during import?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

+ Start a new OpenRefine project.
+ Import data from a CSV file

::::::::::::::::::::::::::::::::::::::::::::::::




To begin working with your data in OpenRefine, you first need to create a new project. Imagine you have downloaded a CSV file containing a sample of the Museum of Modern Art (MoMA) collection. This file might include information about artworks, artists, dates, and more—ready to be explored and cleaned.

When you open OpenRefine in your web browser, you are greeted by these start page. 

![Import Data Window](img/01_data_import.png)

There are already various options in the left-hand bar. You can:

+ Create a new project and load data.
+ Open an existing project.
+ Import an existing project.
+ Change the language of OpenRefine. 
+ Manage extensions. 

We will not be looking at extensions in this lesson, but they offer the possibility to customise OpenRefine in even greater detail and expand it with additional functions. We click on *Create Project* and then on *Get data from* * ***This Computer*** . Here we click on *Browse* and search for our file, select it and click on *next* .
OpenRefine will show you a preview of your data, allowing you to check that everything looks correct before you proceed.

Below the data preview, we now find various settings options for how the data should be loaded. This has a direct effect on the preview, allowing us to check immediately whether the settings have been selected correctly. This is important when files have special formats, so that they can be converted into the correct table structure.
For example, if your CSV uses a separator other than a comma (for example, a semicolon or tab), you can specify this so that columns are recognized correctly.
Sometimes, data files include extra header lines or notes at the top. You can tell OpenRefine to skip these lines, so only the actual data is imported.
For Excel files, you can select which sheet to import. For CSVs, you can preview and adjust how columns are interpreted.
Once you are happy with the preview and settings, you can give your project a name and click *Create Project*. In our case everything should be fine and we can go on without chaniging any settings.
OpenRefine will load your data into its workspace, displaying it in a clear, table-like view. 

![Import Data Window](img/02_start.png)

The user interface is designed to be intuitive. In general, it is structured so that we can see the data we currently have access to in the large main window in the middle. There, we can set how many rows we want to see at once and whether we want to see *rows* or *records* displayed. We will understand what this difference means later. The arrows next to the column labels open the functions that OpenRefine offers us for changing and processing our data. These always refer to the column we open them from. On the left-hand side, we can see exactly what we can apply or what we have created. We will also clarify and understand this in detail in a moment. The *Undo/Redo* column allows us to undo steps, but also to export and reuse entire processing pipelines. 
In the upper right corner, there are additional options where we can create a new project or export our current data. The *Help* button takes us directly to the OpenRefine documentation. There, all functions are also described in detail.

By starting with a CSV file from the MoMA dataset, you have taken the first step toward organizing and understanding your data. OpenRefine’s flexible import options and user-friendly interface make it easy to get started, no matter your technical background.

::::::::::::::::::::::::::::::::::::: keypoints

+ You can import data from different different formats in OpenRefine
+ Adjust import settings to ensure your data is read correctly and preview the results before starting.
+ Functions to work with your data are used from the *Arrow Buttons* next to the collumn header

::::::::::::::::::::::::::::::::::::::::::::::
