---
title: "Transforming Data"
teaching: 0
exercises: 0
---

:::::::::::::::::::::::::::::::::::::: questions 

- How can we clean and standardize the **ArtistBio** values in OpenRefine?
- What is the difference between *finding* issues (facets) and *fixing* them (transformations & clustering)?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Remove literal characters with GREL replacements.
- Split **ArtistBio** into nationality and life-dates.
- Inspect and normalize a column.

::::::::::::::::::::::::::::::::::::::::::::::::

Facets help us *find* patterns; transformations and clustering help us *fix* them consistently.  
In the MoMA sample, the column **ArtistBio** stores nationality plus life information in a compact string. Typical examples look like:

```
(American, born 1936)
(American, born Italy. 1919–2013)
(American, born Germany. 1886–1969)
(French, 1857–1927)
(Ivorian, 1923–2014)
```

This is a fairly typical situation in cultural data: multiple pieces of information are packed into a single field, sometimes with inconsistent separators or formatting.

As mentioned before, some rows contain information about **multiple artists**, so we must ensure the rows are split correctly before working with this column.

::::::::::::: discussion

### Discussion: By which separator can we split the ArtistBio column?

It may happen that different data items are not separated by a comma or a semicolon, in which case creativity is required to determine how to resolve these data items.

::::::::::::::::::::

::::::::::::::::: solution

### Solution

You can separate the data at the string `) (`.

::::::::::::::::::::::::::

Next, we will simplify the text, then split nationality from the remaining details, and finally use clustering to review and standardize the results.

## Transformation with GREL

We start with a literal replacement to remove parentheses. This is a very common first step in cleaning, because parentheses, brackets, or punctuation often only serve visual use, not analytical use.

1. Open the column menu for **ArtistBio**.
2. Choose **Edit cells → Transform…**.
3. Enter:

```grel
value.replace("(", "").replace(")", "")
```
4. Click **OK**.

#### What this does

The expression consists of two chained `replace()` calls. Each `replace(old, new)` looks for a specific character or substring and replaces it with something else. Because the second argument is an empty string, the character is completely removed.

OpenRefine processes the expression for **each cell**:

- `(` becomes nothing  
- `)` becomes nothing  
- everything else stays as-is  

This kind of literal replacement is safe because parentheses are *not* meaningful content—they only frame the information.

After this step, values change from:

```
(American, born 1936)
```

to:

```
American, born 1936
```

::::::::::::::::: callout

Add a quick **Text facet** on *ArtistBio* to confirm that parentheses are gone.

::::::::::::::::::::::::::



## Edit Columns  

So far, we have transformed the *content* of a cell. But sometimes the data is best cleaned by **restructuring** it, splitting one column into multiple columns.

The current pattern is:

```
<Nationality>, <rest>
```

To isolate the nationality, we split at the comma. This is good practice: each column ideally contains **one type of information** (a principle often called “tidy data”).

1. Open the column menu: ArtistBio → **Edit column → Split into several columns…**
2. Separator: `,`
3. Split into: *leave the default*
4. Confirm with **OK**

Afterward you get:

- **ArtistBio 1** → nationality (“American”, “French”, “Ivorian”, …)
- **ArtistBio 2** → biographical details (“born 1936”, “1857–1927”, …)

If a cell contains more than one comma, OpenRefine will generate more columns (ArtistBio 3, ArtistBio 4, …). This shows how splitting is both powerful and potentially revealing—sometimes extra commas indicate noise or irregular formatting.


## Clustering

Even after splitting, the remaining biographical information still varies greatly:

- `born 1936`
- `born Italy. 1919–2013`
- `1857–1927`
- `1923–2014`
- variations in punctuation and spacing  
- different types of dash characters  

These inconsistencies make it hard to analyze the data reliably.

Clustering is one of OpenRefine’s most powerful tools for identifying and normalizing such variations—especially when the inconsistencies appear similar but not identical.

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

#### How to use it here

1. Open: ArtistBio 2 → **Edit cells → Cluster and edit…**
2. Method: **Key collision**
3. Keying function: **Metaphone 3**

#### More detailed explanation

- **Key collision** compares transformed keys. If two values produce the same key, they fall into the same cluster.
- **Metaphone 3** is a phonetic algorithm—it groups text based on how it sounds rather than how it is spelled.
  This is useful for cases like:  
  `born Germany. 1886–1969`  
  `born Germany 1886-1969`  
  → punctuation differs, but the core phrase is the same.

For numeric ranges (like dates), clustering won’t combine values with different numbers—e.g., `1857–1927` and `1923–2014` remain separate.  
But clustering will show you repeated structures, such as:

- “born Italy”
- “born Germany”
- “born 19XX”

This helps you spot repeated phrases and standardize them if needed.

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


::::::::::::::::::::::::::::::::::::: keypoints

- Transformations modify the *content* of cells, while column operations reshape the *structure* of the dataset.
- Literal GREL replacements help remove unwanted characters and prepare text for further processing.
- Splitting columns separates different types of information, making the data easier to analyze and clean.
- Clustering identifies similar but inconsistently written values and supports manual standardization.

::::::::::::::::::::::::::::::::::::::::::::::::
