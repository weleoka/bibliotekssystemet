# LTU - Bibliotekssystemet Grupp 8 [![MIT Licence](https://badges.frapsoft.com/os/mit/mit.png?v=103)](https://opensource.org/licenses/mit-license.php)
Educational project based on MVC architecture. Hibernate ORM to model to a RDBMS with Spring (Java EE) for client webb application and backend services.

Current build engine is Gradle and with mavenCentral repositories for dependency sourcing.

## Developer environment
The project requires MySQL or MariaDB. The connection details are in the `src/main/java/resources/application.properties` file. Included with the repository is DDL and useradd SQL for initialising the database. These are found in `sql_pastebin.md`. It also assumes Java 11, although if that is a must is not known or tested

So in brief:
- clone the repository
- Run the relevant SQL in `sql_pastebin.md` to initiate database user
- Run the gradle target `build` of ./gradlew (or if on windows gradle.bat) e.g. `./gradlew build` or `gradle.bat build`

The project will compile and the tests will run. Gradle can display resulting output/feedback in a browser.  

For deployment use the Spring Gradle plugin default taskt bootJar, bootWar, and bootRun.


### Deployment for development
Spring plugin for gradle configures a default task called `bootRun`. Executing this task: `./gradlew bootRun` will compile the application and launch a web-server (Apache Tomcat). Test the repository standard route over port 8080 as follows: `localost:8080/hello`. This is called the embedded deployment method as Tomcat is compiled into an executable jar.

Spring plugin also creates a war run task `./gradlew bootWar`. You can then deploy this to tomcat, and changes to static files will be immediately be available on a browser refresh. This method is known as servlet deployment. It is useful for running many apps on one machine. This method is becoming less popular with the advance of cloud computing, where each app is running on its own machine. For running multiple apps with embedded containers on one machine it is required to work with a proxy service such as nginx.

This project can be compiled into either to jar or war and has the servlet configuration on classpath.

Happy knacking code y'all!


### Deployment for production
This section is not completed but notes in progress.

Set the database privileges necessary to make changes to only the data of the database and not the structure (schema).

## Repository workflow
Git workflow to be discussed in order to decide upon:

- main branches vs. working branches
- branch naming conventions
- merging method (rebase->merge or squash-> merge --no-ff)
- tag releases
- production build releases


## Application requirements

Funktionalitetskrav - låntagare:
- Registrera en användare
- Logga in användare
- Söka efter objekt (bok / DVD-titel, författare / regissörsnamn, ISBN, ämnesord / film-genren)
- Göra ett lån (en till flera objekt) och få kvitto på lånet 
- Varje dag 

Funktionalitetskrav - bibliotikarie:
- Lägga till, ändra, och ta bort objekt
- Söka efter objekt (bok / DVD-titel, författare / regissörsnamn, ISBN, ämnesord / film-genren)
- Lägga till, ändra, och ta bort låntagare
- Visa lista på objekt som ej återlämnats i tid

Krav för kvitton:
- objektets titel
- objektets identifierare
- datum objektet lånades
- senast återlämning

Krav för objekt:
- attribut fysisk placering, författare / regissör, ISBN (endast för böcker), en klassificering i
  form av ämnesord (för böcker), eller genrer för filmer
- för filmer finns dessutom åldersbegränsning, produktionsland, skådespelare
- unika streckkoder som används för att identifiera varje enskilt fysiskt objekt

Krav för systemet:
- Hantera undantag (exceptions) på ett sätt som ger meningsfull återkoppling till
användaren
- automatiskt skicka påminnelsemail till alla låntagare som har överskriden lånetid för objekt
- begränsa antalet aktiva lån enligt låntagarens kategori (Student, Forskare, Övriga universitetsanställda, Allmänheten)
- olika object har olika låenetid. Kurslitteratur 14 dagar, Övriga böcker 1 månad, Film 1 vecka, Referenslitteratur får ej lånas ut, Tidskrift får ej ånas ut

Generella krav:
- Lagra data i en relationsdatabas
- Använda sig av arv och polymorfism i någon lämplig del av lösningen
- Tillhandahålla grafiska användargränssnitt


### Deluppgift A - Design
Rita UML-diagram som beskriver er lösning. En datamodell med tillhörande attribut och samband ska också finnas med i design-dokumentationen. Ni kan även bifoga bilder (screenshots) på design av planerade användargränssnitt om ni vill ha feedback, dock inget krav.

### Deluppgift B – Fungerande prototyp
Lämna in en rapport utformad enligt rapportmall för mindre rapport. Rapporten ska innehålla beskrivning av utvecklingsprocessen: vilka ändringar ni gjort från design till implementation, motivera eventuella avgränsningar eller utökningar från kravspecifikationen etc. Rapporten ska innehålla beskrivning av den utvecklade applikationen med ”screenshots” på centrala delar av användargränssnitt med tillhörande kod inklusive kortfattad beskrivning till varje del.

### Style guide
This project attempts to adhere to the following [style guide](https://github.com/weleoka/myJavaStyleGuide).


# Meta
Developers:

developer 1 - email: *removed* | developer 2 - email: *removed* | developer 3 - email: *removed*


# Dependencies
Please see `build.gradle` for full dependencies list.


Distributed under the MIT license. See [LICENSE.md](https://github.com/weleoka/bibliotekssystemet/LICENCE) for more information.




# PART A
The design of the system including identifying the business domain and architectural choices such as comportamentalisation and division of responsibilities between main system components.  
This inital stage of the project defers optimisation methods such as database denormalisation to later iterations of the product. 


## System components
The system is divided into these initial five components which, although are quite closely tied, can mostly be developed in isolation. They all rely on one domain model which should be implemented first, and a sample dataset is loaded for testing and development purposes.

* authentication; guest, patron and librarian access levels
* loan; handles objects and time-frames in connection with patrons 
* notification; includes input of late objects list and reserved and/or loaned objects lists. Output is dependent on profile and notification types
* search/query/find; expandable system which can cache, suggest, and provide additional information on objects
* back-end access; the librarians back-end raw UI primarily concerned with crud and various summary data display

todo Name the search/query/find system
todo Name the back-end employee access system


## Modelling system design
To support the design decisions the following diagrams are required

- Sequence diagram of log-in, searching and selecting for loan of multiple objects
- Sequence diagram of how the system discovers overdue laons and adds them to a notification list and sends notifications automatically. (must involve timer, cron-job)
- Domain model with entities and relationships


# PART B