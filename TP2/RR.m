close all
clear all
function robotRR_DH()
    % Demande à l'utilisateur de saisir les valeurs des paramètres
    l1 = input('Entrez la longueur du premier bras (l1): ');
    l2 = input('Entrez la longueur du deuxième bras (l2): ');
    q1 = input('Entrez l''angle de la première articulation (q1) en degrés: ');
    q2 = input('Entrez l''angle de la deuxième articulation (q2) en degrés: ');

    % Conversion des angles en radians
    q1 = deg2rad(q1);
    q2 = deg2rad(q2);

    % Paramètres DH
    DH_params = [
        q1, 0, l1, 0;  % [theta, d, a, alpha] pour le lien 1
        q2, 0, l2, 0   % [theta, d, a, alpha] pour le lien 2
    ];

    % Calcul de la matrice de transformation homogène totale
    T = eye(4);
    for i = 1:size(DH_params, 1)
        T_i = DH_transform(DH_params(i, :));
        T = T * T_i;
    end


    % Extraire la position et orientation finale
    x = T(1, 4);
    y = T(2, 4);
    z = T(3, 4);
    R = T(1:3, 1:3);

    % Affichage des résultats
    fprintf('Position de l''effecteur:\n');
    fprintf('x: %.2f\n', x);
    fprintf('y: %.2f\n', y);
    fprintf('z: %.2f\n', z);

    fprintf('\nOrientation de l''effecteur (matrice de rotation):\n');
    disp(R);
    fprintf('\nalpha:0\n')
    fprintf('beta:0\n')
    fprintf('gamma: %.2f\n',rad2deg(q1+q2))

end

function T = DH_transform(params)
    % Calcule la matrice de transformation homogène pour les paramètres DH
    theta = params(1);
    d = params(2);
    a = params(3);
    alpha = params(4);

    T = [cos(theta), -sin(theta)*cos(alpha),  sin(theta)*sin(alpha), a*cos(theta);
         sin(theta),  cos(theta)*cos(alpha), -cos(theta)*sin(alpha), a*sin(theta);
         0,           sin(alpha),             cos(alpha),            d;
         0,           0,                      0,                     1];
end

robotRR_DH()