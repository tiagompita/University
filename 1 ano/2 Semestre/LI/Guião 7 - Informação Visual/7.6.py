from PIL import Image
import sys

def main(fname):
    im = Image.open(fname)
    fname = fname.split(".")[0]

    for format in ['PNG', 'GIF', 'TIFF', 'BMP']:
        rgb_im = im.convert('RGB')
        rgb_im.save(fname + "." + format, format=format)


main(sys.argv[1])