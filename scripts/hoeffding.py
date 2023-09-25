#!/usr/bin/env python3
import numpy as np
import argparse
from typing import Optional

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-n", type=str, help="Number of samples")
    parser.add_argument("-eps", type=str, help="epsilon")
    parser.add_argument("-p", type=str, help="probability")
    parser.description("Calculate Hoeffding bound")
    args = parser.parse_args()

    n: Optional[int]
    if args.n is None:
        n = None
    else:
        n = int(args.n)

    eps: Optional[float]
    if args.eps is None:
        eps = None
    else:
        eps = float(args.eps)

    prob: Optional[float]
    if args.p is None:
        prob = None
    else:
        prob = float(args.p)

    assert sum(e is None for e in (n, eps, prob)) == 1  # because determine one of them from the other two
    if prob is None:
        prob = 2 * np.exp(-2 * eps * eps * n)
        print(prob)
    elif n is None:
        n = -np.log(prob / 2) / (2 * eps * eps)
        print(n)
    elif prob is None:
        prob = 2 * np.exp(-2 * eps * eps * n)
        print(prob)
