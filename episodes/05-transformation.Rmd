---
title: "Transforming Data"
teaching: 0
exercises: 0
---

:::::::::::::::::::::::::::::::::::::: questions 

- How can we clean and standardize **ArtistBio** values in OpenRefine?
- What is the difference between *finding* issues (facets) and *fixing* them (transformations & clustering)?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Remove literal characters with GREL replacements.
- Split **ArtistBio** into nationality and life‑dates 
- Inspect and normalize a column.

::::::::::::::::::::::::::::::::::::::::::::::::



Facets help us *find* patterns; transformations and clustering help us *fix* them consistently. In the MoMA sample, the column **ArtistBio** stores nationality plus life information in a compact string. Typical examples in your file look like:

```
(American, born 1936)
(American, born Italy. 1919–2013)
(American, born Germany. 1886–1969)
(French, 1857–1927)
(Ivorian, 1923–2014)
```


As previously noted, some columns also contain information about multiple artists, which is why we first need to split them.

::::::::::::: discussion

### Discussion: By which seperator can we split the ArtistBio Column?

It may happen that different data items are not separated by a comma or a semicolon, in which case creativity is required to determine how to resolve these data items.

::::::::::::::::::::

::::::::::::::::: solution

### SOLUTION ()

You can separate the data at the string ") (".

::::::::::::::::::::::::::


Next, we will simplify the text, then split nationality from the remaining details, and finally use clustering to review and standardize the results.


## Transformation with GREL

We start with a so called literal replacement.

1. Open the column menu for **ArtistBio**.
2. Choose **Edit cells → Transform…**.
3. Enter:

```grel
value.replace("(", "").replace(")", "")
```
4. Click **OK**.

**What this does:** It deletes `(` and `)` everywhere and leaves the rest untouched. More precisely, it replaces the characters with nothing. The value.replace() function requires two inputs, which are passed in parentheses. One is the character to be replaced, and the other is the character with which it is replaced. In our case, we simply leave the second part blank, which results in the character being deleted.

After this step, examples look like:

```
American, born 1936
American, born Italy. 1919–2013
French, 1857–1927
```

::::::::::::::::: callout

Add a quick **Text facet** on *ArtistBio* to confirm that parentheses are gone.

:::::::::::::::::::::::::


## Edit Columns 

So far, we have applied transformations that modified the contents of cells and rows. But OpenRefine also allows us to restructure and transform our data through columns. For example creating new columns from existing ones. When working with tables, it makes sense to process them in such a way that each cell contains only one piece of information. This is useful if you want to analyze or clean different parts of the data separately, instead of working in one long text string. 

The values, at the moment, are generally in the form:

```
<Nationality>, <rest>
```

By splitting at the comma, we can move the nationality into its own column and leave the rest (birth/death information, places, etc.) in another. This makes it much easier to work with later.

1. Open the column menu ArtistBio → Edit column → Split into several columns…
2. Separator: ","
3. Split into: leave the default (OpenRefine will automatically create ArtistBio 1 and ArtistBio 2 ... ArtistBio X).
4. Confirm with OK.

After splitting, your dataset will look something like this:

- ArtistBio 1 → nationality (e.g., American, French, Ivorian, …)

- ArtistBio 2 → the remaining details (e.g., born 1936, born Germany. 1886–1969, 1857–1927)

If cells have more then one comma, OpenRefine will create as much columns as needed. This step shows how OpenRefine is not only about cleaning text but also about reshaping your data, which is just as important when preparing a dataset for analysis.


## Clustering

Even after splitting, the second part (ArtistBio 2) still contains a mix of formats:

- born 1936

- born Italy. 1919–2013

- 1857–1927

- 1923–2014

This is where clustering helps.

#### What is clustering?

Imagine you have a long list of words that are almost—but not quite—the same: colour, color, colr. A computer can group them together by applying a rule that says “treat things that sound or look similar as if they belonged to one bucket.” That’s clustering.
OpenRefine offers different clustering methods. They don’t just compare characters literally but transform them into simplified “keys.” Rows with the same key end up in the same cluster.

You can think of it like:

- Writing all words in block capitals and removing vowels: COLOR and COLOUR both become CLR. 
- Or sounding the word out loud: Smith and Smyth both sound like SMITH. 

This is how OpenRefine groups values that are close enough, even if not exactly the same.



#### How to use it here:

1. Column menu ArtistBio 2 → Edit cells → Cluster and edit…

2. Method: Key collision

3. Keying function: Metaphone 3




#### What you’ll see

In the clustering window, OpenRefine shows suggested groups of values. For example:

- born Germany. 1886–1969 might be grouped with slight spelling variants like born Germany 1886-1969.

- Different years won’t cluster together, but you’ll see repeated phrases like born Italy or born Germany.

- Plain ranges like 1857–1927 won’t be grouped with 1923–2014, because the numbers differ, but you can still skim them quickly.

Clustering is not about fixing everything automatically. It’s about seeing the patterns and deciding what you want to merge. For example, you might merge born Germany. 1886–1969 and born Germany 1886–1969 into one consistent form.


