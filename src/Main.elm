module Main exposing (..)

import Html exposing (Html,text, div, h1, img)
import Json.Decode exposing (Decoder, field, Value,decodeValue, succeed, int, Error, errorToString)
import Html.Attributes exposing (src)
import Browser



main : Program Value Model Msg
main =
    Browser.element
    {
        init = init,
        view = view,
        update = update,
        subscriptions = subscriptions
    }

-- MODEL
type alias Model = {currentTime : Value}

init : Value ->(Model, Cmd Msg)
init currentTime = 
    ({currentTime =  currentTime}, Cmd.none)  


-- UPDATE
type Msg = NoOp

update : Msg -> Model -> (Model, Cmd Msg)
update _ model = 
    (model, Cmd.none)

-- VIEW


view : Model -> Html Msg
view model = 
    div []
        [ img [ src "/logo.svg" ] []
        , h1 [] [    case decodeValue int model.currentTime of
        Result.Ok currentTime -> text (String.fromInt currentTime)
        Err e -> text (errorToString e)
        ]
        , h1 [] [ text "Your Elm App is working!" ]
        ]


    
 

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions _ = 
    Sub.none
