---
layout: post
title: "Machine Learning Notes"
date: 2017-11-23 00:00:55
tags: machine-learning
excerpt: The following are my class notes for Andrew Ng's [machine learning course](https://www.coursera.org/learn/machine-learning/home/welcome) on [Coursera](https://www.coursera.org/) (with the occasional note supplemented from elsewhere).
---

{%
   include margin_note.html
   note="Unless otherwise noted, the images are also taken from his course."
%}

The following are my class notes for Andrew Ng's [machine learning course](https://www.coursera.org/learn/machine-learning/home/welcome) on [Coursera](https://www.coursera.org/) (with the occasional note supplemented from elsewhere).

## Introduction

### Definitions
  A hand wavey definition of _machine learning_ is teaching a computer to learn without explicitly programming it.

  A more exact definition of _machine learning_ is when a computer improves in task, _T_, based on experience, _E_, measured in performance, _P_.  {% include side_note.html
       id="ml-def"
       note="For example,
           _T_: marking email as spam
           _E_: watching user mark email as spam
           _P_: correctly marking email as spam"
    %}  

### Types of Machine Learning
There are two broad categories of machine learning algorithms: _supervised_ and _unsupervised_; each with two sub-categories.

  - A _supervised_ algorithm is given a set of correct or known answers (labeled data) and tasked with predicting the output of new, unseen data.
    - A _classification_ algorithm fits data into discrete categories (e.g., given a song, determine its genre).
    - A _regression_ algorithm fits data to a continuous function (e.g., given a person, determine his or her age or, given a tumor, determine if it is malignant or not).
  - An _unsupervised_ algorithm is given a set of _unlabeled_ data and tasked with finding structure in the data.
    - A _clustering_ algorithm finds groups of like data (e.g., finding market segments, grouping similar news articles, etc.).
    - A _non-clustering_ algorithm finds a single, interesting trend in the data as in singular value decomposition.

## Model and Cost Function

### Model Representation
{%
   include margin_note_with_image.html
   note='A learning algorithm takes in training data and determines the parameters that make the hypothesis most accurately predict a value in Y given a value in X.'
   src='/img/model.png'
   alt='Image of how the hypothesis function works with the training data'
%}

Notation
<br/>&nbsp;&nbsp;&nbsp;&nbsp; _m_ = the number of training samples
<br/>&nbsp;&nbsp;&nbsp;&nbsp;_x<sup>(i)</sup>_ = the the input for the _i<sup>th</sup>_ training sample
<br/>&nbsp;&nbsp;&nbsp;&nbsp;_x<sup>(i)</sup>_ = the the input for the _i<sup>th</sup>_ training sample
<br/>&nbsp;&nbsp;&nbsp;&nbsp;_x<sup>(i)</sup>_ = the the input for the _i<sup>th</sup>_ training sample
<br/>&nbsp;&nbsp;&nbsp;&nbsp;_y<sup>(i)</sup>_ = the the output for the _i<sup>th</sup>_ training sample
<br/>&nbsp;&nbsp;&nbsp;&nbsp;_X_ = the space of input values
<br/>&nbsp;&nbsp;&nbsp;&nbsp;_Y_ = the space of output values

The goal is to determine an "hypothesis" function, _h: X -> Y_, that will serve as our model and allow us to predict values in _Y_ given values in _X_.

### Cost Function
  A _cost function_{% include side_note.html
       id="cost-function"
       note="Formally, _J(θ<sub>0</sub>,θ<sub>1</sub>) = 1/2m * ∑<sub>i=0;m</sub>(h<sub>θ</sub>(x<sub>i</sub>) - h<sub>i</sub>)<sup>2</sup>_"
    %} measures the efficiency of an hypothesis function. It is a sum, for each training sample, of mean square errors (predicted - actual) divided by two
  {% include side_note.html
     id="gd"
     note="For ease of gradient descent calculation (i.e., when differentiated, the 1/2 cancels out)."
  %}. The goal is to _minimize_ the cost function, _J(θ<sub>0</sub>, θ<sub>1</sub>)_, by tweaking the parameters, _θ<sub>0</sub>_ and _θ<sub>1</sub>_, to the hypothesis function, _h<sub>θ</sub>(x) = θ<sub>0</sub> + θ<sub>1</sub>x_.

  {%
     include margin_note_with_image.html
     note='_Contour plots_ are a way to graph a 3D cost function in 2D.'
     src='/img/contour_plot.png'
     alt='Image of a contour plot.'
  %}

  The cost function essentially maps the parameters, _θ<sub>0</sub>_ and _θ<sub>1</sub>_, of a model (hypothesis function) to a number. By finding the global minimum of the cost function, we derive the optimal parameters to pass to the hypothesis function and, thus, obtain (based on known data) the most accurate hypothesis function.

## Parameter Learning

