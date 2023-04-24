import h5py
import numpy as np
import os

CFD = os.path.dirname(__file__)

h5file = r"E:\workshop\projects\ms2_fcsps\analysis\RVE_case\two_lobe_case\term-1\rve_raw_data-ish_nLobeShape.h5"
# h5file = os.path.join(CFD, "utils", "sample_h5_file.h5")
ab = []
with h5py.File(h5file, "r") as h5fid:
	for (i, (dsID, ds)) in enumerate(h5fid.items()):
		# 
		# =======================================
		# extract the data set ATTRIBUTES
		# =======================================
		ab.append(ds.attrs["lobe_distance_factor"])
		ds_attributes = [[k, v] for (k, v) in ds.attrs.items()]
		# print(ds_attributes)
		# 
		# =======================================
		# extract the DATASET
		# =======================================
		data_set = {k: np.transpose(v) for (k, v) in ds.items()}
		for v in data_set.values():
			# print(v.shape)
			pass
		# print(f"{i} >> {dsID} >> {type(ds)}")

for i in np.unique(np.array(ab)):
	print(i)

def change_attribute(ds, k, v):
	if key in ds.attrs.keys():
		del ds.attrs[key]
		ds.attrs[key] = new_value
		print(f"added {ds.attrs[key]}")
	else:
		print(f"{key} is not found in {ds_ID}")
