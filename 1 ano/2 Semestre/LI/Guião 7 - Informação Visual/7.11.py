from PIL import Image
import math
import sys

def effect_gray(im):
    width, height = im.size
    new_im = Image.new("L", im.size)

    for x in range(width):
        for y in range(height):
            p = im.getpixel((x, y))
            l = int(p[0]*0.299 + p[1]*0.587 + p[2]*0.144)
            new_im.putpixel((x, y), (l))

    return new_im

def effect_intensity(im, f):
    new_im = im.convert("YCbCr")
    width, height = im.size

    for x in range(width):
        for y in range(height):
            pixel = new_im.getpixel((x, y))
            py = min(255, int(pixel[0] * f))  # [0] is the Y channel
            new_im.putpixel((x, y), (py, pixel[1], pixel[2]))

    return new_im

def effect_gamma(im, gamma):
    new_im = im.convert("YCbCr")
    width, height = im.size
    m = 255
    f = m / (m ** gamma)

    for x in range(width):
        for y in range(height):
            pixel = new_im.getpixel((x, y))
            py = min(255, int((pixel[0] ** gamma) * f))  # Apply the gamma correction formula
            new_im.putpixel((x, y), (py, pixel[1], pixel[2]))

    return new_im

def effect_saturation(im, f):
    new_im = im.convert("YCbCr")
    width, height = im.size

    for x in range(width):
        for y in range(height):
            pixel = new_im.getpixel((x, y))
            py = pixel[0]
            pb = min(255, int((pixel[1] - 128) * f) + 128)
            pr = min(255, int((pixel[2] - 128) * f) + 128)
            new_im.putpixel((x, y), (py, pb, pr))

    return new_im

def effect_sepia(im):
    new_im = im.convert("RGB")
    width, height = im.size

    for x in range(width):
        for y in range(height):
            pixel = new_im.getpixel((x, y))
            r = int(0.189 * pixel[0] + 0.769 * pixel[1] + 0.393 * pixel[2])
            g = int(0.168 * pixel[0] + 0.686 * pixel[1] + 0.349 * pixel[2])
            b = int(0.131 * pixel[0] + 0.534 * pixel[1] + 0.272 * pixel[2])
            new_im.putpixel((x, y), (r, g, b))

    return new_im

def effect_lomo(im):
    new_im = im.convert("RGB")
    width, height = im.size

    for x in range(width):
        for y in range(height):
            pixel = new_im.getpixel((x, y))
            b = int(0.189 * pixel[0] + 0.769 * pixel[1] + 0.393 * pixel[2])
            g = int(0.168 * pixel[0] + 0.686 * pixel[1] + 0.349 * pixel[2])
            r = int(0.131 * pixel[0] + 0.534 * pixel[1] + 0.272 * pixel[2])
            new_im.putpixel((x, y), (r, g, b))

    return new_im

def is_edge(im, x, y, diff, bw):
    p = im.getpixel((x, y))
    width, height = im.size

    if x < width-1 and y < height-1 and x > 0 and y > 0:
        for vx in range(-1, 1):
            for vy in [-1, 1]:
                px = im.getpixel((x + vx, y + vy))
                if abs(p[0] - px[0]) > diff:
                    return (0, 128, 128)

                for vx in [-1, 1]:
                    px = im.getpixel((x + vx, y))
                    if abs(p[0] - px[0]) > diff:
                        return (0, 128, 128)

    if bw:
        return (255, 128, 128)
    else:
        return p

def get_factor(x, y, xref, yref):
    distance = math.sqrt(pow(x-xref, 2) + pow(y-yref, 2))
    distance_to_edge = math.sqrt(pow(xref, 2) + pow(yref, 2))
    return 1-(distance/distance_to_edge)  # Percentagem

def apply_vignette(im, xref, yref):
    width, height = im.size
    im = im.convert("RGB")

    for x in range(width):
        for y in range(height):
            p = im.getpixel((x, y))
            factor = get_factor(x, y, xref, yref)
            new_p = tuple(int(factor * val) for val in p)
            im.putpixel((x, y), new_p)

    return im

def apply_watermark(im1, im2, f):
    im1 = im1.convert("RGBA")
    im2 = im2.convert("RGBA")
    width1, height1 = im1.size
    width2, height2 = im2.size

    start_x = (width1 - width2) // 2
    start_y = (height1 - height2) // 2

    for x in range(width2):
        for y in range(height2):
            p1 = im1.getpixel((x + start_x, y + start_y))
            p2 = im2.getpixel((x, y))
            if p2[3] == 0:
                continue
            r = int(p1[0] * (1 - f) + p2[0] * f)
            g = int(p1[1] * (1 - f) + p2[1] * f)
            b = int(p1[2] * (1 - f) + p2[2] * f)
            im1.putpixel((x + start_x, y + start_y), (r, g, b, p1[3]))

    return im1

# Função para adicionar a marca de água utilizando esteganografia
def add_watermark_steganography(im1, im2):
    im1 = im1.convert("RGB")
    im2 = im2.convert("RGB")
    width, height = im1.size

    for x in range(width):
        for y in range(height):
            if x < im2.width and y < im2.height:
                p1 = im1.getpixel((x, y))
                p2 = im2.getpixel((x, y))
                r = (p1[0] & 0b11111110) | (p2[0] >> 7)
                g = (p1[1] & 0b11111110) | (p2[1] >> 7)
                b = (p1[2] & 0b11111110) | (p2[2] >> 7)
                im1.putpixel((x, y), (r, g, b))

    return im1

# Função para recuperar a marca de água utilizando esteganografia
def recover_watermark_steganography(im):
    im = im.convert("RGB")
    width, height = im.size
    watermark = Image.new("RGB", im.size)

    for x in range(width):
        for y in range(height):
            p = im.getpixel((x, y))
            r = (p[0] << 7) & 255
            g = (p[1] << 7) & 255
            b = (p[2] << 7) & 255
            watermark.putpixel((x, y), (r, g, b))

    return watermark

def main(image_path, watermark_path, f):
    im = Image.open(image_path)
    im1 = Image.open(watermark_path)

    new_im = effect_gray(im)
    new_im.save(image_path.replace(".png", "-gray.jpg"))

    new_im = effect_intensity(im, 3)
    new_im.save(image_path.replace(".png", "-intensity.jpg"))

    new_im = effect_gamma(im, 0.3)
    new_im.save(image_path.replace(".png", "-gamma.jpg"))

    new_im = effect_saturation(im, 10)
    new_im.save(image_path.replace(".png", "-saturation.jpg"))

    new_im = effect_sepia(im)
    new_im.save(image_path.replace(".png", "-sepia.jpg"))

    new_im = effect_lomo(im)
    new_im.save(image_path.replace(".png", "-lomo.jpg"))

    edge_im = im.copy().convert("YCbCr")
    width, height = im.size
    for x in range(width):
        for y in range(height):
            edge_im.putpixel((x, y), is_edge(im, x, y, 50, True))  # Adjust the diff and bw parameters as needed
    edge_im.save(image_path + "-edge.jpg")

    new_im = apply_vignette(im.copy(), im.width // 2, im.height // 2)
    new_im.save(image_path + "-vignette.jpg")

    new_im = apply_watermark(im.copy(), im1, f)
    new_im.save(watermark_path + "-watermarked.png")

    

main(sys.argv[1], sys.argv[2], float(sys.argv[3]))