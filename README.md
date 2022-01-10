# EventProjectTracker

## Overview
This project is a Game database. It will keep track of video games/board games/card games etc. It will be the IMDB of games. It will have full CRUD operations. It will allow the viewing of all the games currently stored in the database, and it will allow viewing a single game it's information. Users will be allowed to update the games and create new games. It will be similar to the way wikipedia works when people are editing the information. It will allow users to vote on which they think is the correct information and that's what will be updated on the site. There is a delete function that will actually remove the game from the database but that will require admin approval before it will take any sort of effect on the database.

## REST API Reference

|Return Type | HTTP Method | URI | Request Body | Purpose |
|------------|-------------|-----|--------------|---------|
| List<Game> | GET         | /api/v1/games |       | List |
| Game       | GET         | /api/v1/games/{id}  | | Retrieve |
| Game       | POST        | /api/v1/games | Game JSON | Create |
| Game       | PUT        | /api/v1/games/{id} | Game JSON | Update |
| Game       | DELETE        | /api/v1/games/{id} | | Delete |

## Technologies Used
Java
MySql
Spring Boot
Postman