### Gradient Descent
  We now have _two_ tools in our toolbelt: __1.__ an hypothesis function, _h_, and __2.__ a way to determine how well our hypothesis fits the data - the cost function, _J_ ... but how exactly do we find the minimum of the cost function?

  {%
     include margin_note_with_image.html
     note='Gradient descent finds a minimum of the cost function by taking the path of steepest descent.'
     src='/img/gradient_descent.png'
     alt='Image of gradient descent in action.'
  %}

  _Gradient descent_ is a method for finding the minimum of _J_. GD works by taking the derivative of _J_ and following the path of _steepest_ descent to _a_ minimum (point where the derivative is zero).

  How quickly gradient descent converges can be controlled via the _learning rate_ parameter, _α_. A larger α yields larger steps, while a smaller α yields smaller steps. The _direction_ of each step is based on the partial derivative of _J_.

  Formally, the GD algorithm is - _repeat until convergence_: _θ<sub>j</sub> := θ<sub>j</sub> - α(∂/∂θ<sub>j</sub>)J(θ<sub>0</sub>, θ<sub>1</sub>, ..., θ<sub>n</sub>)_, where _j ⊂ {0, 1, ..., n}_, the feature index number.
  {% include side_note.html
     id="gd2"
     note="Before using GD, you must choose a starting point on _J_."
  %}

### Gradient Descent in Practice
  The smaller the learning rate, α, the longer GD will take. Choosing α too small may take forever. Choosing α too large, GD may not converge or may even _diverge_ as it will overshoot the minimum. As GD approaches a minimum, steps get smaller and smaller (even with a fixed α), because the derivative is approaching 0.

  Another drawback is that GD can find a local minimum rather than the true minimum.

### Gradient Descent for Linear Regression
  By taking the partial derivate of the cost function for linear regression, we obtain the GD algorithm  {% include side_note.html
       id="gd3"
       note='This form of GD is called "batch gradient descent", since it looks at all the training examples at once.'%} for linear regression:

  _repeat until convergence_:
    <br/>&nbsp;&nbsp;&nbsp;&nbsp;_θ<sub>0</sub> := (α/2m) * ∑<sub>i=0;m</sub>(h<sub>θ</sub>(x<sub>i</sub>) - h<sub>i</sub>)_
    <br/>&nbsp;&nbsp;&nbsp;&nbsp;_θ<sub>1</sub> := (α/2m) * ∑<sub>i=0;m</sub>((h<sub>θ</sub>(x<sub>i</sub>) - h<sub>i</sub>)x<sub>i</sub>)_

  GD for linear regression has no local optima; only a global minimum, and, thus, should always converge assuming the learning rate, _α_, is not too large.

## Multivariate Linear Regression

### Multiple Features
Notation:
<br/>&nbsp;&nbsp;&nbsp;&nbsp;_x<sup>(i)</sup><sub>j</sub>_ = the value of the _j<sup>th</sup>_ feature of the _i<sup>th</sup>_ training sample
<br/>&nbsp;&nbsp;&nbsp;&nbsp;_x<sup>(i)</sup>_ = the input features of the _i<sup>th</sup>_ training sample
<br/>&nbsp;&nbsp;&nbsp;&nbsp;_m_ = the number of training examples
<br/>&nbsp;&nbsp;&nbsp;&nbsp;_n_ = the number of features

With this notation, the multivariate form of the hypothesis function is then ...<br/> _h<sub>θ</sub>(x) = θ<sub>0</sub> + θ<sub>1</sub>x<sub>1</sub> + ... θ<sub>n</sub>x<sub>n</sub>_{% include side_note.html
     id="multi-variate-hypo"
     note='This is for one training example.'%}, and it can be expressed in vectors like so ... <br/> _h<sub>θ</sub>(x) = [θ<sub>0</sub> θ<sub>1</sub> ... θ<sub>n</sub>]<sup>T</sup> [x<sub>0</sub> x<sub>1</sub> ... x<sub>n</sub>] = θ<sup>T</sup>x_{% include side_note.html
     id="multi-variate-hypo-vector"
     note='This assumes _x<sub>0</sub> = 1_ for convenience so that both vectors have the same length and can thus be multiplied.'%}.

In an example for predicting a species' population,
<br/>&nbsp;&nbsp;&nbsp;&nbsp;- _θ<sub>0</sub>_ would be the base population
<br/>&nbsp;&nbsp;&nbsp;&nbsp;- _θ<sub>1</sub>_ might be the population per predator
<br/>&nbsp;&nbsp;&nbsp;&nbsp;- _θ<sub>2</sub>_ might be the population per food source
<br/>&nbsp;&nbsp;&nbsp;&nbsp;- Given _θ<sub>1</sub>_ is the population per predator, _x<sub>1</sub>_ would be the number of predators
<br/>&nbsp;&nbsp;&nbsp;&nbsp;- Given _θ<sub>2</sub>_ is the population per food source, _x<sub>2</sub>_ would be the number of food sources

### Gradient Descent for Multiple Variables
