package com.skilldistillery.games.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.games.entities.Game;

public interface GameRepository extends JpaRepository<Game, Integer> {

}
