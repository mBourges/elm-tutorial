module Models exposing (..)

import Players.Models exposing (Player)
import Routing

type alias Model =
  { route: Routing.Route
  , players: List Player
  }

initialModel: Routing.Route -> Model
initialModel route =
  { route = route
  , players = []
  }
