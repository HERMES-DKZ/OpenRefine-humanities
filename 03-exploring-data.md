---
title: "Exploring Data"
teaching: 0
exercises: 0
---

:::::::::::::::::::::::::::::::::::::: questions 

- What options does OpenRefine offer for data exploration?
- What is a facet and how does it help me explore data?
- How do facets differ from filters?
- What data types exist in OpenRefine?
  
::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Define faceting and identify when to use it.
- Define filtering and identify when to use it.
- Create a text facet to get an overview of values in a column.
- Transform values from one data type to another.
- Use Split multi-valued cells to prepare data for accurate faceting and later analysis.

::::::::::::::::::::::::::::::::::::::::::::::::


## Facets

When we work with data in OpenRefine, one of the first challenges is to make sense of the information that has been imported. Looking at rows of raw data rarely gives us much insight, especially if the dataset is large. What we need is a way of quickly summarizing values, spotting patterns, and finding potential problems such as inconsistent spellings or unexpected categories. 

OpenRefine provides a set of tools for this under the name **facets**. Faceting allows us to group together all of the different values that appear in a **column** and to see how often they occur. A facet creates a kind of “interactive summary” of the data: it lists all unique values in a column and shows how many times each one appears. 

## Text Facet

The most commonly used facet type is called **text facet**. This facet type applies to all string values. We will create our first text facet together for the column `Department`. Open the column menu with the small arrow next to the column name and choose `Facet → Text facet`. A new panel will appear on the left side of the screen with the unique values inside the column and the count how often they appear. You can sort the values alphabetically or by frequency. You can also hover over values to edit them directly. This simple step immediately transforms a spreadsheet with hundreds of rows into a clear summary of categories and also helps to detect first inconsistencies. 

Both “Arts of Africa Oceania and the Americas” and “Arts of Africa, Oceania and the Americas” appear in the panel. Since these values most likely refer to the same department, the version without the comma is probably a data entry error. To correct this, identify the incorrect value in the facet list, hover over it, click edit, and change it. This merges all records under the correct spelling by just one action.

You can also click on one department to see only those rows in the table, or select multiple values to combine them by clicking **include**. Ensure that you undo your selection by pressing **exclude**, otherwise you will only continue working with a small subset of the data.


::::::::::::::::::::::::::::::::::::: challenge

### Exercise: First insights to your dataset & correct errors 

Create  a `text facet` on the columns:

- `Is Public Domain`

- `Object Name` 

- `City`.

1. How many unique values are listed in each column?
2. What is the most common value in `Object Name` and how often does it appear?
3. Can you spot problems in the `Is Public Domain` column and can you fix them?

:::::::::::::::: solution
1. 4 / 389 / 321 different values. 
2. The most frequent value is Book with 493 counts.
3. There are different spellings: "False", "false" and "true", "True". You can decide for one spelling and edit the others with the edit button.

::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::



### The difference between Facet and Filters


It is useful to distinguish between **facets** and **filters**. Both are ways of focusing on a subset of the data, but they work differently. A filter is like a search box: you type in a word or part of a word, and OpenRefine hides all rows that do not match. A facet, by contrast, gives you an overview of *all* the distinct values in a column (as you seen in the Challenge above) and lets you select them interactively. 

For example, in the Met dataset, the column `Department` might contain categories such as “Medieval Art”, “Islamic Arts,” or “Drawings & Prints.” A **text facet** on this column will immediately show you how many artworks belong to each department. By clicking on one or several values in the facet, you can quickly restrict your view to only those artworks, and then easily switch back to the full dataset. So with this functionality you can filter your data with the help of facet.

Another way of filtering in a distint column is a text filter. When you choose `Filter → Text filter`, a search field appears on the left side. You can type a term to restrict the dataset to matching rows.


::::::::::::::::::::::::::::::::::::: challenge

### Exercise: Combining Facets and Text Filters

How many prints are in the department "Drawings and Prints"?
What difficulties arise when you only use filtering via the include function of the facet?

:::::::::::::::: solution

First, you use a text facet on the column `Departments` and filter for the department "Drawings and Prints" via include. Then you can use a text facet on the column `Object Name`. When you include the facet "Print", you find 281 matching records. However, as you can see, there are not only "Print", but also entries such as "Album Print Ornament", etc.

To filter for all prints in the department, you can use a text filter and type "print". There are 665 prints in the department.
::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::

### Rows, Records, and Multi-Valued Cells

Up to this point, we have assumed that every cell in a column contains only a single value. In real-world data, however, that is often not the case. In the Met dataset, the `Artist Display Name` column sometimes contains two or more names, separated by a `;` like
`Horace Harral; Joseph Wolf`.
This is problematic for faceting. If we want to find out which artist appears most frequently in the dataset, this structure makes it difficult. That's because if we apply a text facet to the `Artist Display Name` column as it stands, OpenRefine will treat the entire string as one value. The facet will then list the artists as if it were a single artist, which is clearly not what we want. What we need instead is to treat every artist as separate values: `Horace Harral` and `Joseph Wolf`.

To understand what happens when we correct this, it helps to know about the distinction between **Rows** and **Records** in OpenRefine. By default, data is displayed as rows, one after the other. But OpenRefine can also treat a group of rows as belonging to the same record. When we split a cell that contains multiple values, OpenRefine creates additional rows within the same record. That means the number of rows goes up, but the number of records stays the same.



