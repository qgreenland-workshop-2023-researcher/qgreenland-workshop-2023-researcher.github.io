---
title: "Data Scenario: Vector data needs reformatting"
categories: ["Data issue"]
---

You read a research publication about correlation between the chemistry of blood samples
taken from 12 kittens found on the Greenland Ice Sheet and their subjective cuteness as
rated by 100 randomly-selected graduate students. The paper includes graphs and some
limited data tables, but after searching for hours you can't find the full data file(s)
used to draw the conclusions in this study.

You email Dr. Foobarbaz to ask them for help. Where can you get the source data so you
can do your own analyses?

Dr. Foobarbaz responds:

```text
Fellow scientist,

Thank you for your interest in my work. I appreciate that you'd like to see the source
data. I wish I remembered where I was keeping that data, but I don't. I have several
laptops in storage that I will need to boot up and search for this file.

I will get back to you!

Dr. Foobarbaz
```

Three weeks later, Dr. Foobarbaz diligently follows up:

```text
Fellow scientist,

I found several candidates for the final dataset used to produce that study. I'm almost
completely certain that the attached file is the correct one. Please let me know if you
have any issues using this. The x/y spatial coordinates are in lat/lon WGS84 projection.

Best of luck.

Dr. Foobarbaz
```

You download the attachment `kcbcc_DS4_final_v2_final.xlsx`.


## TODO

* Should we make the data non-tabular so it can't be loaded directly into Pandas without
  modification? E.g. include "header rows" containing metadata like projection?
* Build a Jupyter notebook with an example solution? Include an example GeoJSON file (or
  other format) representing what the final result should look like?
