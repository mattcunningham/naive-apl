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
  training_data ← ⍺  ⍝ The training data.  Data stored in ∆ to be global in this function.

  ⍝ Finds all the words in a specified group.  Used with the training data.
  ⍝ ⍺ → Integer scalar
  ⍝     The group number for the limitation of the words
  ⍝ ⍵ → String vector
  ⍝     The training data (∆)
  words_in_group ← {
    space_sep ← {⍵⊂⍨~⍵∊' '}  ⍝ Separates words from a string vector into a string array
    add_space ← {⍵,q←' '}  ⍝ Adds after space after the argument
    words_in_training ← (⍺=1⊃¨⍵)/0⊃¨⍵  ⍝ Finds all the words in a specified group.
    '' , space_sep ∊ add_space ¨ words_in_training  ⍝ Return: Formatting words_in_training
  }

  ⍝ Finds the sum of instances of a word as member of all training data.
  ⍝ ⍺ → None
  ⍝ ⍵ → String scalar
  ⍝     A single word of the testing data
  num_members_of_all ← {
    space_sep ← {⍵⊂⍨~⍵∊' '}  ⍝ Separates words from a string vector into a string array
    all_words ← 0⊃¨training_data  ⍝ Finds all the words in the training data.
    add_space ← {⍵,q←' '}  ⍝ Adds after space after the argument
    +/(space_sep ∊ add_space ¨ all_words)∊⍵ ''  ⍝ Return: Sum of instances a word of as member of the training data.
  }

  ⍝ Finds the total sum of instances of membership of each word in a group of the training data.
  ⍝ ⍺ → Integer scalar
  ⍝     The group number the words are limited to.
  ⍝ ⍵ → String scalar
  ⍝     The testing data
  num_members_in_group ← {
    space_sep ← {⍵⊂⍨~⍵∊' '}  ⍝ Separates words from a string vector into a string array
    membership ← {(⍺ words_in_group training_data)∊⍵ ''}  ⍝ Finds the membership of ⍵ in a group (⍺) of the training data.
    +/¨(⍺ membership¨ (space_sep ⍵)) ⍝ Return: Sum of instances of membership of each word in training data.
  }

  ⍝ Finds the probability of the test string to match with the training data.
  ⍝ ⍺ → Integer scalar
  ⍝     The group of the training data that will be exposed to the training data.
  ⍝ ⍵ → String scalar
  ⍝     The testing data
  score ← {
    weight ← 1  ⍝ Failsafe if testing data does not appear in training data
    assumed ← 1E¯10  ⍝ Failsafe if testing data does not appear in training data
    space_sep ← {⍵⊂⍨~⍵∊' '}  ⍝ Separates words from a string vector into a string array
    total ← num_members_of_all¨space_sep ⍵  ⍝ Finds the sum of instances of a word as member of the training data.
    perc_of_total ← (⍴ ⍺ words_in_group training_data)÷((⍴ 0 words_in_group training_data)+(⍴ 1 words_in_group training_data))  ⍝ Finds the percent of a specified group in the total training data.
    basic_prob ← ((⍺ num_members_in_group ⍵)÷(⍴ ⍺ words_in_group training_data))  ⍝ Finds the percent of a specific word (⍵) in a group (⍺) of the total group (⍺).
    prob_of_test ← ×/ (assumed + basic_prob × total) ÷ (weight+total)  ⍝ Find the probability of test data
    perc_of_total × prob_of_test  ⍝ Result: Finds product of percent of specific group in total and probability of test data
  }

  sum_of_groups ← ((0 score ⍵)+(1 score ⍵))  ⍝ Sum of the two group's scores
  ((0 score ⍵)÷sum_of_groups) ((1 score ⍵)÷sum_of_groups)  ⍝ Result: Each group's percent of total score
}
