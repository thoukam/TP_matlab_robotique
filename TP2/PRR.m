function robotPRR()
    % Demande à l'utilisateur de saisir les valeurs des paramètres
    d1 = input('Entrez la translation du prisme (d1): ');
    l1 = input('Entrez la longueur du premier bras (l1): ');
    l2 = input('Entrez la longueur du deuxième bras (l2): ');
    l3= input('Entrez la longueur du troisieme bras (l3): ');
    q2 = input('Entrez l''angle de la première rotation (q2) en degrés: ');
    q3 = input('Entrez l''angle de la deuxième rotation (q3) en degrés: ');

    % Conversion des angles en radians
    q2 = deg2rad(q2);
    q3 = deg2rad(q3);

    % Paramètres DH
    DH_params = [
        0, d1, l1, 0;     % [theta, d, a, alpha] pour la translation
        q2, 0, l2, 0;    % [theta, d, a, alpha] pour la première rotation
        q3, 0, l3, 0     % [theta, d, a, alpha] pour la deuxième rotation
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
    alpha=0;
    beta=0;
    gamma=rad2deg(q3)+rad2deg(q2);

    fprintf('alpha: %.2f\n',alpha)
    fprintf('beta: %.2f\n',beta)
    fprintf('gamma: %.2f\n',gamma)
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

% Fonction DH_transform identique à celle utilisée pour le robot RR
% Vérification pour des valeurs spécifiques
fprintf('Vérification pour d1=2m, q2=30 degrés, l1=l2=l3=2m, q3=30 degrés\n');
robotPRR();
