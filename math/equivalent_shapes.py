import numpy as np


def get_equivalent_star_base_radius(
        num_tips: int = 4,
        beta_factor: float = 0.1,

):
    alpha = np.pi / num_tips
    beta = alpha + (beta_factor * (np.pi / 2 - alpha))
    k1 = np.sin(alpha) / (1.0 - np.sin(alpha))
    return
