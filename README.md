# Naive Bayesian Classifier in APL
[![License MIT](https://img.shields.io/npm/l/express.svg)](http://opensource.org/licenses/MIT)
© 2015-2016 Matthew Cunningham

## About
This is a *simple* naive bayesian classifier to gain independent probabilistic assumptions on test input. The classifier requires precisely *2* groups with training data. This is just a fun side project I did over the weekend, but any contributions would be **fantastic**.

## Example
This example shows the classifier displaying the independent probabilistic assumptions on whether given text aligns with keywords of *two* different animals: *cat* or *dog*.

    $ ("meow purr hiss bad animal" 0) ("bark grr howl good animal" 1) b "I am an animal and I hiss"
    0.9999999995 4.999999994999999e¯10

[Try out this example using ngn/apl's online interpreter.](http://ngn.github.io/apl/web/index.html#code=b%u2190%7B%u2206%u2190%u237A%u22C4a%u2190%7B%u2375%u2282%u2368%7E%u2375%u220A%27%20%27%7D%u22C4b%u2190%7B%u2375%2Cq%u2190%27%20%27%7D%u22C4%u03B7%u2190%7B%27%27%2Ca%u220Ab%A8%28%u2375%3D1%u2283%A8%u2206%29/0%u2283%A8%u2206%7D%u22C4d%u2190%7Bo%u2190%28%7B+/%28a%u220Ab%A80%u2283%A8%u2206%29%u220A%u2375%20%22%22%7D%A8a%u2375%29%u22C4%28%28%u2374%u03B7%u237A%29%F7%28%28%u2374%u03B7%200%29+%28%u2374%u03B7%201%29%29%29%D7%D7/%281E%AF10+%28%28%u237A%7B+/%A8%28%u237A%7B%28%u03B7%u237A%29%u220A%u2375%20%27%27%7D%A8%28a%u2375%29%29%7D%u2375%29%F7%28%u2374%u03B7%u237A%29%29%D7o%29%F7%281+o%29%7D%u22C4%280d%u2375%29%281d%u2375%29%F7%28%280d%u2375%29+%281d%u2375%29%29%7D%0A%28%22meow%20purr%20hiss%20bad%20animal%22%200%29%20%28%22bark%20grr%20howl%20good%20animal%22%201%29%20b%20%22I%20am%20an%20animal%20and%20I%20hiss%22)

The provided training data is the keywords and groups, with cat being the 0th index and dog being the 1st index. The test data consists of a string that contains keywords to align with a certain training group; in this example, cat is the classified group.
