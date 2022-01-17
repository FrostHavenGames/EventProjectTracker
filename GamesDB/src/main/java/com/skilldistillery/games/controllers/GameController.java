package com.skilldistillery.games.controllers;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.games.entities.Game;
import com.skilldistillery.games.services.GameService;

@RestController
@ResponseBody
@RequestMapping("api/v1")
public class GameController {

	@Autowired
	private GameService gameService;

	@GetMapping("games")
	public List<Game> index() {
		return gameService.getAllGames();
	}

	@GetMapping("games/{gameId}")
	public Game showGame(@PathVariable Integer gameId, HttpServletResponse response) {
		Optional<Game> game = gameService.findById(gameId);

		// Set 404 and return null if the game isn't found
		if (game.isPresent() == false) {
			response.setStatus(404);
			return null;
		}

		return game.get();
	}
	
	@GetMapping("games/search/{keyword}")
	public List<Game> searchGame(@PathVariable String keyword) {
		keyword = "%" + keyword + "%";
		return gameService.findByTitleLike(keyword);
	}
	
	@PostMapping("games")
	public Game createGame(@RequestBody Game game, HttpServletRequest request, HttpServletResponse response) {
		Game newGame = gameService.createGame(game);
		
		if (newGame == null) {
			System.err.println("Error creating Game.");
			response.setStatus(400);
		} else {
			StringBuffer url = request.getRequestURL();
			url.append("/").append(game.getId());
			response.setHeader("Location", url.toString());
		}
		
		return newGame;
	}
	
	@PutMapping("games/{gameId}")
	public Game updateGame(@RequestBody Game game, HttpServletRequest request, HttpServletResponse response) {
		Game newGame = gameService.createGame(game);
		
		if (newGame == null) {
			System.err.println("Error updating Game.");
			response.setStatus(400);
		} else {
			StringBuffer url = request.getRequestURL();
			url.append("/").append(game.getId());
			response.setHeader("Location", url.toString());
		}
		
		return newGame;
	}
	
	@DeleteMapping("games/{gameId}")
	public void deleteGame(@PathVariable(value="gameId") Integer gameId) {
		gameService.deleteGame(gameId);
	}
}
