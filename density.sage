def shiftprimes_factordensity(k,N):
    P = list(primes(N))
    pset = set()
    for p in P:
        if p <= k:
            continue
        f = set([x[0] for x in factor(p - k)])
        pset = pset.union(f)
    return len(pset)/len(P)
from sage.plot.scatter_plot import scatter_plot
def plot_shiftprimes_factordensity(k,N):
    X = [p for p in primes(N) if p > 2]
    Y = [shiftprimes_factordensity(k,x) for x in X]
    return scatter_plot(list(zip(X, Y)), markersize=1, facecolor='black')
N = 500
sum(plot_shiftprimes_factordensity(k,N) for k in range(100))
