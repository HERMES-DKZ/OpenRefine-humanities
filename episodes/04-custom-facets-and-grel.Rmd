---
title: "Custom Facets and GREL"
teaching: 0
exercises: 0
---

:::::::::::::::::::::::::::::::::::::: questions 

- When do we need a custom facet instead of a built-in one?  
- How can GREL help us filter or transform data more flexibly?  

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Understand what a custom facet is and how it differs from standard facets.  
- Learn to write simple GREL expressions for filtering and transformation.  
- Apply a custom facet on the **Artist** column to distinguish between single and multiple creators.  

::::::::::::::::::::::::::::::::::::::::::::::::


So far, we have explored facets that you can create by clicking through the menu—text, numeric, and timeline facets. These are powerful, but sometimes our exploration or cleaning task needs a rule that isn’t built in. In those cases, OpenRefine lets us define our own facets using **GREL** (*General Refine Expression Language*).

GREL looks like code, but many useful expressions are short and readable. You can think of them as tiny instructions that tell OpenRefine how to interpret or transform the value currently in a cell (that value is referred to as `value` inside GREL). Every funciton we already used could be written in GREL as well, but to make things eaisier the most common functions are already built it.

If, for example, we now want to examine our data set to see which works of art were created by only one or by then one, we could create a custom facet to filter by this criteria.

::::::::::::: discussion

### Question: How could we filter the column to find out whether one or more people were involved in creating a work of art??

Look at the column and consider how cells that contain one or more values differ. We can then use GREL to filter based on this difference.
::::::::::::::::::::



## Creating a Custom Facet with GREL

1. **Open the column menu** for **`Artist`**.

2. Choose **Facet → Custom text facet…**

3. In the dialog, type the following GREL expression:

   ```grel
   value.contains(",")
   ```

   This asks, “Does the cell contain a comma?” For each row, OpenRefine evaluates the expression and returns either `true` or `false`.

4. Click **OK**. In the left panel, you now see a facet with two buckets: `true` and `false`.


That’s it—you just created a logic-based facet that the standard menus couldn’t provide.

> **Why this works:** A Custom Facet runs your expression on every row, groups the results, and lets you filter by the outcome. You can write tests that return booleans (`true`/`false`), strings (e.g., normalized categories), or even numbers—OpenRefine will facet whatever the expression returns.



::::::::::::::::::::::::::::::::::::: callout

### Callout: GREL-Functions

* `value.toLowercase()` – lowercase the text.
* `value.toUppercase()` – uppercase the text.
* `value.trim()` – remove spaces at start/end.
* `value.length()` – number of characters.
* `value.contains("text")` – `true` if "text" occurs.
* `value.startsWith("A")`, `value.endsWith(".")` – prefix/suffix checks.
* `value.replace("old","new")` – literal replace.
* `value.replace(/\s+/," ")` – regex replace (collapse multiple spaces).
* `value.split(";")` – split into an array on `;`.
* `array.join("|")` – join array back to a string.

### Type & Conversion

* `value.toNumber()` – parse numbers (non-numeric becomes blank).
* `value.toDate()` – parse dates (useful before Timeline facets).
* `value.toString()` – convert back to text.
* `isBlank(value)` – `true` for empty/whitespace-only.
* `isNull(value)` – `true` for null values (missing).
* `type(value)` – returns "string", "number", "date", etc.
* `value.toDate()` – parse a date (from strings like `1954-05-01`).
* `value.toDate().toString("yyyy")` – format the date to year.
* `now()` – current date/time (useful for comparisons).

::::::::::::::::::::::::::::::::::::::::::::::::


