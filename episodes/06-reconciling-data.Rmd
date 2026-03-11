---
title: "Reconciling Data with External Data Sources"
teaching: 20
exercises: 15
---

:::::::::::::::::::::::::::::::::::::: questions 

- What does it mean to reconcile data?
- Why is reconciliation useful in humanities research?
- How can we use OpenRefine to enrich our dataset with identifiers and structured information?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Understand the concept of data reconciliation.
- Reconcile artist names with an authority database.
- Add stable identifiers to the dataset.

::::::::::::::::::::::::::::::::::::::::::::::::

## Why use reconciliation?

Up to this point we have cleaned and explored our dataset. We standardized values, split columns, and corrected inconsistencies. However, the values in the table are still plain text labels. For example in the column `Artist Display Name` we find values such as "Frank Lloyd Wright" and "Jean Le Pautre".

For a human reader these values clearly represent names. For a computer they are simply character strings. The name alone does not tell us which exact person is meant, and the same person might appear under slightly different spellings in other datasets, like (F. L. Wright or Jean Lepautre).

Reconciliation connects these text labels to authority records. Instead of working only with the name written in the dataset, we link the value to a stable identifier in an authority database.

For example, the artists in our dataset can be linked to the Union List of Artist Names (ULAN): http://vocab.getty.edu/page/ulan/500020307 or http://vocab.getty.edu/page/ulan/500000036.

When a name in our dataset is reconciled with an authority record, we are essentially answering the question:
> Which exact person in this authority database corresponds to the name written in our dataset?

::::::::::::::::::::::::::::::::::::: challenge

### Quick check

Open the Union List of Artist Names (https://www.getty.edu/research/tools/vocabularies/ulan/) and search for "Frank Lloyd Wright" and "Jean Le Pautre".

* What problem do you run into?

* What kinds of information do you find there that are not included in our dataset?

:::::::::::::::: solution

There are several search results for both. You have to check exactly which result is the right.
ULAN records often contains additional structured information such as birth and death dates, occupations, as well as different spelling of names.

Authority searches may return multiple results like in these cases. To identify the correct person you need to compare additional information such as life dates, occupations, or alternative spellings in the authority data and your dataset.
::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::

## Reconciling with OpenRefine

Because reconciliation can be computationally expensive, we will first work with a subset of the dataset.
Make a text facet in the column `Department`and form a subset from the department "Drawings and Prints".

1. Open the menu on the column `Artist Display Name` and select `Reconcile → Start reconciling…`
2. It appears a new window, where you select `Discover services...` and a new browser tab opens with all the possible reconciliation services in OpenRefine. Search for "Getty" and copy the URL "https://services.getty.edu/vocab/reconcile/".
3. Now return to your other browser tab, select `Add standard service...` and paste the copied URL into the appearing field. Select `Add service`.

4. Select the service and click on `Next`.
5. Select `ULAN search` this is the part of getty where we find right data. And click `Start reconciling...`.

OpenRefine now sends each name in the column to the Getty database and suggests possible matches.


::::::::::::: challenge

### Challenge: Add another reconciliation service

Wikidata, VIAF or the Integrated Authority File

::::::::::::::::: solution

### Solution


:::::::

::::::::::::::::::::::::::

### Reviewing the matches

If OpenRefine finds a clear match, the reconciliation is applied automatically. If several possible matches exist, OpenRefine shows multiple candidates. Hovering over one of the names will display some information to help you decide which person is correct. You can also go directly to the entire database page to obtain even more information. Once you have found the correct person, you can either reconcile all cells with this name or just this one.


::::::::::::: challenge

### Challenge: Matchmaking

Find names in the column `Artist Display Name` where OpenRefine suggests multiple matches.

Look carefully at the candidate entries.

* What information helps you choose the correct match?

* What might make a match ambiguous?

::::::::::::::::: solution

### Solution

Helpful clues include life dates, nationality, occupations, or alternative spellings.  
Ambiguity often occurs when several people share the same name or when the dataset contains little contextual information.

:::::::

::::::::::::::::::::::::::

### Adding identifiers


Reconciliation links are stored inside OpenRefine but are not automatically included when exporting the dataset. To preserve them we add an identifier column.

1. Open the column menu `Artist Display Name` and choose `Reconcile → Add entity identifiers column`
3. Name the column something like "Artist_ULAN_ID"



::::::::::::::::::::::::::::::::::::: keypoints

- Reconciliation links text strings to unique identifiers in external databases.
- This makes your dataset more precise, reusable, and comparable across projects.
- OpenRefine suggests matches, but users should always review and confirm them.
- Identifier columns preserve these links when exporting the dataset.

::::::::::::::::::::::::::::::::::::::::::::::


