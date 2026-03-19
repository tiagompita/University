# Alguns comandos para representacao e operacao de complexos
# complex(R, I) - criar um numero complexo a partir das partes reais e imaginarias
# real(C) e imag(C) - devolvem o valor da componente real e imaginarias de um complexo
# abs(C) - devolve a magnitude (modulo)
# angle(C) - devolve a fase em radianos
# conj(C) - devolve o complexo conjugado
# exp(C) - permite representacao e calculos na forma e^j*theta
# deg2rad(deg) - converte de graus para radianos
# rad2deg(rad) - converte de radianos para graus

#Visualizacao numeros complexos com octave
C1 = 1 + j;
C2 = complex(1, -1); # o mesmo que C2 = 1 - 1*j
                          # alternativamente, podia ter tambem feito C2=conj(C1)
plot(C1, 'ro', C2, 'bo');

xlabel('Real Axis');
ylabel('Imaginary Axis');
title('Complex Plane Representation (Argand-Gauss)');
grid on;
axis([-2 2 -2 2], "equal");
hold on;

# desenhar vetores origem para pontos complexos
quiver(0, 0, real(C1), imag(C1), 0, 'r--', 'LineWidth', 1, 'MaxHeadSize', 0.1);
quiver(0, 0, real(C2), imag(C2), 0, 'b--', 'LineWidth', 1, 'MaxHeadSize', 0.1);


# calcular os modulos (comprimento dos vetores) e angulos em graus
mod_C1 = abs(C1);
mod_C2 = abs(C2);
angulo_C1_graus = rad2deg(angle(C1));
angulo_C2_graus = rad2deg(angle(C2));

# criar o texto formatado para os modulos e angulos
texto_mod_C1 = sprintf('|C_1| = %.2f', mod_C1);
texto_mod_C2 = sprintf('|C_2| = %.2f', mod_C2);
texto_angulo_C1 = sprintf('\\theta_1 = %.1f^{\\circ}', angulo_C1_graus);
texto_angulo_C2 = sprintf('\\theta_2 = %.1f^{\\circ}', angulo_C2_graus);

# desenhar valores dos modulos e angulos de cada vetor
raio_arco = 0.4;
text(real(C1)/2 - 0.5, imag(C1)/2 + 0.2, texto_mod_C1, 'Color', 'r', 'FontSize', 11, 'FontWeight', 'bold');
text(real(C2)/2 - 0.5, imag(C2)/2 - 0.2, texto_mod_C2, 'Color', 'b', 'FontSize', 11, 'FontWeight', 'bold');
theta1 = linspace(0, angle(C1), 50); % Cria 50 pontos entre 0 e o ângulo de C1 (radianos)
plot(raio_arco*cos(theta1), raio_arco*sin(theta1), 'r', 'LineWidth', 1.5);
text(0.5, 0.2, texto_angulo_C1, 'Color', 'r', 'FontSize', 12, 'FontWeight', 'bold');
theta2 = linspace(angle(C2), 0, 50);
plot(raio_arco*cos(theta2), raio_arco*sin(theta2), 'b', 'LineWidth', 1.5);
text(0.5, -0.2, texto_angulo_C2, 'Color', 'b', 'FontSize', 12, 'FontWeight', 'bold');

# podemos desenhar os mesmos pontos usando a forma polar (distancia origem e angulo com eixo real positivo)
# notar que:
# - a parte real corresponde ao cateto adjacente do angulo (vamos chamar a este 'a')
# - a parte imaginaria corresponde ao cateto oposto do angulo (vamos chamar a este 'b')
# - a distancia ao ponto desde a origem corresponde hipotenusa (vamos chamar a esta 'r')
# como cos(theta) = a / r e sin(theta) = b / r
# podemos definir o ponto no plano complexo como C = a + b*j = r*cos(theta) + r*sin(theta)*j = r (cos(theta) + j*sin(theta))
# simplificando com a formula de Euler, C = r*e^(j*theta). De notar que a formula de Euler apenas define a direcao (fasor unitario) enquanto r
# define o comprimento do vetor
C1_polar = abs(C1)*(cos(angle(C1))+j*sin(angle(C1)));
C2_polar = abs(C2)*exp(j*angle(C2)); # agora com a formula de Euler
plot(C1, 'r*', C2, 'b*');

