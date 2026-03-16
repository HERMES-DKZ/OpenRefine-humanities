---
title: "Transforming Data"
teaching: 20
exercises: 20
---

:::::::::::::::::::::::::::::::::::::: questions 

- How can we clean and standardize the `Artist Display Bio` values in OpenRefine?
- What is the difference between *finding* issues (facets) and *fixing* them (transformations & clustering)?
- What is clustering and when to use it?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Remove literal characters with GREL replacements.
- Split `Artist Display Bio` into nationality and life-dates.
- Inspect and normalize a column.


::::::::::::::::::::::::::::::::::::::::::::::::

In the previous episodes we used build in and custom facets to explore the dataset, identify potential issues and correcting small errors. In this episode we move to the next stage of the workflow: cleaning and restructuring the data.  
We will use transformations, column operations, and clustering to make the information easier to analyse.
Without explicitly stating it, you have already used transformations in previous episodes: splitting multi-valued cells, rejoining them, transforming a string to a number. 


In the Met dataset, the column `Artist Display Bio` stores information on nationality and biographaphy of artists. Typical examples look like:

```
British, Ipswich 1817–1905 Hastings|German, Moers 1820–1899 London
Italian, active 16th century|Italian, active Venice 1530–1573
```
So multiple pieces of information are packed into a single field, sometimes with inconsistent separators or formatting and as mentioned before some cell contain information about multiple artists, so we must ensure the rows are split correctly before working with this column.

::::::::::::: discussion

### Discussion: By which separator can we split the `Artist Display Bio` column?




::::::::::::::::: solution

### Solution



::::::::::::::::::::::::::

:::::::::::::::::::

Next, we will simplify the text, then split nationality from the remaining details, and finally use clustering to review and standardize the results.

## Transformation with GREL

We start with a literal replacement to remove parentheses. This is a very common first step in cleaning, because parentheses, brackets, or punctuation often only serve visual use, not analytical use.

1. Open the column menu for `Artist Display Bio`.
2. Choose `Edit cells → Transform…`.
3. Enter:

```grel
value.replace("(", "").replace(")", "")
```
4. Click `OK`.

The expression consists of two chained `replace()` calls. Each `replace(old, new)` looks for a specific character or substring and replaces it with something else. Because the second argument is an empty string, the character is completely removed.

OpenRefine processes the expression for **each cell**:

- `(` becomes nothing  
- `)` becomes nothing  
- everything else stays as-is  

This kind of literal replacement is safe because parentheses are *not* meaningful content—they only frame the information.





## Edit Columns  

So far, we have transformed the *content* of a cell. But sometimes the data is best cleaned by **restructuring** it, splitting one column into multiple columns.

The current pattern is:

```
<Nationality>, <rest>
```

To isolate the nationality, we split at the comma. This is good practice: each column ideally contains one type of information (a principle often called “tidy data”).

1. Open the column menu: ArtistBio → `Edit column → Split into several columns…`
2. Separator: `,`
3. Split into: *leave the default*
4. Confirm with `OK`

Afterward you get:

- **ArtistBio 1** → nationality (“American”, “French”, “Ivorian”, …)
- **ArtistBio 2** → biographical details (“born 1936”, “1857–1927”, …)

If a cell contains more than one comma, OpenRefine will generate more columns (ArtistBio 3, ArtistBio 4, …). This shows how splitting is both powerful and potentially revealing—sometimes extra commas indicate noise or irregular formatting.

:::::::::::::::::::::::::::::::::::::::::::: challenge

## 


::::::::::::::::::: solution

### Solution

:::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::


## Clustering

  

These inconsistencies make it hard to analyze the data reliably.

Clustering is one of OpenRefine’s most powerful tools for identifying and normalizing such variations — especially when the inconsistencies appear similar but not identical.

### What is clustering?

Clustering is OpenRefine’s way of grouping together text values that *look* or *sound* similar.  
It does this by reducing each value to a **“key”** based on a transformation.

For example:

- You might remove vowels and make everything uppercase:  
  “Color” → “CLR”, “Colour” → “CLR” → **match**

- Or you might use phonetic rules:  
  “Smith” → “SM0”, “Smyth” → “SM0” → **match**

A “keying function” transforms two strings that *should* be the same into the **same key**, even if their spellings differ slightly. There are many more clustering methods, all of which can recognise different patterns. It helps to understand these in order to find the right method, but often it is enough to try them out and proceed step by step.

OpenRefine uses this idea to suggest groups of values you may want to merge.


1. Open: ArtistBio 2 → `Edit cells → Cluster and edit…`
2. Method: `Key collision`
3. Keying function: `Metaphone 3`


### What you'll see

The clustering window shows one line per suggested cluster:

- On the left: variations of a similar value  
- On the right: a field where you choose the unified form

You can then decide:

- **Merge and reformat them** into a consistent style  
- **Ignore** clusters if the variations are meaningful  
- **Edit only some entries**  

Clustering never changes anything automatically. **You are in control**—OpenRefine simply helps you notice patterns you would otherwise miss.

This makes clustering extremely effective for cleaning humanities datasets, where controlled vocabulary is uncommon and metadata comes from diverse sources.

:::::::::::::::::::::::::::::::::::::::::::: discussion

## 


::::::::::::::::::: solution

### Solution

:::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: keypoints

- Transformations modify the *content* of cells, while column operations reshape the *structure* of the dataset.
- Literal GREL replacements help remove unwanted characters and prepare text for further processing.
- Splitting columns separates different types of information, making the data easier to analyze and clean.
- Clustering identifies similar but inconsistently written values and supports manual standardization.

::::::::::::::::::::::::::::::::::::::::::::::::
