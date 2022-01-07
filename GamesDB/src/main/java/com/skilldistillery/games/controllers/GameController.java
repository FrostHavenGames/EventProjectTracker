package com.skilldistillery.games.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.games.entities.Game;
import com.skilldistillery.games.services.GameService;

@RestController
@RequestMapping("api")
public class GameController {

	@Autowired
	private GameService gameService;
	
	@GetMapping("games")
	public List<Game> index() {
		return gameService.getAllGames();
	}
}
