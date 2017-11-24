---
layout: post
title: "Machine Learning Notes"
date: 2017-11-23 00:00:55
tags: machine-learning
---

The following are my class notes for Andrew Ng's [machine learning course](https://www.coursera.org/learn/machine-learning/home/welcome) on [Coursera](https://www.coursera.org/) with some notes supplemented from elsewhere.

## Introduction

### Definitions
  - _Machine learning_ is teaching a computer to learn without explicitly programming it.
  - _Machine learning_ is when a computer improves in task, _T_, based on experience, _E_, measured in performance, _P_.  For example,
    - _T_: marking email as spam
    - _E_: watching user mark email as spam
    - _P_: correctly marking email as spam


### Types of Machine Learning
  - _Supervised_ - Algorithm is given a set of correct or known answers
    - _Classification_  - fit data into discrete categories (e.g., given a song, determine its genre)
    - _Regression_ - fit data to continuous function (e.g., given a person, determine his or her age)
  - _Unsupervised_ - Algorithm is given a set of _unlabeled_ data and tasked with finding structure in the data
    - _Clustering_  - find groups of like data (e.g., finding market segments, grouping similar news articles, etc.)
    - _Non-Clustering_ - singular value decomposition, SVD

## Model and Cost Function

### Model Representation
  - Notation
    - _m_ = the number of training samples
    - _x<sup>(i)</sup>_ = the the input for the i<sup>th</sup> training sample
    - _y<sup>(i)</sup>_ = the the output for the i<sup>th</sup> training sample
    - _X_ = the space of input values
    - _Y_ = the space of output values
  - The goal is to determine an "hypothesis" function, _h: X -> Y_

### Cost Function
  - A cost function measures the efficiency of an hypothesis function.
  - A cost function, _J(θ<sub>0</sub>,θ<sub>1</sub>) = 1/2m * ∑<sub>i=0;m</sub>(h<sub>θ</sub>(x<sub>i</sub>) - h<sub>i</sub>)<sup>2</sup>_, is a sum (for each training sample) of mean square errors (predicted - actual) divided by two (for ease of gradient descent calculation (when differentiated, the 1/2 cancels out)).
  - The goal is to minimize the cost function, _J(θ<sub>0</sub>, θ<sub>1</sub>)_ by tweaking the parameters, θ<sub>0</sub> and θ<sub>1</sub>, to the hypothesis function, _h<sub>θ</sub>(x) = θ<sub>0</sub> + θ<sub>1</sub>x_.
  - The cost function essentially maps the parameters, _θ<sub>0</sub>, θ<sub>1</sub>_, of a model to a number.
  - We want to find the global minimum of _J(θ<sub>0</sub>, θ<sub>1</sub>)_
  - _Contour Plots_: way to graph a 3D cost function in 2d

## Parameter Learning

### Gradient Descent
  - We have:
    1. An hypothesis function, h
    2. A way to determine how well our hypothesis fits the data - the cost function, J
  - _Gradient descent_ is a method for finding the minimum of J.
  - GD works by taking the derivative of J.
  - It follows the path of _steepest_ descent.
  - How quickly it converges can be controlled via the _learning rate_ parameter, α.
    - A larger α yields larger steps, while a smaller α yields smaller steps.
    - The _direction_ of each step is based on the partial derivative of J.
  - The GD algorithm is - _repeat until convergence_: θ<sub>j</sub> := θ<sub>j</sub> - α(∂/∂θ<sub>j</sub>)J(θ<sub>0</sub>, θ<sub>1</sub>, ..., θ<sub>n</sub>), where j ⊂ {0, 1, ..., n}, the feature index number.
  - Before using GD, you must choose a starting point on J

### Gradient Descent in Practice
  - The smaller the α, the longer GD will take. Choosing α too small may take forever.
  - Choosing α too large, GD may not converge or may even diverge as it will overshoot the minimum.
  - GD can get stuck in local minima and fail to find the true minimum.
  - As GD approaches a minimum, steps get smaller and smaller (even with a fixed α), because the derivative is approaching 0.

### Gradient Descent for Linear Regression
  - By taking the partial derivate of the cost function for linear regression, we obtain the GD algorithm for linear regression:
    - _repeat until convergence_:
      - _θ<sub>0</sub> := (α/2m) * ∑<sub>i=0;m</sub>(h<sub>θ</sub>(x<sub>i</sub>) - h<sub>i</sub>)_
      - _θ<sub>1</sub> := (α/2m) * ∑<sub>i=0;m</sub>((h<sub>θ</sub>(x<sub>i</sub>) - h<sub>i</sub>)x<sub>i</sub>)_
  - GD for linear regression has no local optima; only a global minimum, and, thus, should always converge assuming the learning rate, α, is not too large.
  - This form of GD is called "batch gradient descent", since it looks at all the training examples at once.

## Multivariate Linear Regression

### Multiple Features
- Notation
  - _x<sup>(i)</sup><sub>j</sub>_ = the value of the j<sup>th</sup> feature of the i<sup>th</sup> training sample
  - _x<sup>(i)</sup>_ = the input features of the i<sup>th</sup> training sample
  - _m_ = the number of training examples
  - _n_ = the number of features
- The multivariate form of the hypothesis function is _h<sub>θ</sub>(x) = θ<sub>0</sub> + θ<sub>1</sub>x<sub>1</sub> + ... θ<sub>n</sub>x<sub>n</sub>_
- In an example for predicting a species' population,
  - θ<sub>0</sub> would be the base population
  - θ<sub>1</sub> might be the population per predator
  - θ<sub>2</sub> might be the population per food source
  - Given θ<sub>1</sub> is the population per predator, x<sub>1</sub> would be the number of predators
  - Given θ<sub>2</sub> is the population per food source, x<sub>2</sub> would be the number of food sources
- The multivariate hypothesis function can be expressed in vectors like so _h<sub>θ</sub>(x) = [θ<sub>0</sub> θ<sub>1</sub> ... θ<sub>n</sub>]<sup>T</sup> [x<sub>0</sub> x<sub>1</sub> ... x<sub>n</sub>] = θ<sup>T</sup>x_
  - This is for one training example
  - This assumes x<sub>0</sub> = 1 for convenience so that both vectors have the same length and can thus be multiplied

### Gradient Descent for Multiple Variables
