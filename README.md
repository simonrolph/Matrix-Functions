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

## MPMs as Markov chains

Package requirements:

* expm

`Umat_to_Pmat(matU)` - Convert transient transition matrix (U) to discrete-time markov chain with absorbing states for each stage (P)

* P:

| U | 0 |
|---|---|
| M | I |

`occupancy_time_analysis(U)` - Produce statistics (expected, variance, standard deviation and coefficient of variation) of occupancy tie

* Inputs: U matrix
* Requires `Umat_to_Pmat()`

`longevity_analysis(U)` - Produce statistics (expected, variance, standard deviation and coefficient of variation) of longevity

* Inputs: U matrix
* Requires `Umat_to_Pmat()`

`LRO_analysis(U,R1,R2,R3)` - Produce statistics (expected, variance, standard deviation and coefficient of variation) of lifetime reproductive output

* Inputs: U matrix, reward matrices (1st, 2nd, 3rd moments, often: R1 = R2 = R3)
* Requires `Umat_to_Pmat()`
