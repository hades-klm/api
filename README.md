# LET OP: Deze readme is incompleet
> Dit is een eerste versie van een readme, zie het voornamelijk als een globale suggestie de goede richting in. Het is ongetest en niet heel uitgebreid

## Install
#### Voor helemaal kaal:
- Symfony installer gedownload en geinstalleerd (maakt niet uit waar)
- WAMP geinstalleerd
- Navigeer naar we WAMP www map (voor windows: C:\wamp64\www)
- Run `symfony new --full hades && cd hades`

#### Vanaf de GIT repo:
- Symfony installer gedownload en geinstalleerd (maakt niet uit waar)
- WAMP geinstalleerd
- Navigeer naar we WAMP www map (voor windows: C:\wamp64\www)
- Run `mkdir hades && cd hades`
- git init
- git configureren 



#### Verder voor beide
- Installeer indien nodig Composer (Zie https://getcomposer.org/download/)
- Installeer indien nodig Node (https://nodejs.org/en/download/)
- Installeer indien nogig yarn (https://classic.yarnpkg.com/en/docs/install#windows-stable)
- Run `composer install`
- Run `Yarn build`
- Run `symfony server:start`
- Open de verkregen url in je browser (likely http://127.0.0.1:8000/ )
- Maak een database aan (voor Windows programma -> heidiSQL, voor Mac -> SequalPro)
- Kopier .env naar .env.local







