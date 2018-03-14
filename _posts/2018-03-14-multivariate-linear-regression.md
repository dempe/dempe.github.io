---
layout: post
title: "What is Multivariate Linear Regression"
date: 2018-03-14 00:00:03
tags: machine-learning
excerpt: none
---

## Multiple Features
Notation:
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(x^{(i)}_{j} =\\) the value of the \\(j^{th}\\) feature of the \\(i^{th}\\) training sample
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(x^{(i)} =\\) the input features of the \\(i^{th}\\) training sample
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(m =\\) the number of training examples
<br/>&nbsp;&nbsp;&nbsp;&nbsp;\\(n =\\) the number of features

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

To summarize, we have:

1. The multivariate hypothesis function, \\(h_{θ}(x) = θ^{T}x = θ_{0}x_{0} + θ_{1}x_{1} + ... θ_{n}x_{n}\\) (where \\(x_{0} = 1\\))
2. For the parameters, \\(θ_{0}, θ_{1}, ..., θ_{n}\\)
3. With the corresponding cost function, \\(J(θ_{0}, θ_{1}, ..., θ_{n}) = \frac{1}{2m}\displaystyle\sum_{i=0}^{m}(h_{θ}(x_{i}) - h_{i})^{2}\\)

Note that instead of thinking of the parameters as a series of \\(n + 1\\) separate variables, we can think of it as an \\(n + 1\\) dimensional vector, \\(θ\\). The cost function then becomes \\(J(θ)\\). This will make for easier notation.
