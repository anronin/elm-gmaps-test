port module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Html.App as Html


-- MAIN

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL

type alias Model =
    { lat : Float
    , lng : Float
    }

init : (Model, Cmd Msg)
init =
  (Model 0.0 0.0, Cmd.none)


-- UPDATE

type Msg
  = Change Model

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Change model ->
      ( { model | lat = model.lat, lng = model.lng }, Cmd.none )

-- SUBSCRIPTIONS

port position : (Model -> msg) -> Sub msg

subscriptions : Model -> Sub Msg
subscriptions model =
  position Change

-- VIEW


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ text "Location: ", text (toString model) ]
