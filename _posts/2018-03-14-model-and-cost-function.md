---
layout: post
title: "Model and Cost Function"
date: 2018-03-14 00:00:01
updated: none
tags: machine-learning
excerpt: These are my notes on the model and cost function section of Andrew Ng's [machine learning course](https://www.coursera.org/learn/machine-learning/home/welcome).
---

### Model Representation
{%
   include margin_note_with_image.html
   note='A learning algorithm receives training data and determines the parameters that make the hypothesis most accurately predict a value in \\(Y\\) given a value in \\(X\\).'
   src='/img/model.png'
   alt='Image of how the hypothesis function works with the training data'
%}

Notation:
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(m =\\) the number of training samples
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(x^{(i)} =\\) the the input for the \\(i^{th}\\) training sample
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(y^{(i)} =\\) the the output for the \\(i^{th}\\) training sample
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(X =\\) the space of input values
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(Y =\\) the space of output values

The goal is to determine an "hypothesis" function, \\(h: X -> Y\\), that will serve as our model and allow us to predict values in \\(Y\\) given values in \\(X\\).

### Cost Function
A _cost function_{% include side_note.html
     id="cost-function"
     note="Formally, \\(J(θ_{0},θ_{1}) = \frac{1}{2m}\displaystyle\sum_{i=0}^{m}(h_{θ}(x_{i}) - h_{i})^{2}\\)"
  %} measures the efficiency of an hypothesis function. It is a sum, for each training sample, of mean square errors (predicted - actual) divided by two
{% include side_note.html
   id="gd"
   note="For ease of differentiation (i.e., when differentiated, the \\(\frac{1}{2}\\) cancels out)."
%}. The goal is to _minimize_ the cost function, \\(J(θ_{0}, θ_{1})\\), by tweaking the parameters, \\(θ_{0}\\) and \\(θ_{1}\\), to the hypothesis function, \\(h_{θ}(x) = θ_{0} + θ_{1}x\\).

{%
   include margin_note_with_image.html
   note='_Contour plots_ are a way to graph a 3D cost function in 2D.'
   src='/img/contour_plot.png'
   alt='Image of a contour plot.'
%}

The cost function essentially maps the parameters, \\(θ_{0}\\) and \\(θ_{1}\\), of a model (hypothesis function) to a number. By finding the global minimum of the cost function, we derive the optimal parameters to pass to the hypothesis function and, thus, obtain (based on known data) the most accurate hypothesis function.
