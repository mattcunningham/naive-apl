# Naive Bayesian Classifier in APL
[![License MIT](https://img.shields.io/npm/l/express.svg)](http://opensource.org/licenses/MIT)
© 2015 Matthew Cunningham

## About
This is a *simple* naive bayesian classifier to gain independent probabilistic assumptions on test input. The classifier requires precisely *2* groups with training data. This is just a fun side project I did over the weekend, but any contributions would be **fantastic**.

## Example
This example shows the classifier displaying the independent probabilistic assumptions on whether given text aligns with keywords of *two* different animals: *cat* or *dog*.

    $ ("meow purr hiss bad animal" 0) ("bark grr howl good animal" 1) b "I am an animal and I hiss"
    0.9999999995 4.999999994999999e¯10

The provided training data is the keywords and groups, with cat being the 0th index and dog being the 1st index. The test data consists of a string that contains keywords to align with a certain training group; in this example, cat is the classified group.
