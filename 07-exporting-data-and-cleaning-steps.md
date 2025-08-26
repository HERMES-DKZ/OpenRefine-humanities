---
title: "Undo, Redo, and Exporting Workflows"
teaching: 0
exercises: 0
---

:::::::::::::::::::::::::::::::::::::: questions 

- How can we go back to an earlier step if we realize we made a mistake?  
- How can we save our cleaning process to repeat it later or share it with colleagues?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Use the Undo/Redo panel in OpenRefine to reverse mistakes.  
- Export and Import workflows.  
- Understand the value of transparency and reproducibility in data cleaning.

::::::::::::::::::::::::::::::::::::::::::::::::



When cleaning messy data, we rarely get everything right on the first try. In the earlier chapters of this lesson, we:

- Removed extra details from the **ArtistBio** column.  
- Split the column into separate parts, such as nationality.  
- Applied clustering to standardize values.  
- Reconciled artist names against an external authority.  

All of these steps helped us improve our dataset. But what if, after clustering, we realize that some merges were wrong? Or what if we decide later that splitting the ArtistBio column at commas wasn’t the best idea? Instead of starting all over again, OpenRefine allows us to **step backwards** and explore different alternatives.


## Undo/Redo

On the left-hand side of the OpenRefine interface, you will find the **Undo/Redo** panel. This panel lists every action you have taken since the project was created. Each action has a short label, such as *“Text transform on 2000 cells...* or *“Split multu-valued cells in column nationality”*.

1. Click on the **Undo/Redo** tab in the left sidebar.  
2. You will see a list of all your steps in order. The most recent one is at the bottom.  
3. By selecting an earlier step in the list, you can roll the dataset back to exactly how it looked at that moment.  

This is like having a *time machine* for your dataset: you can test transformations freely without the fear of making permanent mistakes. And if you change your mind, you can always jump back to any earlier state.

**Example:** After splitting the ArtistBio column into multiple parts, you might notice that the country information was separated cleanly, but the century data became fragmented and less useful. Using Undo/Redo, you can jump back to the step *before* the split and try a different approach.


## Exporting and Importing Workflows

Undo/Redo does more than let you move backwards. It also keeps track of your entire cleaning process as a set of instructions. OpenRefine can export these instructions as a **JSON file**. This file is not the cleaned data itself, but the *recipe* of how the cleaning was done with the used data. 

1. Go to the **Undo/Redo** panel.  
2. Click on the link **Extract...**.  
3. A dialog will open showing all the steps in JSON format. You can select which steps to include.  
4. Click **Copy to clipboard** or save the JSON to a file.  

Later, you or someone else can **import** this workflow into another OpenRefine project:

1. In the Undo/Redo panel of the other project, click **Apply...**.  
2. Paste the JSON recipe or upload the file.  
3. OpenRefine will replay the exact same steps on the new dataset.  

This feature is especially powerful in humanities research, where transparency and reproducibility are essential. Instead of describing vaguely what was done, we can share the precise workflow that produced our dataset. Other researchers can review it, replicate it, or adapt it to their own data.


::::::::::::::::::::::::::::::::::::: callout

### Callout: Workflows as Reusable Recipes

Think of Undo/Redo export files as **recipes**. Just like a recipe tells you how to combine ingredients to bake a cake, an OpenRefine workflow tells you how to transform raw data into a cleaned dataset. If you don’t like the taste, you can always tweak the recipe.

::::::::::::::::::::::::::::::::::::::::::::::::



::::::::::::::::::::::::::::::::::::: keypoints 

- OpenRefine records every transformation you make.  
- The **Undo/Redo** panel lets you move backward and forward through your cleaning process.  
- Workflows can be exported as JSON and reapplied to other projects, ensuring transparency and reproducibility.  

::::::::::::::::::::::::::::::::::::::::::::::::
