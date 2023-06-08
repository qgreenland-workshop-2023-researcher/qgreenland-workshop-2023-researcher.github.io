---
title: "Lessons learned"
---

## Impressions

* JupyterHub is a powerful educational tool. With the release of JupyterLab 4 and
  real-time collaboration at `v1.0.0`, I can envision JupyterHubs becoming even more
  useful, for example enabling real-time collaborative technical support, or for small
  group exercises to be done in a shared notebook.
* The CryoCloud JupyterHub performed flawlessly and did everything we need. I was
  surprised how smooth it was for attendees from around the globe to use QGIS in a
  virtual desktop environment.
* Our attendees were very engaged, and this made the workshop very rewarding and lots of
  fun to administrate.


## Changes we'd like to make

* The material we developed technically fit in the schedule, but we wanted to provide
  more time for attendees to do hands-on work. Either increase the time for the
  material, or cut some material.
* When sending 5-minute warnings at the end of breakout group exercises, ask attendees
  to commit their work to GitHub now, regardless of whether it's done.
* For the [Symbolizing datasets together
  exercise](/content/exercises/symbology.md), it would be helpful to include a
  deliverable in addition to the `.qml` files. Maybe a screenshot and/or
  discussion post. This would make it easier for us to review the outcomes from
  this exercise.
* We should have prescribed a more clear structure for file names/structure in git
  repos. It can be initially hard to tell which notebooks correspond to each
  exercise in groups' repos.
* Archive all workshop materials after completion. We had a temporary workspace
  (`qgis-data`) which had faster storage that allowed e.g., QGIS to more quickly
  access data in QGreenland that participants used and stored some data on. This
  directory got cleaned-up after the workshop.


## Tips and tricks

* Let people join their own breakout rooms; trying to predict what e-mail people
  will join Zoom with and pre-configuring breakout rooms turned out to be a time
  sink. Inevitably, some will join from their phone, not sign in, etc. resulting in
  spending time manually setting up breakout rooms.
* One problem we encountered was copy/paste from the clipboard does not work
  between the remote desktop and the user's local desktop environment. In order
  to get around this limitation, workshop participants resorted to using a text
  file for transfering text between the remote and local desktop
  environments. For example, if a user wanted to move text from their local
  desktop to the CryoCloud desktop environment, they would save that text to a
  file (e.g., `copy.txt`) and then transfer that file to CryoCloud (either by
  uploading the file through the file browser interface in JupyterLab or using
  JupyterLab's built-in file editor).



### Run of show

We created run-of-show documents in Google Docs that we could collaboratively edit to
manage team checklists and roles.

_TODO: Link read-only copies_
