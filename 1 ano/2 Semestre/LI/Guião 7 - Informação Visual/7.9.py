from PIL import Image
import sys

def main(fname):
    im = Image.open(fname)
    width, height = im.size

    new_im = Image.new(im.mode, im.size)

    for x in range(width):
        for y in range(height):
            p = im.getpixel((x,y))
            r = p[2]
            g = p[1]
            b = p[0]
            new_im.putpixel((x,y), (r,g,b))

    new_im.save(fname+"-rgb.jpg")

main(sys.argv[1])