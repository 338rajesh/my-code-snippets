import numpy as np
import os
import sys

npx_path = sys.argv[1]
stats_dim = int(sys.argv[2]) if len(sys.argv) > 2 else None

a = np.load(npx_path)

print(f"\nSUMMARY for {npx_path}:\n")
if isinstance(a, np.ndarray):
    print(
        f"\t shape: {a.shape}\n"
        + (f"\tminimum: {a.min(axis=stats_dim)}\n" if a.size > 0 else "")
        + (f"\tmaximum: {a.max(axis=stats_dim)}\n" if a.size > 0 else "")
    )

elif isinstance(a, np.lib.npyio.NpzFile):
    for (k, v) in a.items():
        print(k)
        print(
            f"\tshape: {v.shape}\n"
            + (f"\tminimum: {v.min(axis=stats_dim)}\n" if v.size > 0 else "")
            + (f"\tmaximum: {v.max(axis=stats_dim)}\n" if v.size > 0 else "")
        )
else:
    print("Sorry!, the file cannot be handled")
