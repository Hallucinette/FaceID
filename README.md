# FaceID
Crée une application simple avec FaceID

### Etape 1:
- Rechercher à propos de l'implementation de FaeId
### Etape 2:
- Creation du projet
### Etape 3:
- Changer la clef: Privacy - Face ID Usage Description” and give it the value “We need to unlock your data.”
- Implémentation des différentes composants de l'interface.

- Un titre
- Une image
- Un bouton

### Etape 4:
- Ajout de la lib
> import LocalAuthentication

- Ajout de la func
> func authenticate() {
    let context = LAContext() // --> instance de LAContext (Local Authentication Contexte) pour gérer le contexte de l'authentification locale
    var error: NSError? // --> une variable d'erreur pour capturer toute erreur lors de la vérification de l'authentification

    // Vérifirication: si l'appareil peut effectuer une authentification biométrique (Touch ID ou Face ID)
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        let reason = "We need to unlock your data." // -> Définit le message qui sera affiché à l'utilisateur lors de la demande d'authentification

        // Démarrage du processus d'authentification biométrique qui prend en paramètre (le type d'authentification et le message de raison)

        // La méthode evaluatePolicy est asynchrone et utilise une closure pour gérer le résultat de l'authentification (success, authenticationError).
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
            // authentication has now completed
            if success {
                // on renvoie une action
            } else {
                // On devrait renvoyer une erreur en cas d'échec.
            }
        }
    } else {
        // On devrait renvoyer une erreur si l'appareil ne prend pas en charge l'authentification biométrique.
    }


### Documentation:
https://www.hackingwithswift.com/books/ios-swiftui/using-touch-id-and-face-id-with-swiftui
