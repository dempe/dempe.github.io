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
   note='A learning algorithm receives training data and determines the parameters that make the hypothesis most accurately predict a value in \\(Y\\) given a value in \\(X\\).'
   src='/img/model.png'
   alt='Image of how the hypothesis function works with the training data'
%}

Notation:
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(m\\) = the number of training samples
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(x^{(i)}\\) = the the input for the \\(i^{th}\\) training sample
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(y^{(i)}\\) = the the output for the \\(i^{th}\\) training sample
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(X\\) = the space of input values
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(Y\\) = the space of output values

The goal is to determine an "hypothesis" function, \\(h: X -> Y\\), that will serve as our model and allow us to predict values in \\(Y\\) given values in \\(X\\).

### Cost Function
A _cost function_{% include side_note.html
     id="cost-function"
     note="Formally, \\(J(θ_{0},θ_{1}) = \frac{1}{2m}\displaystyle\sum_{i=0}^{m}(h_{θ}(x_{i}) - h_{i})^{2}\\)"
  %} measures the efficiency of an hypothesis function. It is a sum, for each training sample, of mean square errors (predicted - actual) divided by two
{% include side_note.html
   id="gd"
   note="For ease of gradient descent calculation (i.e., when differentiated, the \\(\frac{1}{2}\\) cancels out)."
%}. The goal is to _minimize_ the cost function, \\(J(θ_{0}, θ_{1})\\), by tweaking the parameters, \\(θ_{0}\\) and \\(θ_{1}\\), to the hypothesis function, \\(h_{θ}(x) = θ_{0} + θ_{1}x\\).

{%
   include margin_note_with_image.html
   note='_Contour plots_ are a way to graph a 3D cost function in 2D.'
   src='/img/contour_plot.png'
   alt='Image of a contour plot.'
%}

The cost function essentially maps the parameters, \\(θ_{0}\\) and \\(θ_{1}\\), of a model (hypothesis function) to a number. By finding the global minimum of the cost function, we derive the optimal parameters to pass to the hypothesis function and, thus, obtain (based on known data) the most accurate hypothesis function.

## Parameter Learning

### Gradient Descent
We now have _two_ tools in our toolbelt: __1.__ an hypothesis function, \\(h\\), and __2.__ a way to determine how well our hypothesis function fits the data - the cost function, \\(J\\) ... but how exactly do we find the minimum of the cost function?

{%
   include margin_note_with_image.html
   note='Gradient descent finds a minimum of the cost function by taking the path of steepest descent.'
   src='/img/gradient_descent.png'
   alt='Image of gradient descent in action.'
%}

_Gradient descent_ is a method for finding the minimum of \\(J\\). GD works by taking the derivative of \\(J\\) and following the path of _steepest_ descent to _a_ minimum (point where the derivative is zero).

How quickly gradient descent converges can be controlled via the _learning rate_ parameter, \\(α\\). A larger \\(α\\) yields larger steps, while a smaller \\(α\\) yields smaller steps. The _direction_ of each step is based on the partial derivative of \\(J\\).

Formally, the GD algorithm is
<br/><br/>_repeat until convergence_: \\[θ_{j} := θ_{j} - α(\frac{∂}{∂θ_{j}})J(θ_{0}, θ_{1}, ..., θ_{n})\\] where \\(j ⊂ \\{0, 1, ..., n\\}\\), the feature index number.
{% include side_note.html
   id="gd2"
   note="Before using GD, you must choose a starting point on \\(J\\)."
%}

### Gradient Descent in Practice
The smaller the learning rate, \\(α\\), the longer GD will take. Choosing α too small may take forever. Choosing α too large, GD may not converge or may even _diverge_ as it will overshoot the minimum. As GD approaches a minimum, steps get smaller and smaller (even with a fixed \\(α\\), because the derivative is approaching 0.

Another drawback is that GD can find a local minimum rather than the true minimum.

### Gradient Descent for Linear Regression
By taking the partial derivate of the cost function for linear regression, we obtain the GD algorithm  {% include side_note.html
     id="gd3"
     note='This form of GD is called "batch gradient descent", since it looks at all the training examples at once.'%} for linear regression:

_repeat until convergence_:
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(θ_{0} := \frac{α}{2m}\displaystyle\sum_{i=0}^{m}(h_{θ}(x_{i}) - h_{i})\\)
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(θ_{1} := \frac{α}{2m}\displaystyle\sum_{i=0}^{m}((h_{θ}(x_{i}) - h_{i})x_{i})\\)

GD for linear regression has no local optima; only a global minimum, and, thus, should always converge assuming the learning rate, _α_, is not too large.

## Multivariate Linear Regression

### Multiple Features
Notation:
<br/>\\(x^{(i)}_{j} =\\) the value of the \\(j^{th}\\) feature of the \\(i^{th}\\) training sample
<br/>\\(x^{(i)} =\\) the input features of the \\(i^{th}\\) training sample
<br/>\\(m =\\) the number of training examples
<br/>\\(n =\\) the number of features

With this notation, the multivariate form of the hypothesis function is then ...<br/> \\(h_{θ}(x) = θ_{0} + θ_{1}x_{1} + ... θ_{n}x_{n}\\).
{% include side_note.html
     id="multi-variate-hypo"
     note='This is for one training example.'%}

It can be expressed in vectors like so ...
{% include side_note.html
     id="multi-variate-hypo-vector"
     note='This assumes \\(x_{0} = 1\\) for convenience so that both vectors have the same length and can thus be multiplied.'%}
\\[h_{θ}(x) =
  \begin{pmatrix}
    θ_{0} & θ_{1} & \dots & θ_{n}
    \end{pmatrix}
    \begin{pmatrix}
      x_{0} \\\
      x_{1} \\\
      \vdots \\\
       x_{n}
    \end{pmatrix}  = θ^{T}x\\]

In an example for predicting a species' population,
<br/>&nbsp;&nbsp;&nbsp;&nbsp;- \\(θ_{0}\\) would be the base population
<br/>&nbsp;&nbsp;&nbsp;&nbsp;- \\(θ_{1}\\) might be the population per predator
<br/>&nbsp;&nbsp;&nbsp;&nbsp;- \\(θ_{2}\\) might be the population per food source
<br/>&nbsp;&nbsp;&nbsp;&nbsp;- Given \\(θ_{1}\\) is the population per predator, \\(x_{1}\\) would be the number of predators
<br/>&nbsp;&nbsp;&nbsp;&nbsp;- Given \\(θ_{2}\\) is the population per food source, \\(x_{2}\\) would be the number of food sources

### Gradient Descent for Multiple Variables
