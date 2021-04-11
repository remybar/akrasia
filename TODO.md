PROJECT
=======

1) avoir une app qui fonctionne pour:
    - créer des objectifs
    - entrer des données
    - voir les résultats
    - configurer des apps pour la mise à jour automatique
    - [partager ses réalisations ?]  (=> visibilité ?)

2) avoir un back-end qui:
    - supporte le lien avec ces qques apps pour mettre à jour la db firebase
    - [fourni une API pour zapier ?]

3) avoir un site de présentation avec:
    - une page présentation
    - une section articles
    - une section "how-to"
    - une section discussion

BUTS:

BETA
    1) avoir des utilisateurs actifs (tout gratuit / beta)
    2) avoir des interactions sur la partie forum/discussion
    3) me faire connaitre, diffuser les infos

DEV
===

NEXT STEPS:
- ajout des données (check, count, timer, manual)
- finaliser le widget goal (overview page)
- améliorer la gestion des erreurs / la validation des entities/value objects
- support des reminders
- affichage de la liste des steps avec filtrage par date

Debug
- logguer des infos
- crash analytics (firebase)

Tests
- tester la couche infra et domain

Intl
- DatePicker

Theme
- Déplacer tous les éléments de theme dans le theme light/dark

Gestion des timers
    TimerService: gère X timers qui tournent et les rafraichi toutes les secondes
    Pouvoir visualiser les timers qui tournent lorsque l'app est en background
    Mise à jour d'un objectif lorsqu'on stoppe le timer


OPTI:
- Infra
    - ne pas stocker la partie time d'une start/end date vu que c'est d'office 00:00:00 ou 23:59:59 ?


# IMPORTANTS

- pouvoir modifier ses objectifs

    => la modif est globale (stocké dans `Goal`)
        name
        endDate (possible que dans le futur par rapport au goal courant)
        pledge (pas en dessous du seuil déjà atteint)

    => non modifiable (stocké dans `Goal`)
        toReach
        startDate (sauf si pas commencé)

    => s'applique qu'aux steps suivants (stocké dans `Goal` mais copié dans `GoalStep`)
        type.value (le vrai type, l'unité ne sont pas modifiable)
        period
CI / CD
========

- mettre en place pre-commit
