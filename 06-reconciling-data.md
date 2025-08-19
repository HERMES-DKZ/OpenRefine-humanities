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
- Reconcile names and places.
- Add stable identifiers (IDs).

::::::::::::::::::::::::::::::::::::::::::::::::



So far, we have used OpenRefine to *look at* and *clean* our dataset: splitting columns, removing unwanted characters, and clustering values. These steps improve the quality of our data, but our values are still **just strings**, plain text without a deeper connection to knowledge outside our file.

**Reconciliation** is the process of linking these strings to **stable, external identifiers** in authority databases such as **Wikidata**, the **Getty vocabularies**, or other domain-specific repositories. Instead of simply having the text `Pablo Picasso`, reconciliation can connect our cell to the unique Wikidata item [`Q5593`](https://www.wikidata.org/wiki/Q5593). This turns our dataset into something that can be connected and compared with other datasets and research around the world.

You can think of reconciliation as asking a librarian: *“I have this name written here – which exact person in your catalog does it refer to?”* The librarian might return a short stack of cards with possible matches, and you confirm the right one. Once linked, the reference is unambiguous and stable.


In humanities datasets, names and places are central. But names are often ambiguous:

- **Variant spellings**: `Shakespeare`, `Shakespear`, `Shakspeare`
- **Common names**: `John Smith`
- **Different languages**: `Munich` vs. `München`

If we keep these as plain text, any comparison across collections or projects becomes unreliable. But if we reconcile to shared identifiers (like Wikidata QIDs), we can:

- Connect our dataset to others, regardless of spelling differences.
- Enrich our data with structured information (e.g., dates of birth, countries, occupations).
- Support reproducible analysis by referring to stable, citable identifiers rather than local labels.

Reconciliation therefore transforms a local, isolated dataset into part of a larger *knowledge graph*.



## Reconciling with OpenRefine

OpenRefine makes reconciliation simple and interactive:

- It provides built-in or addable reconciliation services (such as Wikidata).
- It lets you review and confirm matches cell by cell, or accept high-confidence matches in bulk.
- It allows you to pull in identifiers, labels, and even additional properties as new columns.

This combination of automation and human oversight is powerful: the machine proposes matches, but the researcher remains in control of what is accepted.

We will reconcile two columns in our dataset:

1. **`Artist`** – the name of the artist.
2. **`Nationality`** – the country information we previously separated from the biography.

### Reconciling the `Artist` column

1. Open the menu on **`Artist`** → **Reconcile → Start reconciling…**
2. Select **Wikidata** as the reconciliation service. If it does not appear, add it via *Add Standard Service…* and paste the URL: `https://wikidata.reconci.link/en/api`.
3. In the type field, type and select **Human (Q5)**. This tells Wikidata we are looking specifically for people.
4. Click **Start reconciling**.

OpenRefine now sends each name in the column to Wikidata and retrieves possible matches.


### Reviewing the matches

If the assignment is clear the reconciliation is complete. However, it is often the case that it is not clear and requires manual checking.
If there are several candidates to choose from and OpenRefine is unsure which one is correct, all options are displayed in the respective cell. Hovering over one of the names will display some information to help you decide which person is correct. You can also go directly to the entire database page to obtain even more information. Once you have found the correct person, you can either reconcile all cells with this name or just this one.

This is like being handed several possible business cards for the same name. Your task is to select the one that fits the person in your dataset.

::::::::::::::::: callout

Use birth/death dates and occupations in the description to disambiguate common names.

:::::::::::::::::::::::::


### Adding identifiers

The links now looks very good and can already be used in OpenRefine. However, if we export the file, the reconciliation disappears again, as in its current state it only works in OpenRefine itself. We therefore need to add another column with the assigned ID so that it can also be used outside of OpenRefine. We do this as follows:

1. Column menu → **`Artist` → Reconcile → Add entry identifiers column**.
2. Give it a name, for example **Artist_ID**.
3. Click **OK**.

Now, every artist is linked to a stable identifier. 


### Reconciling the `Nationality` column (countries)

Now we can reconcile these values as well:

1. Column menu → **`Nationality` → Reconcile → Start reconciling…**
2. Choose **Wikidata**.
3. Set the type to **Country (Q6256)**.
4. Start reconciliation.

This ensures that different spellings or forms like `USA`, `United States`, and `United States of America` all link to the same stable identifier: [United States of America (Q30)](https://www.wikidata.org/wiki/Q30).


::::::::::::::::::::::::::::::::::::: keypoints

- Reconciliation links text strings to unique identifiers in external databases.
- This makes your dataset more precise, reusable, and comparable across projects.
- OpenRefine provides a structured workflow for reconciliation: propose → review → confirm → enrich.
- The human researcher stays in control: machines suggest, but you decide.

::::::::::::::::::::::::::::::::::::::::::::::


