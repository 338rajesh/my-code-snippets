import matplotlib.pyplot as plt
import matplotlib.transforms as mtf
import numpy as np
import os

from svgpathtools import svg2paths
from svgpath2mpl import parse_path

CFD = os.path.dirname(__file__)

path, attributes = svg2paths(os.path.join(CFD, "shapes", "csh.svg"))
ell_maker = parse_path(attributes[0]['d'])
ell_maker.vertices -= ell_maker.vertices.mean(axis=0)
ell_maker = ell_maker.transformed(mtf.Affine2D().rotate_deg(130))
ell_maker = ell_maker.transformed(mtf.Affine2D().scale(-1, 1))

x = np.linspace(0, 2.0*np.pi, 24)
plt.plot(x, np.sin(x), marker=ell_maker, markersize=20, markerfacecolor='blue')
plt.show()