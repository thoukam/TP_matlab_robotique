% Demande des paramètres à l'utilisateur
a1 = input('Entrez la valeur de a1: ');
a2 = input('Entrez la valeur de a2: ');
d1 = input('Entrez la valeur de d1: ');
d4 = input('Entrez la valeur de d4: ');
Ox = input('Entrez la coordonnée Ox: ');
Oy = input('Entrez la coordonnée Oy: ');

% Calcul des coordonnées x et y
x = sqrt(Ox^2 + Oy^2) - a1;
y = Oy - d1;

% Calcul de q1
q1 = atan2(Oy, Ox);

% Calcul de q3
q3 = asin((x^2 + y^2 - a2^2 - d4^2) / (2 * a2 * d4));

% Calcul de q2
numerator = x * (a2 + d4 * sin(q3)) + d4 * cos(q3) * y;
denominator = (a2 + d4 * sin(q3))^2 + d4^2 * cos(q3)^2;
cos_q2 = numerator / denominator;
q2 = acos(cos_q2);

% Affichage des résultats
fprintf('Les angles calculés sont:\n');
fprintf('q1 = %.2f radians (%.2f degrés)\n', q1, rad2deg(q1));
fprintf('q2 = %.2f radians (%.2f degrés)\n', q2, rad2deg(q2));
fprintf('q3 = %.2f radians (%.2f degrés)\n', q3, rad2deg(q3));
