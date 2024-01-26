import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? frText = '',
  }) =>
      [enText, esText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Auth1
  {
    'aa9x8li5': {
      'en': '[Name/Logo]',
      'es': '[Nombre/Logotipo]',
      'fr': '[Nom/Logo]',
    },
    'ptgdud97': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
    },
    'aea8i1hg': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    'folmk9vz': {
      'en': 'Let\'s get started by filling out the form below.',
      'es': 'Comencemos completando el formulario a continuación.',
      'fr': 'Commençons par remplir le formulaire ci-dessous.',
    },
    'nnq8cv79': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'h57igsv8': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'xv7rwdbg': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
    },
    'k9dn9hpx': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
      'fr': 'Mot de passe oublié',
    },
    'gxt8fdw5': {
      'en': 'Or sign up with',
      'es': 'O regístrate con',
      'fr': 'Ou inscrivez-vous avec',
    },
    '9ybv0el6': {
      'en': 'Continue with Google',
      'es': 'Continuar con Google',
      'fr': 'Continuer avec Google',
    },
    'il9qxs72': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'tnjety0i': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'fwgn1fdr': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
    },
    '9hpxvf65': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    'rzickb4f': {
      'en': 'Or sign up with',
      'es': 'O regístrate con',
      'fr': 'Ou inscrivez-vous avec',
    },
    'sao90i2k': {
      'en': 'Continue with Google',
      'es': 'Continuar con Google',
      'fr': 'Continuer avec Google',
    },
    '57w7450i': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // profileEdit
  {
    'zkxx5nlq': {
      'en': 'Your Name',
      'es': 'Su nombre',
      'fr': 'votre nom',
    },
    'y27u92rh': {
      'en': 'Display Name',
      'es': 'Nombre para mostrar',
      'fr': 'Afficher un nom',
    },
    '8y7b0wqz': {
      'en': 'Save Changes',
      'es': 'Guardar cambios',
      'fr': 'Sauvegarder les modifications',
    },
    'puoqtb1f': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
  },
  // profileView
  {
    '09y6mxfs': {
      'en': 'Your Account',
      'es': 'Su cuenta',
      'fr': 'Votre compte',
    },
    'xpa8k14a': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    '73uam1cl': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
    },
    'jrqxqs8g': {
      'en': 'App Settings',
      'es': 'Ajustes de Aplicacion',
      'fr': 'Paramètres de l\'application',
    },
    'rikuvc5b': {
      'en': 'Support',
      'es': 'Apoyo',
      'fr': 'Soutien',
    },
    'owq2cgzj': {
      'en': 'Terms of Service',
      'es': 'Términos de servicio',
      'fr': 'Conditions d\'utilisation',
    },
    'dt9n4wmt': {
      'en': 'Light Mode',
      'es': 'Modo de luz',
      'fr': 'Mode lumière',
    },
    '6pysrz82': {
      'en': 'Dark Mode',
      'es': 'Modo oscuro',
      'fr': 'Mode sombre',
    },
    'nig2nxw7': {
      'en': 'Log Out',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    '26hts0th': {
      'en': 'Profile',
      'es': 'Perfil',
      'fr': 'Profil',
    },
    'ju8id7lp': {
      'en': 'Profile',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // homePage
  {
    'l9j81yat': {
      'en': '[Logo/Name]',
      'es': '[Logotipo/Nombre]',
      'fr': '[Logo/Nom]',
    },
    '0qeg43sx': {
      'en': 'Hey',
      'es': 'Ey',
      'fr': 'Hé',
    },
    'u4m3115x': {
      'en': ',',
      'es': ',',
      'fr': ',',
    },
    'muajapnp': {
      'en': 'Lets Jump In.',
      'es': 'vamos\nSaltar\nEn.',
      'fr': 'Permet\nSaut\nDans.',
    },
    'g80flidl': {
      'en': 'Choose Your Path.',
      'es': 'Elige tu camino.',
      'fr': 'Choisissez votre chemin.',
    },
    '3cku64h0': {
      'en': 'Explore the Digital World',
      'es': 'Explora el mundo digital',
      'fr': 'Explorez le monde numérique',
    },
    '3nlrqlxc': {
      'en': 'Training Zone',
      'es': 'Zona de entrenamiento',
      'fr': 'Zone d\'entraînement',
    },
    'eusrqrvm': {
      'en': 'Pick up some quick, impactful skills.',
      'es': 'Adquiera algunas habilidades rápidas e impactantes.',
      'fr': 'Acquérez des compétences rapides et percutantes.',
    },
    '249w33am': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // changePass
  {
    'vpzdtucc': {
      'en': 'Back',
      'es': 'Atrás',
      'fr': 'Dos',
    },
    'hda23d0h': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
      'fr': 'Mot de passe oublié',
    },
    'ndwgikmo': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'es':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña; ingrese el correo electrónico asociado con su cuenta a continuación.',
      'fr':
          'Nous vous enverrons un e-mail avec un lien pour réinitialiser votre mot de passe, veuillez saisir l\'e-mail associé à votre compte ci-dessous.',
    },
    'rca44dkj': {
      'en': 'Your email address...',
      'es': 'Su dirección de correo electrónico...',
      'fr': 'Votre adresse e-mail...',
    },
    'f5iihyk7': {
      'en': 'Enter your email...',
      'es': 'Introduce tu correo electrónico...',
      'fr': 'Entrer votre Email...',
    },
    '42xrwh8e': {
      'en': 'Send Link',
      'es': 'Enviar enlace',
      'fr': 'Envoyer un lien',
    },
    'iea568x1': {
      'en': 'Back',
      'es': 'Atrás',
      'fr': 'Dos',
    },
    'jrjkrmhr': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // longTasksLessons
  {
    '309a1wru': {
      'en': 'Class Details',
      'es': '',
      'fr': '',
    },
    'w50hpbeq': {
      'en': 'Content',
      'es': '',
      'fr': '',
    },
    'yn0lfsfw': {
      'en': 'mins',
      'es': '',
      'fr': '',
    },
    'h8yw8jc7': {
      'en': 'Favorite Class',
      'es': '',
      'fr': '',
    },
    '7tcbeg1d': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // shortTaskLessons
  {
    'adh0zdpy': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // startPage
  {
    'ispvhmxm': {
      'en': '[Logo Goes Here]',
      'es': '[El logotipo va aquí]',
      'fr': '[Le logo va ici]',
    },
    'so4b25eu': {
      'en': 'Welcome!',
      'es': '¡Bienvenido!',
      'fr': 'Accueillir!',
    },
    'z7ocwy97': {
      'en':
          'Thanks for joining! Create your account below to get started on your digital journey!',
      'es':
          '¡Gracias por unirte! ¡Cree su cuenta a continuación para comenzar su viaje digital!',
      'fr':
          'Merci d\'avoir rejoint ! Créez votre compte ci-dessous pour commencer votre voyage numérique !',
    },
    'ewgmnfzs': {
      'en': 'Get Started',
      'es': 'Empezar',
      'fr': 'Commencer',
    },
    'slsjg45z': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // MyCourses
  {
    'gap785ic': {
      'en': 'Courses',
      'es': '',
      'fr': '',
    },
    '1tmjbj60': {
      'en': 'Courses',
      'es': '',
      'fr': '',
    },
  },
  // CourseCategory
  {
    '3pox7q1a': {
      'en': 'Courses',
      'es': '',
      'fr': '',
    },
    'md9hhkw7': {
      'en': 'Courses',
      'es': '',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'p11saevc': {
      'en':
          'In order to take a picture or video, this app requires permission to access the camera.',
      'es':
          'Para tomar una foto o grabar un video, esta aplicación requiere permiso para acceder a la cámara.',
      'fr':
          'Afin de prendre une photo ou une vidéo, cette application nécessite une autorisation pour accéder à la caméra.',
    },
    'glb17sde': {
      'en':
          'In order to upload data, this app requires permission to access the photo library.',
      'es':
          'Para cargar datos, esta aplicación requiere permiso para acceder a la biblioteca de fotos.',
      'fr':
          'Afin de télécharger des données, cette application nécessite l\'autorisation d\'accéder à la photothèque.',
    },
    '28rcui4c': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'xcxp0uok': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'd8i5c11m': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '7z47qewn': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'z0sjwdca': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'r7cg6gue': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'st489g7k': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '4plb7jhf': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '2f8n40gn': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'akzs59py': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '0rabz99e': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'jyzedmdq': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '1c0tad28': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'o1rzhm3a': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'hx7swlmy': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'n0a9pqz0': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'nrjdcq8b': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'c4rrfvfg': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '93wlvg8p': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '5d8z7sgv': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'mhsok2z7': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '5ignvgu1': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'azmnk88c': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '5u4svthw': {
      'en': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
