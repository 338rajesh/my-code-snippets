from os import path, listdir
import cv2
import imageio
import argparse
from tqdm import tqdm


class MovieMaker:
    """ Helper definitions for making videos """

    @staticmethod
    def _codec(format_: str):
        if format_ == "mp4":
            return cv2.VideoWriter_fourcc('m', 'p', '4', 'v')
        elif format_ == "avi":
            return 0
        else:
            raise ValueError(f"Unable to get the codec for '{format_}'")

    def __init__(self, img_dir, fps=None, sort_key=None, ):
        self.img_dir = img_dir
        self.fps = fps
        self.images = [img for img in listdir(img_dir) if img.endswith(".png")]
        assert len(self.images) > 0, ValueError(f"the directory {img_dir} has no images.")
        if sort_key is not None:
            # assert sort_key is not None, ""  # lambda x: int("".join(x.split(".")[0].split("-")))
            self.images = sorted(self.images, key=sort_key)

    def make_video(self, op_path: str, fmt="mp4", resize_factor=1.0):
        frame = cv2.imread(path.join(self.img_dir, self.images[0]))
        height, width, layers = frame.shape
        new_size = (int(resize_factor * width), int(resize_factor * height))
        video = cv2.VideoWriter(op_path, self._codec(fmt), self.fps, new_size)
        loop = tqdm(self.images, leave=False, desc="Writing..!")
        for image in loop:
            frame = cv2.imread(str(path.join(self.img_dir, image)))
            frame = cv2.resize(frame, new_size)
            video.write(frame)

        cv2.destroyAllWindows()
        video.release()

    def make_animation(self, op_path: str):
        file_paths = [path.join(self.img_dir, a_img_name) for a_img_name in self.images]
        with imageio.get_writer(op_path, mode='I', loop=0, duration=1200) as writer:
            for file_path in file_paths:
                writer.append_data(imageio.v3.imread(file_path))


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument("-i", "--images_dir", required=True, type=str, help="path to the images directory")
    ap.add_argument("--fps", type=int, default=5, help="frames per second")
    ap.add_argument("--sort_key", type=str, default=None, help="file name sort key")
    ap.add_argument("-o", "--output", required=True, type=str, help="path to the output video")
    ap.add_argument("--resize_factor", type=float, default=1.0, help="resize factor")
    ap.add_argument("--make_video", action="store_true", help="if set, will make video")
    ap.add_argument("--make_animation", action="store_true", help="if set, will make animation")
    args = ap.parse_args()
    #
    file_ext = args.output.split(".")[-1]
    supported_file_types = ["mp4", "avi"]
    assert file_ext in supported_file_types, (
        ValueError(f"Unsupported file format '{file_ext}', not in {supported_file_types}")
    )

    args.sort_key = eval(args.sort_key, globals()) if args.sort_key is not None else None
    mm = MovieMaker(args.images_dir, fps=args.fps, sort_key=args.sort_key)
    if args.make_video:
        mm.make_video(args.output, fmt=file_ext, resize_factor=args.resize_factor)
    if args.make_animation:
        mm.make_animation(args.output)
