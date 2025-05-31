# Video-cryptography
A software written in D which allows you to encrypt videos in order to hide their content.

Suppose you have a video showing the next generation of robots your company is about to bring into the world, but you can't let anyone see it, therefore you can transform it into a random video, such as a movie or a cartoon, with this software here.
Then you can delete the original video, which contained sensitive information, and keep only the random video, which contains nothing interesting, if you ever want undo the conversion and watch the original video again then all you must do is use the mask file which was generated along, this mask file will be the sequence of binary which can transform the random video back into the original video, therefore you should keep this mask for future use.

Compile this code with the DMD compiler and testi it.
