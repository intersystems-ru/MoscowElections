# MoscowElections
Repository with data for displaying interactive Moscow regions' polygons on DSW map

# Instalation
For import classes and data use next steps:
1. import and compile class sc.code (wich location in repo is - `\src\cls\sc\code.cls`)
2. run in terminal
```
d ##class(sc.code).workdir("YourPathToRepository\src")
w ##class(sc.code).import(,"rkd") && ##class(sc.code).import("*.cls","c")
```
3. Copy moscowElectionsMap.js from `\src\csp` into your web application's location
