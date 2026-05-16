# Home Care App 🏥

Une application Flutter complète pour la gestion des services de soins à domicile.

## 📋 Table des matières

- [À propos](#à-propos)
- [Fonctionnalités](#fonctionnalités)
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Utilisation](#utilisation)
- [Structure du projet](#structure-du-projet)
- [Contributions](#contributions)
- [Licence](#licence)

## À propos

Home Care App est une application mobile conçue pour faciliter la gestion et la coordination des services de soins à domicile. Elle permet aux utilisateurs de suivre les visites, les rendez-vous et les informations des patients de manière efficace.

## ✨ Fonctionnalités

- 📅 Gestion des rendez-vous et des visites
- 👥 Gestion des profils patients
- 📱 Interface utilisateur intuitive et conviviale
- 🔔 Notifications et rappels
- 📊 Suivi des activités
- 🔐 Authentification sécurisée

## 🔧 Prérequis

Avant de commencer, assurez-vous d'avoir installé :

- [Flutter](https://flutter.dev/docs/get-started/install) (version 3.0 ou supérieure)
- [Dart](https://dart.dev/get-dart)
- Un émulateur Android/iOS ou un appareil physique

## 📦 Installation

1. **Clonez le repository :**
   ```bash
   git clone https://github.com/hachtek98-stack/Home-Care-App.git
   cd Home-Care-App
   ```

2. **Installez les dépendances :**
   ```bash
   flutter pub get
   ```

3. **Lancez l'application :**
   ```bash
   flutter run
   ```

## 🚀 Utilisation

### Démarrage rapide

1. Lancez l'application
2. Créez un compte ou connectez-vous
3. Accédez au tableau de bord principal
4. Gérez vos patients et rendez-vous

## 📁 Structure du projet

```
Home-Care-App/
├── lib/
│   ├── main.dart              # Point d'entrée de l'application
│   ├── screens/               # Écrans de l'application
│   ├── widgets/               # Widgets réutilisables
│   ├── models/                # Modèles de données
│   └── services/              # Services (API, base de données)
├── test/                      # Tests unitaires et d'intégration
├── pubspec.yaml              # Dépendances du projet
└── README.md                 # Ce fichier
```

## 🛠️ Développement

### Dépendances principales

- Flutter SDK
- Provider (gestion d'état)
- http (requêtes réseau)
- firebase (base de données et authentification)

Pour voir toutes les dépendances, consultez `pubspec.yaml`.

### Exécuter les tests

```bash
flutter test
```

### Générer un build

#### Android
```bash
flutter build apk
```

#### iOS
```bash
flutter build ios
```

## 🤝 Contributions

Les contributions sont les bienvenues ! Pour contribuer :

1. Forkez le repository
2. Créez une branche pour votre fonctionnalité (`git checkout -b feature/AmazingFeature`)
3. Committez vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Poussez vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrez une Pull Request

## 📄 Licence

Ce projet est sous licence MIT. Consultez le fichier `LICENSE` pour plus de détails.

## 📞 Support

Pour toute question ou problème, veuillez :
- Ouvrir une [issue](https://github.com/hachtek98-stack/Home-Care-App/issues)
- Contacter l'équipe de développement

---

**Auteur :** hachtek98-stack  
**Dernière mise à jour :** Mai 2026
