from matplotlib.pyplot import rcParams
from matplotlib import rcParamsDefault


def invoke(tx=True, fs=25.0):
    rcParams["text.usetex"] = tx
    rcParams['font.size'] = fs
    rcParams["font.family"] = "Times New Roman"
    rcParams['xtick.bottom'] = True
    rcParams['xtick.top'] = True
    rcParams['ytick.left'] = True
    rcParams['ytick.right'] = True
    rcParams['xtick.labelbottom'] = True
    rcParams['xtick.labeltop'] = False
    rcParams['ytick.labelleft'] = True
    rcParams['ytick.labelright'] = False
    rcParams['xtick.direction'] = 'in'
    rcParams['ytick.direction'] = 'in'
    rcParams['xtick.major.size'] = 8
    rcParams['ytick.major.size'] = 8
    rcParams['xtick.minor.size'] = 4
    rcParams['ytick.minor.size'] = 4
    rcParams['xtick.major.width'] = 2
    rcParams['ytick.major.width'] = 2


def revoke():
    rcParams.update(rcParamsDefault)
