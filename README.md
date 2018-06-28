

# Matrix-Functions
R scripts working with matrix population models (MPMs)

## Correcting seed stage error

[`convert2post(mat,matF)`](https://raw.githubusercontent.com/simonrolph/Matrix-Functions/master/convert2post.R) - Convert a matrix model with seed stage error to a post-reproductive census without the error
Assuming:
* Stage 1 is the first stage of the lifecycle
* Matrix is split so that we have matA and matF

[`convert2pre(mat,matF)`](https://raw.githubusercontent.com/simonrolph/Matrix-Functions/master/convert2pre.R) - Convert a matrix model with seed stage error to a pre-reproductive census without the error
Assuming:
* Stage 1 is the first stage of the lifecycle
* Matrix is split so that we have matA and matF

## MPMs as Markov chains

This is stuff to do with:
http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0020809

It is code adapted from MATLAB scripts provided at a couse taught by Hal Caswell at the Max Plank Institute for Demographic Research.

I haven't touched this conde in ages, **use at your own risk**.

Package requirements:

* expm

[`Umat_to_Pmat(matU)`](https://raw.githubusercontent.com/simonrolph/Matrix-Functions/master/Umat_to_Pmat.R) - Convert transient transition matrix (U) to discrete-time markov chain with absorbing states for each stage (P)

* P:

| U | 0 |
|---|---|
| M | I |

[`occupancy_time_analysis(U)`](https://raw.githubusercontent.com/simonrolph/Matrix-Functions/master/occupancy_time_analysis.R) - Produce statistics (expected, variance, standard deviation and coefficient of variation) of occupancy tie

* Inputs: U matrix
* Requires `Umat_to_Pmat()`

[`longevity_analysis(U)`](https://raw.githubusercontent.com/simonrolph/Matrix-Functions/master/longevity_analysis.R) - Produce statistics (expected, variance, standard deviation and coefficient of variation) of longevity

* Inputs: U matrix
* Requires `Umat_to_Pmat()`

[`generate_R1(P,s,type = "occupancy",death_contrib = 0.5)`](https://raw.githubusercontent.com/simonrolph/Matrix-Functions/master/generate_R1.R) - Generate first moment reward matrix (R1)

* Inputs: P matrix, number of transient states, what type of reward (only ocupancy implemented at the moment), death_contrib (reward given upon death, default = 0.5)

[`generate_R123(R1,distri = "fixed")`](https://raw.githubusercontent.com/simonrolph/Matrix-Functions/master/generate_R123.R) - From R1, generate the 2nd and 3rd moment reward matrices

* Imputs: First moment reward matrix, type of distribution (bernoulli, fixed, poisson)

[`reward_analysis(P,s,R123)`](https://raw.githubusercontent.com/simonrolph/Matrix-Functions/master/reward_analysis.R) - Produce statistics (expected, variance, standard deviation and coefficient of variation) of lifetime reproductive output

* Inputs: U matrix, reward matrices (1st, 2nd, 3rd moments, often: R1 = R2 = R3)

### Example Code

```

U <- matrix(c(0.2,0.5,0,0,0,0.8,0,0,0.9),nrow = 3)
s <- dim(U)[1]
P <- Umat_to_Pmat(U)
R1 <- generate_R1(P,s,type = "occupancy",death_contrib = 0.5)
R123 <- generate_R123(R1,distri = "bernoulli")
results <- reward_analysis(P,s,R123)

```
