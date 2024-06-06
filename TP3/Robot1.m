function main
    % Demander à l'utilisateur le type de robot
    robot_type = input('Entrez le type de robot (PRR, RRP, RRPR) : ', 's');

    % Déterminer le nombre d'articulations à partir du type de robot
    n = length(robot_type);

    % Initialiser la matrice des paramètres DH
    DH_params = zeros(n, 4);

    % Boucle pour demander à l'utilisateur de saisir les paramètres DH pour chaque articulation
    for i = 1:n
        fprintf('Entrez les paramètres DH pour l''articulation %d\n', i);
        theta = input('  Theta (en degrés) : ');
        d = input('  d : ');
        a = input('  a : ');
        alpha = input('  Alpha (en degrés) : ');

        % Convertir les angles de degrés en radians
        theta = deg2rad(theta);
        alpha = deg2rad(alpha);

        % Stocker les paramètres DH dans la matrice
        DH_params(i, :) = [theta, d, a, alpha];
    end

    % Calculer la matrice de transformation totale
    T = direct_kinematics(DH_params);

    % Afficher la matrice de transformation totale
    disp('La matrice de transformation totale est :');
    disp(T);

    % Extraire les positions et orientations de la matrice de transformation
    position = T(1:3, 4);  % Coordonnées x, y, z
    R = T(1:3, 1:3);       % Matrice de rotation

    % Afficher les positions et orientations
    fprintf('Position de l''effecteur :\n');
    fprintf('  x = %.2f\n', position(1));
    fprintf('  y = %.2f\n', position(2));
    fprintf('  z = %.2f\n', position(3));

    % Calculer gamma en fonction du type de robot
    switch robot_type
        case 'PRR'
            gamma = rad2deg(DH_params(2, 1) + DH_params(3, 1));
        case 'RRP'
            gamma = rad2deg(DH_params(1, 1) + DH_params(2, 1));
        case 'RRPR'
            gamma = rad2deg(DH_params(1, 1) + DH_params(2, 1) + DH_params(4, 1));
        otherwise
            error('Type de robot non pris en charge');
    end

    % Afficher les angles d'Euler (alpha, beta, gamma)
    fprintf('Orientation de l''effecteur (en degrés) :\n');
    fprintf('  alpha  = 0.00\n');
    fprintf('  beta   = 0.00\n');
    fprintf('  gamma  = %.2f\n', gamma);
end

function T = direct_kinematics(DH_params)
    % Fonction pour calculer le modèle géométrique direct à partir des paramètres DH
    %
    % Entrée :
    %   DH_params - Une matrice nx4 où chaque ligne correspond aux paramètres DH [theta, d, a, alpha]
    %
    % Sortie :
    %   T - La matrice de transformation homogène totale de la base à l'effecteur

    % Nombre d'articulations
    n = size(DH_params, 1);

    % Initialisation de la matrice de transformation totale comme matrice identité
    T = eye(4);

    % Boucle sur chaque articulation pour calculer la matrice de transformation
    for i = 1:n
        theta = DH_params(i, 1);
        d = DH_params(i, 2);
        a = DH_params(i, 3);
        alpha = DH_params(i, 4);

        % Matrice de transformation pour l'articulation i
        A_i = [
            cos(theta), -sin(theta) * cos(alpha), sin(theta) * sin(alpha), a * cos(theta);
            sin(theta), cos(theta) * cos(alpha), -cos(theta) * sin(alpha), a * sin(theta);
            0, sin(alpha), cos(alpha), d;
            0, 0, 0, 1;
        ];

        % Mise à jour de la matrice de transformation totale
        T = T * A_i;
    end
end

% Appeler la fonction principale
main()