1. Switch to **Records view** (at the top left of the grid, choose “Show as: Records”). This makes it easier to see what happens after the split.
2. Open the column menu for `Artist Display Name`, choose `Edit cells → Split multi-valued cells…`. Enter the separator `;` in the box, and click `OK`.
3. Create a text facet on `Artist Display Name` again. This time you will see the names of individual artists listed separately. Each can now be counted and selected on its own.

If you now switch back to the `rows` view you will see that the number of rows rose to 4,644.

::::::::::::::::::::::::::::::::::::: challenge

### Exercise: Split multi-valued cells

The column `Tags` also contains multiple values in some cells. 
Split the cells for this column and create a text facet.

* Which separator do you need?

* Which tag appears most frequently in the dataset?

* Do you notice duplicate values in the facet list?
 

:::::::::::::::: solution

### Solution

* When splitting the cells, you should use "," as the separator.

* After splitting the values and creating a text facet, the most frequent tag in the dataset is "Men".

* The facet may show duplicate values. These appear as separate values because some tags contain leading whitespace.
To fix this you can `Edit cells → Common transforms → Trim leading and trailing whitespace`. This removes spaces at the beginning or end of the cells. After trimming the whitespace, the duplicate values merge into a single tag.

::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::



### Rejoining Values

Sometimes you may want to put the data back into its original form. After cleaning or analyzing, OpenRefine allows you to join split rows back into a single cell. To do this, return to the column menu, select `Edit cells → Join multi-valued cells…`, and specify a separator again. This is useful if you need to export the data in a more compact form later.



## Other Facet Types

So far we have used text facets to explore categorical values such as departments or object types. OpenRefine also offers other facet types that help explore numeric values like creation year of an artwork.


Let us try this out with the  `Object Begin Date` column from the Met dataset which contains the year an artwork was created. Open the column menu and choose `Facet → Numeric facet`. You might expect to see the different values, but instead, OpenRefine shows only a message such as “No numeric values.” This tells us that the values in the column are not actually recognized as numbers, even though they look like numbers in the table.  

This situation is common when importing data: numbers are often stored as **strings** (that is, as text), so OpenRefine does not treat them as numeric values. We need to transform them first.

To fix this, open the column menu for `Object Begin Date` again and choose:  
`Edit cells → Common transforms → To number`.  

OpenRefine now attempts to parse each cell in that column as a number. If the value is a valid number, the cell is converted; if not (for example, if the cell is empty or contains text like “unknown”), it becomes a blank cell.  

You will see a small change in the formatting of the numbers: they are now right-aligned, which is OpenRefine’s way of indicating that they are numeric rather than text.

With the column properly converted, repeat the earlier step:  
`Facet → Numeric facet`.  

This time, OpenRefine shows a histogram with a slider to explore ranges of values from year 0 up to year 2100. The histogram groups all the year values into ranges of "100", giving you an overview of how artworks are distributed by year of their creation.  

By dragging the slider handles, you can focus on particular ranges. For example, you might restrict the view to artworks before 1,500. You will see that the dataset contains only 42 matching objects. Most artworks therefore date from after the 15th century; this is evident at a glance. 

Numeric facets therefore serve two purposes at once: they help you explore distributions, and they highlight anomalies that need cleaning.

::::::::::: {.callout}

OpenRefine also offers other facet types such as a `timeline facet` for date values or a `scatterplot facet` for exploring the relationship between two numeric columns. In addition there is a facet type that helps you identfy duplicate in a column `Facet → Customized facets → Duplicate facet`. Duplicate facets can be useful, for example, when working with columns that are expected to contain unique identifiers.

The best way to understand these facets is simply to experiment with them.

:::


::::::::::::::::::::::::::::::::::::: challenge

### Exercise: Numeric Facet

Turn the values in the column `Accession Year` into a numeric facet. In which decade did the Met collection acquire the most artworks? Why are there non-numeric values? Can you spot the error?

:::::::::::::::: solution

### Solution

In the 1940s. There are X non-numeric values. You can take a look at them by ticking Non-numeric. It looks like someone wrote an “O” instead of a “0”.

::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::

## Detect Blank Values

Not every object contains information in all columns. Often, the data is incomplete. Knowing how incomplete the data is can often be important for planning a later analysis. We can quickly identify the gaps by selecting `Facet → Customised facets → Facet by blank`. This gives us an output with "true" and "false" on the left. By selecting "false", we exclude empty data series from the subset. If we do this for all columns, we only get the data records that are complete.


::: instructor
There are often diffent way to do things in OpenRefine. In this case its also possible to create a text facet and then search for "blank".
::::::::::::::

::::::::::::::::::::::::::::::::::::: challenge

### Exercise: Identify complete records
How many records in the dataset contain information on both `Culture` and `Tags`?

:::::::::::::::: solution

### Solution
First apply `Facet by blank` to `Culture` and select "false". Then apply `Facet by blank` to `Tags` and select "false". Only the remaining 175 record contain values in both columns. This are quite few keeping in mind, that our whole dataset encompass 2076 records.

::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::: keypoints 

- Facets provide an interactive overview of the values in a column and help you explore your data.
- Multi-valued cells must be split before accurate faceting is possible.
- Numeric and Timeline facets require converting text values into numbers or dates first.


::::::::::::::::::::::::::::::::::::::::::::::::
