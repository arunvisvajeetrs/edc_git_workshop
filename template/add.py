#!/usr/bin/env python

import sys


def add(a, b):
    return a + b  # <random>


if __name__ == "__main__":
    result = add(2, 3)
    if result == 5:
        sys.exit(0)
    sys.exit(f"Wrong result, should be 5, is {result}")
