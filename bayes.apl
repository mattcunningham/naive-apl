⍝ Bayesian Classifier
⍝ © 2015 Matthew Cunningham
⍝ Licensed under the MIT license
⍝ http://www.opensource.org/licenses/mit-license
⍝
⍝ Format:
⍝   ('training text' 0) ('training text' 1) b 'text to be classified'
⍝
⍝ Output:
⍝   The indexes correspond to the group assignment during training.
⍝   Ex. 0.70 0.30

b ← {
  ∆ ← ⍺  ⍝ training data
  a ← {⍵⊂⍨~⍵∊' '}  ⍝ space separator
  b ← {⍵,q←' '}  ⍝ add space after ⍵
  η ← {'',a∊b¨(⍵=1⊃¨∆)/0⊃¨∆}  ⍝ find all words in a group (⍵) of the training data
  d ← {  ⍝ scoring
    e← (⍴η⍺)÷((⍴η 0)+(⍴η 1)) ⍝ percent of group in total training data
    o←({+/(a∊b¨0⊃¨∆)∊⍵ ''}¨a⍵)  ⍝ sum of members of testing data in training data
    e××/(1E¯10+((⍺{+/¨(⍺{(η⍺)∊⍵ ''}¨(a⍵))}⍵)÷(⍴η⍺))×o)÷(1+o)  ⍝ (assumed + (percent of specific group ÷ total words in group) × total) ÷ (weight+total)
  }
  (0d⍵)(1d⍵)÷((0d⍵)+(1d⍵))
}
