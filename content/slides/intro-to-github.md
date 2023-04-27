---
title: "Intro to GitHub"
subtitle: "QGreenland Researcher Workshop 2023"
index: 40
background-image: "/_media/DMS_1842643_12758_20180418_18111267_clipped.jpg"
title-slide-attributes:
  data-background-image: "/_media/DMS_1842643_12758_20180418_18111267_clipped.jpg"
---

<!-- TODO:
* Example Open Source research repositories?
-->

# Intro to GitHub

* Provide a "taste" of the utility of Git and GitHub
* Intermediate/advanced topics out of scope
    * See [continued learning](/content/continued-learning.html#gitgithub) page
    * Attend office hours!

::: {.notes}
We love Git and are excited to teach about it, but we don't have room in this workshop
to fit that and still meet our other goals. We welcome anyone who wants to learn more to
attend office hours on day 4. We also provide resources for continued independent
learning.
:::


# Working "in the open"

![<https://allisonhorst.com>](https://cdn.myportfolio.com/45214904-6a61-4e23-98d6-b140f8654a40/e4a11b1f-f235-461f-ab73-ce6128c59e49.png?h=dc95847637c97b0d5f5c993e906f2ccd)


---

### Benefits of working in the open

* Improve reproducibility with open data and open code
    * ‼️ Zenodo [integrates with
      GitHub](https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content)
      for auto-generating DOIs
* Increase innovation and quality through inclusivity
* Facilitate global collaboration
* Easier and more powerful if you are open from the beginning
* Git/GitHub are not only for coders!

::: {.notes}
Open Science principles can apply to all of the work that you are doing. Now that we
have some knowledge about the data that we want to keep track of and share with others,
let's utilize GitHub as the mechanism to translate that knowledge to documentation.

*Git/GitHub are not only for coders!*  You can open your manuscripts, your books, your
websites, your methodology, and your documentation using these tools.
:::


# Git vs GitHub

:::::: {.columns}
::: {.column width="50%"}
![Git logo](https://git-scm.com/images/logos/downloads/Git-Icon-1788C.svg){width=300}
:::
::: {.column width="50%"}
![GitHub logo](/_media/github-mark.svg){width=300}
:::
::::::


## ![](https://git-scm.com/images/logos/downloads/Git-Icon-1788C.svg){width=50 style="vertical-align: middle"} Git

Git is the "foundation" of GitHub; it is an information (*not* code!) management
system. Git can answer questions like:

* Who made this change?
* What did this information look like last week?
* When did this change occur?
* Why was this change made?

[Learn more about Git](https://docs.github.com/en/get-started/using-git/about-git)

::: {.notes}
Git is the underlying technology that makes GitHub work. Git manages information over
time, enabling collaboration and "time travel" through the history of your work
products.

There are alternatives to Git, like Mercurial and SVN, but Git is the most widely
adopted information management tool.

At its core, Git is a command-line interface, but there are so many interfaces built on
top of it to make it more powerful and/or user-friendly. There are editor integrations
for VIM, Emacs, Visual Studio Code; there are websites built on top of it, like GitHub,
BitBucket, GitLab. 
:::


## ![](/_media/github-mark.svg){width=50 style="vertical-align: middle"} GitHub {.smaller}

GitHub is a hosting service for Git repositories with lots of extra bells and whistles.
GitHub has competitors like GitLab and BitBucket which offer similar features, like:

* Back up your work on their servers
* Facilitating conversations and approval process for changes
* Bug tracking and associated discussion
* Documentation with Wiki-like features
* Project management tools
* Running automations in response to changes, e.g.:
    * Build a website and deploy it
    * Generate a PDF from LaTeX or Markdown
    * Check code for errors or style compliance
    * Compile code

::: {.notes}
We are focusing on GitHub instead of its competitors because it is currently the most
popular. If you're interested in an alternative which is more open, consider looking
into GitLab, which offers an open-source core called "Community Edition" and a
source-available "Enterprise Edition" which provides extra features.
:::


# Demo: Setting up a GitHub repository

## Create a GitHub repository {.smaller}

![New repository button at top-right of <https://github.com>](/_media/github_new_repo.png)

![Get the "owner" right and make it public](/_media/github_new_repo_fields.png)


## Create a README file

![Add README to an empty repository](/_media/github_empty_repo_add_readme.png)

![GitHub README editor](/_media/github_readme_new.png)


---

To "save" the file, we have to click "Commit new file". It's helpful to write a change
description, but in this case the default (`Create README.md`) is already descriptive
enough.

![Commit new file to the repository](/_media/github_commit_new_file.png)


## Edit the README file

I made a mistake: I wanted the "Authors" to be on a separate line from "Selected
dataset".

![README doesn't look quite right, let's edit it](/_media/github_readme_edit_button.png)


---

I need to add a blank line between paragraphs, or Markdown will see them as a single
paragraph:

![README in the GitHub editor](/_media/github_readme_editor.png)


---

This time, I'll check my work:

![Use the preview feature to validate this time](/_media/github_readme_editor_preview.png)


---

Now it's time for a descriptive "commit message"!

![Commit changes](/_media/github_commit_changes.png)

::: {.notes}
The first line is the "subject" of the commit message, and the large text box is the
"body" of the commit message. Write a descriptive summary for the subject, and if
necessary, populate details in the body. This will build a rich and readable provenance
for your repository.
:::


## Add a Jupyter Notebook

![Download a notebook from JupyterLab](/_media/jupyterlab_download_notebook.png)


---

After selecting "Upload files", you'll be given the opportunity to browser your computer
or drag-and-drop files into GitHub.

::: {.v-centered}
![Upload a file to GitHub repository](/_media/github_upload_file.png)
:::


---

After selecting "commit" on the previous page, your files are visible in the
repository!

::: {.v-centered}
![The notebook is now in your repository!](/_media/github_repo_with_notebook.png)
:::


---

When you click to open your notebook, GitHub will display a rich preview!

![View the notebook in GitHub](/_media/github_notebook_view.png)


## Review provenance

You can view the full provenance of your repository by selecting the "Commits"
button.

![Navigate to the commits view](/_media/github_commit_button.png)


---

Our commit messages tell a story about the history of the repository.

![Commits are listed with newest at the top](/_media/github_commit_view)


## Enable GitHub Discussions

::: {.v-centered}
![GitHub repository settings](/_media/github_repo_settings.png)
:::


---

Scroll down until you see the "Features" section. From there, you can enable
"Discussions", "Issues", and many other helpful features.

![GitHub Repository > Settings > Features](/_media/github_repo_features.png)

::: {.notes}
Discussions and issues are closely related; discussions are focused around community
engagement, and issues are focused around project management. A discussion can be
converted to an issue and vice versa. We recommend using both!
:::


---

::: {.v-centered}
![Discussions navbar link is visible after enabling](/_media/github_discussions_demo_repo.png)
:::


## Zenodo integration

* Visit <https://zenodo.org>
* "Log in with GitHub"

![Navigate to Zenodo's GitHub settings](/_media/zenodo_github_settings.png)


## Scroll down until you find your repository

*Note: You may need to
[configure your organization](https://docs.github.com/en/organizations/managing-oauth-access-to-your-organizations-data/approving-oauth-apps-for-your-organization)
to enable third-party application access.*

![Enable the repository in Zenodo](/_media/zenodo_enable_repo.png)


## On GitHub, create a release

![Create a new release on GitHub](/_media/github_create_release.png)


## Input a title and "tag"

A tag is a unique string that we'll use to identify the new release. GitHub makes useful
suggestions on this page. A good first tag is `v0.1.0`.

:::::: {.columns}
::: {.column width="50%"}
![](/_media/github_release_choose_a_tag.png)
:::

::: {.column width="50%"}
![](/_media/github_release_tag_input.png)
:::
::::::


---

![Useful suggestions from GitHub on the right sidebar](/_media/github_create_release_publish.png)


---

![Our first release](/_media/github_releases_1.png)


---

![Our DOI in Zenodo! Click here to get a badge for our repo and copy the Markdown.](/_media/zenodo_release.png)


---

![Paste the Markdown in our README.md file](/_media/github_zenodo_badge_edit.png)


---

![Commit the change to the `main` branch](/_media/github_zenodo_badge_commit.png)


---

![Our badge is looking fresh!](/_media/github_zenodo_badge.png)


## What next?

- [ ] [Add a `CITATION.cff` file](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-citation-files)
      to the repository to help Zenodo generate a better citation.
- [ ] [Create a `CHANGELOG.md` file](https://keepachangelog.com/en/1.0.0/) and update it
      with every release.
- [ ] Consider other "badges" you can add, e.g.
      [NSF award badge](https://www.earthcube.org/post/make-your-github-repository-more-discoverable).
- [ ] Consider using
      [GitHub Projects](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/quickstart-for-projects)
      and
      [GitHub Issues](https://docs.github.com/en/issues/tracking-your-work-with-issues/quickstart)
      to enable community involvement and awareness from the beginning.
