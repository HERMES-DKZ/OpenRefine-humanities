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

The most commonly used facet type is called **Text facet**. This facet type applies to all string values. Wir werden gemeinsam unsere erste Text facet erstellen und zwar für die Spalte Department. Open the column menu with the small arrow next to the column name and choose `Facet → Text facet`. A new panel will appear on the left side of the screen with the unique values inside the column and the count how often they appear. You can sort the values alphabetically or by frequency. You can also hover over values to edit them directly. This simple step immediately transforms a spreadsheet with hundreds of rows into a clear summary of categories and also helps to detect first inconsistencies. 

The numbers will vary depending on your sample, but the idea is always the same: OpenRefine has grouped all artworks by their department and counted them. You can now click on one department to see only those rows in the table, or select multiple values to combine them by clicking **include**. 


::::::::::::::::::::::::::::::::::::: challenge

### Exercise: First insights to your dataset & correct errors 

Create  a `text facet` on the columns:
- **Is Public Domain**
- **Object Name** 
- **City**.

1. How many unique values are listed in each column?
2. What is the most common value and how often does it appear?
3. Can you spot problems in the **Is Public Domain** column and can you fix them?
:::::::::::::::: solution


1.
2. 
3.
::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::



### The difference between Facet and Filters


It is useful to distinguish between **facets** and **filters**. Both are ways of focusing on a subset of the data, but they work differently. A filter is like a search box: you type in a word or part of a word, and OpenRefine hides all rows that do not match. A facet, by contrast, gives you an overview of *all* the distinct values in a column and lets you select them interactively. 

For example, in the Met dataset, the column `Department` might contain categories such as “Architecture & Design,” “Painting & Sculpture,” or “Drawings & Prints.” A **text facet** on this column will immediately show you how many artworks belong to each department. By clicking on one or several values in the facet, you can quickly restrict your view to only those artworks, and then easily switch back to the full dataset.

When you choose `Filter → Text filter`, a search field appears on the left side. You can type a term to restrict the dataset to matching rows.


::::::::::::::::::::::::::::::::::::: challenge

### Exercise: Filter and Editing a subset of data


:::::::::::::::: solution

::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::

### Rows, Records, and Multi-Valued Cells

Up to this point, we have assumed that every cell in a column contains only a single value. In real-world data, however, that is often not the case. In the Met dataset, the `Artist Display Name` column sometimes contains two or more names, separated by a `;` .

This is problematic for faceting. If we apply a text facet to the `Artist Display Name` column as it stands, OpenRefine will treat the entire string above as one value. The facet will then list “Pablo Picasso; Georges Braque” as if it were a single artist, which is clearly not what we want. What we need instead is to treat `Pablo Picasso` and `Georges Braque` as separate values, each counted individually.

To understand what happens when we correct this, it helps to know about the distinction between **Rows** and **Records** in OpenRefine. By default, data is displayed as rows, one after the other. But OpenRefine can also treat a group of rows as belonging to the same **record**. When we split a cell that contains multiple values, OpenRefine creates additional rows within the same record. That means the number of rows goes up, but the number of records stays the same.

Let us now prepare the `Artist` column for faceting by splitting its multi-valued cells.

1. First, look through a few rows in the `Artist` column and identify whether any cells contain more than one artist. These are usually separated by a comma (`,`) in the Met dataset.
2. Switch to **Records view** (at the top left of the grid, choose “Show as: Records”). This makes it easier to see what happens after the split.
3. Open the column menu for `Artist`, choose **Edit cells → Split multi-valued cells…**. Enter the separator `,` in the box, and click OK. Ignore the other options.
4. OpenRefine now divides each cell containing multiple artists into separate rows. The total number of rows increases, but the record count stays constant.
5. Create a **Text facet** on `Artist` again. This time you will see the names of individual artists listed separately. Each can now be counted and selected on its own.


::::::::::::::::::::::::::::::::::::: challenge

### Exercise: Split multi-valued cells

It is important to note that OpenRefine only splits the column you apply the function to. Other columns are left untouched. This means that if another column also contains multiple values that correspond to those in `Artist`, you need to split that column separately, for example `Nationality`. 
Look in the data and split the other columns if needed.

