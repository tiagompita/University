from PIL import Image, ImageDraw, ImageFont

# Abra a imagem
im = Image.open('/mnt/c/Universidade/University/1 ano/2 Semestre/LI/Guião 7 - Informação Visual/Imagens-suporte/ribeira_porto.jpg')

# Crie um objeto ImageDraw
draw = ImageDraw.Draw(im)

# Especifique a fonte e o tamanho do texto
font = ImageFont.truetype('/mnt/c/Universidade/University/1 ano/2 Semestre/LI/Guião 7 - Informação Visual/Tiny5-Regular.ttf', 40)

# Adicione o texto à imagem
draw.text((20, 20), 'LabI', (255, 255, 255), font=font)

# Salve a imagem
im.save('caminho-para-a-imagem-com-texto.jpg')