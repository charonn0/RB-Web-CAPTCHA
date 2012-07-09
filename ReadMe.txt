This class implements a CAPTCHA control (https://en.wikipedia.org/wiki/CAPTCHA)

Simply drag an instance of the Captcha control onto a WebPage and provide the user some way of typing and answer.
Then, compare their Answer to the Captcha's Answer. The user may click the Captcha for a new Captcha.

The Challenge presented to the user is a simple arithmetic problem using numbers 0-10 and the multply, divide, add, and subtract
arithmetical operations (e.g. "2 + 1 = ?")

A variable amount of 'Noise' can be included in the Challenge image to increase the difficulty for bots to OCR it. The Noisiness
property controls the noise level: 0 = no noise, >0 = progressively more noise.