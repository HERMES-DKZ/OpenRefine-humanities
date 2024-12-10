---
title: Setup
---

## Getting started

To follow this lesson, you must have OpenRefine installed on your computer and download a data file.


:::::::::::   prereq

## Dataset

The dataset used in this lesson is a subset of the [Metropolitan Museum of Art's Open Access Initiative](https://www.metmuseum.org/about-the-met/policies-and-documents/open-access) dataset with information about the objects in the Metropolitan Museum of Art (e.g. title, culture, artist biography).
It has been reduced in the number of columns and intentionally 'messed up' a little bit.

Download the csv [data file](https://hermes-dkz.github.io/OpenRefine-humanities/data/met_dataset_oa.csv) to your Computer.

::::::::::::::::::::

:::::::::::   prereq

## Software Setup

For this lesson you will need OpenRefine and a web browser. 
Note: OpenRefine is a Java program that runs on your machine (not in the cloud). It runs inside your browser, but no web connection is needed.

1. Check that you have Firefox, Edge, Opera or Chrome, Chromium, Safari browsers installed and set as your default browser. OpenRefine runs in your default browser. It will not run correctly in Internet Explorer. Sometimes it even has some issues with Firefox.
2. Download the software from [openrefine.org/download](https://openrefine.org/download) and check below for further instructions depending on your operating system


:::::::::::::::: tab

### Windows

1. Unzip the downloaded file into a directory by right-clicking and selecting “Extract…”. Name that directory something like OpenRefine.
2. Go to your newly created OpenRefine directory.
3. Launch OpenRefine by double clicking on `openrefine.exe` (this will launch a black command prompt window first; ignore this window, and wait for OpenRefine to launch in the web browser, which is where you will interact with the program).

- If Windows displays a blue notification titled `Microsoft Defender SmartScreen prevented an unrecognized app from starting`, click on `More info` and then click on `Run anyway`.

4. If you are using a different browser, or OpenRefine does not automatically open for you, point your browser at [http://127.0.0.1:3333/](https://127.0.0.1:3333/) or [http://localhost:3333](https://localhost:3333) to launch the program.


### MacOS

1. Unzip the downloaded file into a directory by double-clicking it. Name that directory something like OpenRefine.
2. Go to your newly created OpenRefine directory.
3. Drag the OpenRefine icon into Applications folder, and `Ctrl-click/Open…` it.

- If Mac shows a notification when you try to run the program that it cannot verify the developer, click `Cancel`. Then, `Right-click` or `Ctrl-click` the icon and select `Open`. The notification will now have an `Open` button. If it does not allow to open the program, repeat the process and there will be an `Open` button the second time. For additional details, consult the [OpenRefine installation guide](https://docs.openrefine.org/manual/installing#install-or-upgrade-openrefine).

4. If you are using a different browser, or OpenRefine does not automatically open for you, point your browser at [http://127.0.0.1:3333/](https://127.0.0.1:3333/) or [http://localhost:3333](https://localhost:3333) to launch the program


### Linux

1. Unzip the downloaded file into a directory. Name that directory something like OpenRefine.
2. Navigate to your newly created OpenRefine directory using the command line.
3. Type `./refine` into the terminal within the OpenRefine directory
4. If you are using a different browser, or OpenRefine does not automatically open for you, point your browser at [http://127.0.0.1:3333/](https://127.0.0.1:3333/) or [http://localhost:3333](https://localhost:3333) to launch the program.

::::::::::::::::::::::::

### Getting help

If you encounter problems installing or running OpenRefine, a good source of support is the [OpenRefine mailing list and user forum](https://forum.openrefine.org).
Include your operating system when searching to find the most relevant answers for your issue, such as threads related to [Windows](https://forum.openrefine.org/search?q=windows), [macOS](https://forum.openrefine.org/search?q=macOS), or [Linux](https://forum.openrefine.org/search?q=linux).

You may also want to check the [Stack Overflow OpenRefine tag](https://stackoverflow.com/questions/tagged/openrefine).

If you want to know more details about installation, upgrades and configuration the [installing manual of OpenRefine](https://openrefine.org/docs/manual/installing) is a good resource.
::::::::::::::::::::

### Exiting OpenRefine

To exit OpenRefine, close all the browser tabs or windows, then navigate to the command line window. To close this window and ensure OpenRefine exits properly, hold down [control] and press [c] on your keyboard. This will save all changes to your projects.