# observando o plano complexo, podemos observar que 1*j = 1 * e^(j*pi/2)
# o que acontece se multiplicarmos um qualquer ponto na forma polar por e^(j*pi/2) .....
# C = r*e^(j*theta) * e^(j*pi/2) = r*e^(j*theta+pi/2) -> rotacao de 90graus no sentido anti-horario, modulo igual!
# daqui tambem facilmente observamos a "periodicidade" de j... se cada multiplicacao de j corresponde a uma rotacao de 90 graus,
# 4 * j corresponde a uma rotacao de 360 graus (voltamos ao mesmo ponto)!!
# Nota: iremos ver mais tarde que a forma polar é bastente útil para "transformar" sinais e verificar as suas propriedades
# facilmente (amplitude e fase)
C3_polar = C1_polar * exp(j*pi/2);
mod_C3 = abs(C3_polar);
angulo_C3_graus = rad2deg(angle(C3_polar));
plot(C3_polar, 'black*');
quiver(0, 0, real(C3_polar), imag(C3_polar), 0, 'black--', 'LineWidth', 1, 'MaxHeadSize', 0.1);
texto_angulo_C3 = sprintf('\\theta_3 = %.1f^{\\circ}', angulo_C3_graus);
texto_mod_C3 = sprintf('|C_3| = %.2f', mod_C3);
text(real(C3_polar)/2 - 0.5, imag(C3_polar)/2 + 0.2, texto_mod_C3, 'Color', 'black', 'FontSize', 11, 'FontWeight', 'bold');
theta3 = linspace(0, angle(C3_polar), 50);
plot(raio_arco*cos(theta3), raio_arco*sin(theta3), 'black', 'LineWidth', 1.5);
text(-0.5, 0.2, texto_angulo_C3, 'Color', 'black', 'FontSize', 12, 'FontWeight', 'bold');



# 1

# 1 a)
(1-j)^2+(2+j)^2

# 1 c)
(1+2j)/(3-4j)+(2-j)/5j
# ou para mostrar em fracao (atencao que rats faz sempre uma aproximacao!!)
rats((1+2j)/(3-4j)+(2-j)/5j)

# 1 i)
# CUIDADO! 3j^30 leva o octave a considerar (3j)^30 e nao 3(j^30) !!
(3*j^30-j^19)/(2j-1)

# 1 k)
(exp(j*pi/3)+exp(j*pi/6))/(2+j)

# 2 c) translacao (triangulo desliza no plano)

# 2 e) rotacao e escalamento

# 2 g) simetria em relacao ao eixo real

# 2 h) inversao da magnitude e angulo

# 5 lugar geometrico, conjunto de todos os pontos no plano complexo que satisfazem uma regra ou condicao matematica

# 5 a
vetor_x = linspace(-10, 10, 300);
vetor_y = linspace(-10, 10, 300);
[x, y] = meshgrid(vetor_x, vetor_y); # temos de usar meshgrid para gerarmos todas as combinacoes possiveis
                                     # entre X e Y. Por exemplo, com apenas vetor_x = [1, 2, 3] e vetor_y = [4, 5, 6], z = vetor_x + j*vetor_y iriam apenas resultar em [1+4j, 2+5j, 3+6j], qquando existe 9 combinacoes possiveis
z = x + j*y; # pontos complexos para cada combinacao possivei de x e y

condicao = abs(z - 3j) > 4;

x_validos = x(condicao);
y_validos = y(condicao);
plot(x_validos, y_validos, 'r.');
axis equal;
axis([-10 10 -10 10]);



# 5 b
vetor_x = linspace(-10, 10, 300);
vetor_y = linspace(-10, 10, 300);
[x, y] = meshgrid(vetor_x, vetor_y);
z = x + j*y;
condicao = abs(z) - real(z) -1 < 0.0000001; # temos que testar para um numero muito pequeno e nao zero por causa
                                            # da precisao que nao permite calcular valores exactamente iguais a 0

x_validos = x(condicao);
y_validos = y(condicao);
plot(x_validos, y_validos, 'r.');
axis equal;
axis([-10 10 -10 10]);

# 2 1 b
% definir o segundo elemento da equacao
w = 1 + j*sqrt(3);

% encontrar as raízes usando polinómios (z^4 - w = 0)
p = [1, 0, 0, 0, -w];
raizes = roots(p);

% visualizar no plano
plot(raizes, 'ro', 'MarkerFaceColor', 'r');
grid on; axis equal;
title('Raízes de z^4 = 1 + j\sqrt{3}');
axis equal;
axis([-2 2 -2 2]);


