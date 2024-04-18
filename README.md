   
   
   
     1  |  2  |  3
  -----------------
A |  A1 |  A2 |  A3
  -----------------
B |  B1 |  B2 |  B3
  -----------------
C |  C1 |  C2 |  C3


Tic-Tac-Toe

Un jeu simple de Tic-Tac-Toe (morpion) implémenté en Ruby, où deux joueurs humains peuvent s'affronter.

#Comment jouer

Assurez-vous d'avoir Ruby installé sur votre système.

Téléchargez ou clonez ce dépôt sur votre machine.

Ouvrez un terminal et naviguez jusqu'au répertoire où se trouve le fichier tictactoe.rb

Exécutez le jeu en saisissant la commande suivante dans votre terminal :

bash

Copy code

ruby tictactoe.rb

Suivez les instructions à l'écran pour entrer les noms des joueurs et jouer au jeu.

#Fonctionnalités

Le jeu se joue à deux joueurs humains.

Chaque joueur peut choisir une case sur le plateau en saisissant les coordonnées correspondantes (par exemple, A1, B2, C3).

Le jeu détecte automatiquement s'il y a un vainqueur ou si la partie est nulle.

Le jeu affiche le plateau de jeu à chaque tour.

Une fois la partie terminée, le jeu annonce le vainqueur ou s'il y a match nul, puis propose de jouer à nouveau.

Structure du code

#Le jeu est divisé en plusieurs classes :

BoardCase: représente une case individuelle sur le plateau.

Board: représente le plateau de jeu et gère les interactions avec celui-ci.

Player: représente un joueur avec un nom et un symbole (X ou O).

Game: gère le déroulement du jeu, y compris le changement de tours et la détermination du vainqueur.

Show: gère l'affichage du plateau de jeu.

Application: initialise et lance le jeu.

Tests

Ce projet inclut également des tests unitaires utilisant RSpec pour vérifier le bon fonctionnement des classes et des fonctionnalités du jeu. Les tests peuvent être exécutés en installant RSpec 
(gem install rspec) et en exécutant rspec dans le répertoire du projet.

