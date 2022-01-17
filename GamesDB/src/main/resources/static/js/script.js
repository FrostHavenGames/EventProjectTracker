console.log("inside script.js");

window.addEventListener("load", function (e) {
  console.log("document loaded");
  init();
});

function init() {
  let allGamesButton = document.getElementById("gamesButton");
  allGamesButton.addEventListener("click", function (e) {
    e.preventDefault();
    getAllGames();
  });

  let newGameButton = document.getElementById("addGameButton");
  newGameButton.addEventListener("click", function (e) {
    e.preventDefault();
    displayNewGameForm();
  });
}

function getGame(gameId) {
  let xhr = new XMLHttpRequest();
  xhr.open("GET", "api/v1/games/" + gameId);
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4) {
      // convert responseText to JSON
      if (xhr.status === 200) {
        //DO STUFF HERE WITH SERVER DATA
        let game = JSON.parse(xhr.responseText);
        displayGamePage(game);
      } else if (xhr.status === 404) {
        console.error("Error!");
        displayError("Game" + gameId + " not found");
      } else {
        displayError("Error retrieving game: " + xhr.status);
      }
    }
  };
  xhr.send();
}

function getAllGames() {
  let xhr = new XMLHttpRequest();
  xhr.open("GET", "api/v1/games");
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4) {
      if (xhr.status === 200) {
        let games = JSON.parse(xhr.responseText);
        displayGamesTable(games);
      } else if (xhr.status === 404) {
        console.error("Failed to GET all games");
      } else {
        displayError("Error retrieving games: " + xhr.status);
      }
    }
  };
  xhr.send();
}

function createGame(newGame) {
  let xhr = new XMLHttpRequest();
  xhr.open("POST", "api/v1/games");
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4) {
      if (xhr.status === 200 || xhr.status === 201) {
        let game = JSON.parse(xhr.responseText);
        console.log(game);
        getGame(game.id);
      } else {
        console.error("Game create failed with status: " + xhr.status);
      }
    }
  };
  xhr.setRequestHeader("content-type", "application/json");
  xhr.send(JSON.stringify(newGame));
}

function updateGame(game) {
  let gameId = game.id;
  let xhr = new XMLHttpRequest();
  xhr.open("PUT", "api/v1/games/" + gameId);
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4) {
      if (xhr.status === 200 || xhr.status === 201) {
        let updatedGame = JSON.parse(xhr.responseText);
        console.log(updatedGame);
        getGame(gameId);
      } else {
        console.error("Game update failed with status: " + xhr.status);
      }
    }
  };
  xhr.setRequestHeader("content-type", "application/json");
  xhr.send(JSON.stringify(game));
}

function deleteGame(game) {
  let gameId = game.id;
  let xhr = new XMLHttpRequest();
  xhr.open("DELETE", "api/v1/games/" + gameId);
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4) {
      if (xhr.status === 200 || xhr.status === 201) {
        getAllGames();
      } else {
        console.error("Game delete failed with status: " + xhr.status);
      }
    }
  };
  xhr.send();
}

function displayNewGameForm() {
  let addNewGameTitle = document.getElementById("gameInformationTitle");
  addNewGameTitle.textContent = "Add New Game";

  let gameFormData = document.getElementById("gameData");
  gameFormData.textContent = "";

  let gameForm = document.createElement("form");
  gameForm.id = "addGameForm";
  gameForm.name = gameForm.id;
  gameFormData.appendChild(gameForm);

  let titleLabel = document.createElement("label");
  titleLabel.for = "titleField";
  titleLabel.textContent = "Title: ";
  gameForm.appendChild(titleLabel);

  let titleInput = document.createElement("input");
  titleInput.class = "addGameFormInputFields";
  titleInput.type = "text";
  titleInput.name = "titleField";
  gameForm.appendChild(titleInput);

  let nameBr = document.createElement("br");
  gameForm.appendChild(nameBr);

  let descriptionLabel = document.createElement("label");
  descriptionLabel.for = "descriptionField";
  descriptionLabel.textContent = "Description: ";
  gameForm.appendChild(descriptionLabel);

  let descriptionInput = document.createElement("input");
  descriptionInput.class = "addGameFormInputFields";
  descriptionInput.type = "text";
  descriptionInput.name = "descriptionField";
  gameForm.appendChild(descriptionInput);

  let descriptionBr = document.createElement("br");
  gameForm.appendChild(descriptionBr);

  let addGameButton = document.createElement("input");
  addGameButton.type = "submit";
  addGameButton.name = "createGame";
  addGameButton.value = "Submit";
  gameForm.appendChild(addGameButton);

  addGameButton.addEventListener("click", function (e) {
    e.preventDefault();
    let f = gameForm;
    let newGame = {};
    newGame.title = f.titleField.value;
    newGame.description = f.descriptionField.value;
    createGame(newGame);
  });
}

