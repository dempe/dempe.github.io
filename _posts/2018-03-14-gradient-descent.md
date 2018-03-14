---
layout: post
title: "What is Gradient Descent"
date: 2018-03-14 00:00:02
tags: machine-learning
excerpt: none
---

## Parameter Learning - Gradient Descent
We now have _two_ tools in our toolbelt: __1.__ an hypothesis function, \\(h\\), and __2.__ a way to determine how well our hypothesis function fits the data - the cost function, \\(J\\) ... but how exactly do we find the minimum of the cost function?

{%
   include margin_note_with_image.html
   note='Gradient descent finds a minimum of the cost function by taking the path of steepest descent.'
   src='/img/gradient_descent.png'
   alt='Image of gradient descent in action.'
%}

_Gradient descent_ is a method for finding the minimum of \\(J\\). Gradient descent works by taking the derivative of \\(J\\) and following the path of _steepest_ descent to _a_ minimum (point where the derivative is zero).

How quickly gradient descent converges can be controlled via the _learning rate_ parameter, \\(α\\). A larger \\(α\\) yields larger steps, while a smaller \\(α\\) yields smaller steps. The _direction_ of each step is based on the partial derivative of \\(J\\).

The gradient descent algorithm is

_repeat until convergence_:
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(θ_{j} := θ_{j} - α(\frac{∂}{∂θ_{j}})J(θ_{0}, θ_{1}, ..., θ_{n})\\)

where \\(j \in \\{0, 1, ..., n\\}\\), the feature index number.
{% include side_note.html
   id="gd2"
   note="Before using gradient descent, you must choose a starting point on \\(J\\)."
%}

## Gradient Descent in Practice
The smaller the learning rate, \\(α\\), the longer gradient descent will take. Choosing α too small may take forever. Choosing α too large, gradient descent may not converge or may even _diverge_ as it will overshoot the minimum. As gradient descent approaches a minimum, steps get smaller and smaller (even with a fixed \\(α\\), because the derivative is approaching 0).

Another drawback is that gradient descent can find a local minimum rather than the true minimum.

## Gradient Descent for Linear Regression
By taking the partial derivate of the cost function for linear regression, we obtain the gradient descent algorithm  {% include side_note.html
     id="gd3"
     note='This form of gradient descent is called "batch gradient descent", since it looks at all the training examples at once.'%} for linear regression:

 _repeat until convergence_:
 <br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(θ_{0} := θ_{0} - α\frac{1}{m}\displaystyle\sum_{i=0}^{m}(h_{θ}(x_{i}) - y_{i})\\)
 <br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(θ_{1} := θ_{1} - α\frac{1}{m}\displaystyle\sum_{i=0}^{m}((h_{θ}(x_{i}) - y_{i})x_{i})\\)

Gradient descent for linear regression has no local optima; only a global minimum, and, thus, should always converge assuming the learning rate, _α_, is not too large.

## Gradient Descent for Multiple Variables

Remember that gradient descent for linear regression was:

_repeat until convergence_:
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(θ_{0} := θ_{0} - α\frac{1}{m}\displaystyle\sum_{i=0}^{m}(h_{θ}(x_{i}) - y_{i})\\)
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(θ_{1} := θ_{1} - α\frac{1}{m}\displaystyle\sum_{i=0}^{m}((h_{θ}(x_{i}) - y_{i})x_{i})\\)

If we assume that \\(x_{0} = 1\\), then it can be rewritten like so:

_repeat until convergence_:
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(θ_{0} := θ_{0} - α\frac{1}{m}\displaystyle\sum_{i=0}^{m}((h_{θ}(x_{i}) - y_{i})x_{0}^{(i)})\\)
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(θ_{1} := θ_{1} - α\frac{1}{1m}\displaystyle\sum_{i=0}^{m}((h_{θ}(x_{i}) - y_{i})x_{1}^{(i)})\\)

We then arrive at a genericized form of gradient descent for multiple variables:

_repeat until convergence_:
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(θ_{j} := θ_{j} - α\frac{1}{m}\displaystyle\sum_{i=0}^{m}((h_{θ}(x_{i}) - y_{i})x_{j}^{(i)})\\)

The \\(\frac{1}{m}\displaystyle\sum_{i=0}^{m}((h_{θ}(x_{i}) - y_{i})x_{j}^{(i)})\\) portion is just the partial derivative of the cost function, so the algorithm can be more compactly written as:

_repeat until convergence_:
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(θ_{j} := θ_{j} - α(\frac{∂}{∂θ_{j}})J(θ)\\)

## Gradient Descent in Practice I: Feature Scaling

When our model has multiple features, each of these features may take on very different ranges.  For example, in predicting housing prices, \\(θ_{1}\\) may represent square feet and range from 500 to 2500 while \\(θ_{2}\\) may represent the number of bedrooms and range from 1 to 5.  These drastically different ranges will result in a skewed, oval-shaped cost function.  Gradient descent performs very poorly on such a cost function.

To ameliorate this, we can use _feature scaling_.  Feature scaling simply divides each feature by its maximum value.  For a feature, \\(x_{i}\\), that ranges from 500 to 2500, we would just divide by 2500.  This would reduce the range of that feature from .2 to 1.

Another option that we can use to reduce the skewness of the cost function is _mean normalization_.  Mean normalization subtracts from each feature its mean and divides by its range.{% include side_note.html
     id="mean-normalization"
     note='Optionally, standard deviation can be used as well.'%}  For a feature that ranges from 500 to 2500 with an average of 1500, the mean normalized feature would be \\(\frac{x_{i} - 1500}{2000}\\).{% include side_note.html
          id="mean-normalization2"
          note='Formally, \\(\frac{x_{i} - u_{i}}{s_{i}}\\)'%}

Whatever you choose, ideally, your normalized features should lie within the range \\(-1 \leq x_{i} \leq 1\\). Realistically, anything within the range \\(-3 \leq x_{i} \leq 3\\) is fine.
