# LET OP: Deze readme is incompleet
> Dit is een snelle versie van een readme, zie het voornamelijk als een globale suggestie de goede richting in. Het is ongetest en niet heel uitgebreid

###Prerequisites
- Installeer indien nodig PHP,MySQL,Apache (Zou kunnen via WAMP/MAMP/etc)
- Installeer indien nodig Composer (https://getcomposer.org/download/)
- Installeer indien nodig Node (https://nodejs.org/en/download/)
- Installeer indien nodig yarn (https://classic.yarnpkg.com/en/docs/install)

### Install
- Symfony installer gedownload en geinstalleerd (maakt niet uit waar)
- Navigeer naar je home map (voor windows: C:\wamp64\www)
- Run `mkdir hades && cd hades`
- Run `git init` en configureren naar deze repo
- Run `composer install` om de PHP dependencies te installeren
- Run `yarn && yarn build`  om de JS dependencies te installeren
- Run `symfony server:start` en open de verkregen url (likely http://127.0.0.1:8000/ )
- Maak een database aan (voor Windows programma -> HeidiSQL, voor Mac -> SequalPro)
- Kopieer .env naar .env.local (_*NOOIT* gevoelige data in de .env!_)
- Vul alle waardes in de .env.local in


###Code vereisten
- Je werk altijd via een nieuwe branch:
  - Zorg dat je branch up to date is met master (`git checkout master && git pull`)
  - Maak een branch met omschrijvende naam met de juiste prefix:
    - Is het een bug? -> `bugfix/descriptive-name-here`
    - Is het geen bug? -> `feature/descriptive-name-here`
  - Commit je regelmatig tussendoor in kleine stapjes, bv 
    - "Entity X aangemaakt"
    - "Formulier gemaakt voor X"
    - "Beveiliging voor x verbeterd"
   - Lever je PR daarna in met een *goede* omschrijving, geschreven voor iemand die niet weet wat je aan het doen was.
   - Zorg dat je PR niet de groot is, dat is reden voor afkeur! Kleine PRs zijn makkelijk in te schieten, te reviewen en minder gevaarlijk om te mergen.
- Werk netjes.
  - We moeten met elkaar werken in een project, dat gaat alleen als we ons aan de spelregels houden. Hoe langer het project draait, hoe belangrijker het is dat we volgens die regels werken
  - Zorg dat je code altijd een Code Format toegepast krijgt, we maken gebruik van PSR12
  - Werk S.O.L.I.D. zover je kunt. Kleine samenvatting: Kleine functies, kleine classes, Single responsibility.
  - Als je onderbuik gevoel zegt dat t misschien niet zo netjes is, luister daar dan naar. Dat klopt vaker dan je verwacht.
  - Lever je werk in voor een Pull Request. Probeer twee mensen te laten reviewen.
    - Review scherp! Wees gedetailleerd! *Nu* is het moment, na mergen kijkt niemand er meer naar.
    - Als je iets leuk vind mag je dat ook melden (je bent namelijk snel geniegd commentaar te leveren als t slecht is)
    - Als je iets niet een taak vind, maar wel een "nouja, als je t toch open hebt, dan graag dit"-achtige taken, dan kun je opmerking prefixen met 'Nit: '
- Werk veilig.
  - Nooit gevoelige info in een .env
  - Ga er altijd van uit dat mensen onze DB kunnen jatten
  - Ga er altijd van uit dan mensen onze site weten te misbruiken
  - Symfony zelf past Prepared statements toe, SQL injectie is niet een probleem (DOctrine gebruiken is verplicht)