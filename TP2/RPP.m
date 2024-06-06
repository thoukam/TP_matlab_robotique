function robotRPP()
    % Demande à l'utilisateur de saisir les valeurs des paramètres
    l1=  input('Entrez la longueur du premier bras (l1): ');
    q1 = input('Entrez l''angle de la rotation (q1) en degrés: ');
    d2 = input('Entrez la translation du premier prisme (d2): ');
    d3 = input('Entrez la translation du deuxième prisme (d3): ');

    % Conversion de l'angle en radians
    q1 = deg2rad(q1);

    % Paramètres DH
    DH_params = [
        q1, l1, 0, 0;  % [theta, d, a, alpha] pour la rotation
        0, d2, 0, -pi/2;   % [theta, d, a, alpha] pour la première translation
        0, d3, 0, 0;      % [theta, d, a, alpha] pour la deuxième translation
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
    gamma=rad2deg(q1);

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
fprintf('Vérification pour q1=30 degrés, d2=2m, d3=2m, l1=2m\n');
robotRPP();
