# Matrix-Functions
R scripts working with matrix population models (MPMs)

## Correcting seed stage error

`convert2post(mat,matF)` - Convert a matrix model with seed stage error to a post-reproductive census without the error
Assuming:
* Stage 1 is the first stage of the lifecycle
* Matrix is split so that we have matA and matF

`convert2pre(mat,matF)` - Convert a matrix model with seed stage error to a pre-reproductive census without the error
Assuming:
* Stage 1 is the first stage of the lifecycle
* Matrix is split so that we have matA and matF

33 MPMs as Markov chains

`Umat_to_Pmat(matU)` - Convert transient transition matrix (U) to discrete-time markov chain with absorbing states for each stage (P)

* P:

| U | 0 |
|---|---|
| M | I |
