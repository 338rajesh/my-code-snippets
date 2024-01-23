import numpy as np
from os import path


def print_table(contents: list[list], header: list = None, pad=1):
    contents = [[f'{j}' for j in i] for i in contents]
    # print(contents)
    # n_rows = len(contents)
    assert all([len(contents[0]) == len(i) for i in contents]), "Unequal number of columns"
    n_col = len(contents[0])
    columns = [[] for _ in range(n_col)]
    for a_row in contents:
        for (col_idx, a_col) in enumerate(a_row):
            columns[col_idx].append(a_col)
    # print(columns)
    min_cell_width = max(len(j) for i in columns for j in i)
    cell_width = min_cell_width + (2 * pad)
    # print(cell_width)

    def pretty_print(_r, sep="|"):
        print(sep + sep.join([f"{a_cell:^{cell_width}}" for a_cell in _r]) + sep)

    print("=" * (n_col * (cell_width) + 4))
    if header is not None:
        assert len(header) == n_col, "Unequal number of columns and headers"
        pretty_print(header)
    print("=" * (n_col * (cell_width) + 4))
    for a_row in contents:
        pretty_print(a_row)
    print("=" * (n_col * (cell_width) + 4))
    return


def see(arr_fp):
    extn = arr_fp.split(".")[-1]
    assert extn in ("npy", "npz"), f"Invalid file extension '{extn}'"
    l1 = f"Loading {arr_fp}"
    print(f"{'*'*len(l1)}\n{l1}\n{'*'*len(l1)}")
    assert path.isfile(arr_fp), f"Invalid file: {arr_fp}"
    arr = np.load(arr_fp)
    if extn == 'npy':
        print(f"\nSummary:")
        print(f"\t{'Shape: ':15s}{arr.shape}\n")
        print(f"\t{'Data Type:':15s}{arr.dtype}\n")
        if arr.dtype in (np.float32, np.float64, np.uint8, np.int32, np.int64):
            print(f"\t{'Min Value:':15s}{arr.min()}\n")
            print(f"\t{'Max Value:':15s}{arr.max()}\n")
    else:
        arr = dict(sorted(arr.items()))  # Sorts keys in alphabetical order
        _info = []
        for (k, v) in arr.items():
            _info.append([k, v.dtype, v.shape])
            # print(f"{k} --- {v.dtype} --- {v.shape}")
        print_table(_info, header=["Key", "Data Type", "Shape"])
    print(f"{'*'*len(l1)}\n")

    return


if __name__ == '__main__':
    print_table([[3, 4, 'asdasas'], [1, 22, 44]], header=["A", "B", "C"])