function displayUpdateGameForm(game) {
  let addGameTitle = document.getElementById("gameInformationTitle");
  addGameTitle.textContent = "Update Game";

  let gameFormData = document.getElementById("gameData");
  gameFormData.textContent = "";

  let updateGameForm = document.createElement("form");
  updateGameForm.id = "updateGameForm";
  updateGameForm.name = updateGameForm.id;
  gameFormData.appendChild(updateGameForm);

  let titleLabel = document.createElement("label");
  titleLabel.for = "titleField";
  titleLabel.textContent = "Title: ";
  updateGameForm.appendChild(titleLabel);

  let titleInput = document.createElement("input");
  titleInput.class = "updateGameFormInputFields";
  titleInput.type = "text";
  titleInput.name = "titleField";
  titleInput.value = game.title;
  updateGameForm.appendChild(titleInput);

  let nameBr = document.createElement("br");
  updateGameForm.appendChild(nameBr);

  let descriptionLabel = document.createElement("label");
  descriptionLabel.for = "descriptionField";
  descriptionLabel.textContent = "Description: ";
  updateGameForm.appendChild(descriptionLabel);

  let descriptionInput = document.createElement("input");
  descriptionInput.class = "updateGameFormInputFields";
  descriptionInput.type = "text";
  descriptionInput.name = "descriptionField";
  descriptionInput.value = game.description;
  updateGameForm.appendChild(descriptionInput);

  let tierBr = document.createElement("br");
  updateGameForm.appendChild(tierBr);

  let updateGameButton = document.createElement("input");
  updateGameButton.type = "submit";
  updateGameButton.name = "updateGame";
  updateGameButton.value = "Update";
  updateGameForm.appendChild(updateGameButton);

  updateGameButton.addEventListener("click", function (e) {
    e.preventDefault();
    let f = updateGameForm;

    game.title = f.titleField.value;
    game.description = f.descriptionField.value;
    updateGame(game);
  });
}

function displayGamesTable(games) {
  let addNewGameTitle = document.getElementById("gameInformationTitle");
  addNewGameTitle.textContent = "Game List";

  let gameData = document.getElementById("gameData");
  gameData.textContent = "";

  let gameTable = document.createElement("table");
  gameTable.id = "gameTable";
  gameTable.name = gameTable.id;
  gameData.appendChild(gameTable);

  let tHead = document.createElement("thead");
  gameTable.appendChild(tHead);

  let tRow = document.createElement("tr");
  tHead.appendChild(tRow);

  let title = document.createElement("th");
  title.textContent = "Title";
  tRow.appendChild(title);

  let description = document.createElement("th");
  description.textContent = "Description";
  tRow.appendChild(description);

  let tBody = document.createElement("tbody");
  gameTable.appendChild(tBody);

  for (const game of games) {
    let row = document.createElement("tr");

    let title = document.createElement("td");
    title.textContent = game.title;
    row.appendChild(title);

    let description = document.createElement("td");
    description.textContent = game.description;
    row.appendChild(description);

    tBody.appendChild(row);
  }
}

function displayGamePage(game) {
  let gameData = document.getElementById("gameData");
  gameData.textContent = "";

  let gameDetails = document.createElement("ul");
  gameData.appendChild(gameDetails);

  let gameName = document.createElement("h4");
  gameName.textContent = game.title;
  gameData.appendChild(gameName);

  let description = document.createElement("li");
  description.textContent = "Description: " + game.description;
  gameData.appendChild(description);

  let br = document.createElement("br");
  gameData.appendChild(br);

  let updateButton = document.createElement("button");
  updateButton.textContent = "UPDATE";
  gameData.appendChild(updateButton);

  updateButton.addEventListener("click", function (e) {
    e.preventDefault();
    displayUpdateGameForm(game);
  });

  let brUpdate = document.createElement("br");
  gameData.appendChild(brUpdate);

  let deleteButton = document.createElement("button");
  deleteButton.textContent = "DELETE";
  gameData.appendChild(deleteButton);

  deleteButton.addEventListener("click", function (e) {
    e.preventDefault();
    deleteGame(game);
  });
}
