# CS475-Autocorrelation-MPI-Parallelism

mpi.cpp is an application that uses MPI parallelism in order to utilize Autocorrelation to clean up a noisy signal muddled by a delayed copy of itself.


A description of Autocorrelation from the project's description:

Wikipedia's definition of Autocorrelation:
"Autocorrelation, also known as serial correlation, is the correlation of a signal with a delayed copy of itself as a function of delay. Informally, it is the similarity between observations as a function of the time lag between them."

What does this actually mean? It means you take an apparently noisy signal, i.e., an array of length NUMELEMENTS random-looking values sampled over time:

You then multiply each array element by itself and add them up:

Sums[0] = A[0]*A[0] + A[1]*A[1] + ... + A[NUMELEMENTS-1]*A[NUMELEMENTS-1]

That will give you a large number because you are essentially taking the sum of the squares of the array elements. Big whoop. This is not interesting, so we ignore Sums[0]. The other Sums[*], however, are much more interesting.

You then shift the array over one index and do the pairwise multiplication again. This gives a resulting value of

Sums[1] = A[0]*A[1] + A[1]*A[2] + ... + A[NUMELEMENTS-1]*A[0]

Now, if the signal is truly noisy, there will be positive and negative array values in there being multiplied together, giving both positive and negative products. Many of these will cancel each other out. So, by doing this shift before multiplying, you will get a much smaller sum.

You then shift over by 2 indices and do it again,

Sums[2] = A[0]*A[2] + A[1]*A[3] + ... + A[NUMELEMENTS-2]*A[0] + A[NUMELEMENTS-1]*A[1]

and do it again, and do it again, and so on. 

