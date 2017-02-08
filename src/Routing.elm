module Routing exposing (..)

import Navigation exposing (Location)
import Players.Models exposing (PlayerId)
import UrlParser as Url exposing (..)

type Route
  = PlayersRoute
  | PlayerRoute PlayerId
  | NotFoundRoute

matchers: Parser (Route -> a) a
matchers = Url.oneOf
  [ Url.map PlayersRoute top
  , Url.map PlayerRoute (s "players" </> string)
  , Url.map PlayersRoute (s "players")
  ]

parseLocation: Location -> Route
parseLocation location = case (parseHash matchers location) of
  Just route ->
    route
  Nothing ->
    NotFoundRoute
