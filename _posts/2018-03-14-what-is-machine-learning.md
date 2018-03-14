---
layout: post
title: "What is Machine Learning"
date: 2018-03-14 00:00:00
tags: machine-learning
excerpt: Here are some definitions and types of machine learning.
---

## Definitions
A hand wavey definition of _machine learning_ is teaching a computer to learn without explicitly programming it.

A more exact definition of _machine learning_ is when a computer improves in task, _T_, based on experience, _E_, measured in performance, _P_.
{% include side_note.html
     id="ml-def"
     note="For example, _T_: marking email as spam, _E_: watching user mark email as spam, _P_: correctly marking email as spam."
%}

Here's another way of looking at machine learning: whereas classical programs take in _rules_ (programs) and _data_ and output _results_, machine learning algorithms take in _data_ and _results_ and output _rules_.
{% include side_note.html
     id="ml-def2"
     note="See [_Deep Learning with Python_](https://www.manning.com/books/deep-learning-with-python?a_aid=keras&a_bid=76564dff)."
%}

## Types of Machine Learning
There are two broad categories of machine learning algorithms: _supervised_ and _unsupervised_; each with two sub-categories.

- A _supervised_ algorithm is given a set of correct or known answers (labeled data) and tasked with predicting the output of new, unseen data.
  - A _classification_ algorithm fits data into discrete categories (e.g., given a song, determine its genre).
  - A _regression_ algorithm fits data to a continuous function (e.g., given a person, determine his or her age or, given a tumor, determine if it is malignant or not).
- An _unsupervised_ algorithm is given a set of _unlabeled_ data and tasked with finding structure in the data.
  - A _clustering_ algorithm finds groups of like data (e.g., finding market segments, grouping similar news articles, etc.).
  - A _non-clustering_ algorithm finds a single, interesting trend in the data as in singular value decomposition.
