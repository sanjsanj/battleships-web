Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

Scenario: Homepage
  Given I am on the homepage
  When I follow "New Game"
  Then I expect to see "What's your name?"

Scenario: New Game
  Given I am on New Game page
  When I fill in "Name" with "Tupac"
  And click on "Submit"
  Then I expect to see "Sup Tupac!"