::::::::::::::::::::::::::::::::::::::::::::::::


This small step has a big impact: it ensures that our summaries and analysis represent the data correctly. Instead of hiding two names inside one cell, we now see each artist clearly and can identify patterns such as which artists appear most often in the dataset.



### Rejoining Values

Sometimes you may want to put the data back into its original form. After cleaning or analyzing, OpenRefine allows you to join split rows back into a single cell. To do this, return to the column menu, select **Edit cells → Join multi-valued cells…**, and specify a separator such as a comma character again (`,`). This is useful if you need to export the data in a more compact form later.



## Other facet types

Numeric facets are designed for columns that contain numbers, such as dimensions of artworks. They let you interactively explore ranges of values with a histogram and slider.  

Let us try this out with the `Height (cm)` column from the Met dataset. Open the column menu and choose **Facet → Numeric facet**. You might expect to see a histogram, but instead, OpenRefine shows only a message such as “No numeric values.” This tells us that the values in the column are not actually recognized as numbers, even though they look like numbers in the table.  

This situation is common when importing data: numbers are often stored as **strings** (that is, as text), so OpenRefine does not treat them as numeric values. We need to convert them first.

To fix this, open the column menu for `Height (cm)` again and choose:  
**Edit cells → Common transforms → To number**.  

OpenRefine now attempts to parse each cell in that column as a number. If the value is a valid number, the cell is converted; if not (for example, if the cell is empty or contains text like “unknown”), it becomes a blank cell.  

You will see a small change in the formatting of the numbers: they are now right-aligned, which is OpenRefine’s way of indicating that they are numeric rather than text.

With the column properly converted, repeat the earlier step:  
**Facet → Numeric facet**.  

This time, OpenRefine shows a histogram with a slider. The histogram groups all the height values into ranges, giving you an overview of how artworks are distributed by size.  

By dragging the slider handles, you can focus on particular ranges. For example, you might restrict the view to artworks shorter than 20 cm, or zoom in on those taller than 300 cm. This is especially helpful for spotting unusual values. If you see a very high number, such as “20000 cm,” that might indicate a data entry error.  

Numeric facets therefore serve two purposes at once: they help you explore distributions, and they highlight anomalies that need cleaning.


Some columns represent dates, such as `DateAcquired` or the year of creation of the artwork. For these, OpenRefine offers the **Timeline facet**.  

Before you can use a timeline facet, you need to ensure that the column is stored as a **date type**. You can do this by choosing **Edit cells → Common transforms → To date** from the column menu. Once converted, you can create a **Timeline facet**.  

The result looks similar to the numeric facet but with dates on the horizontal axis. OpenRefine displays a histogram showing how many rows fall into each time period. You can then drag the slider handles to focus on a specific date range.  

For example, a timeline facet on `DateAcquired` could reveal when most of the artworks in your sample entered the MoMA collection. You might see peaks in certain decades, which may correspond to acquisition campaigns or curatorial trends. By selecting a particular time range, you can then explore only those artworks acquired during that period.


## Detect blank values

Not every object has information in all columns. Often, the data is incomplete. Knowing how incomplete the data is can often be important for planning a later analysis. We can quickly identify the gaps by selecting `Facet → Customised facets → Facet by blank`. This gives us an output with true and false on the left. By selecting false, we exclude empty data series from the subset. If we do this for all columns, we only get the data records that are complete.


::::::::::::::::::::::::::::::::::::: challenge

### Exercise: Identify complete records
How many records in the dataset contain information on both `Culture` and `Tags`?

:::::::::::::::: solution

### Solution
First apply `Facet by blank` to `Culture` and select `false`. Then apply `Facet by blank` to `Tags` and select `false`. Only the remaining 175 record contain values in both columns. This are quite few keeping in mind, that our whole dataset encompass 2076 records.

::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::: keypoints 

- Facets provide an interactive overview of the values in a column and help you explore your data.
- Multi-valued cells must be split before accurate faceting is possible.
- Numeric and Timeline facets require converting text values into numbers or dates first.


::::::::::::::::::::::::::::::::::::::::::::::::
