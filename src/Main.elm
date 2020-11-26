module Main exposing (..)

import Html exposing (Html,text)
import Json.Decode exposing (Decoder, field, Value,decodeValue, succeed, int, Error, errorToString)
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
    case decodeValue int model.currentTime of
        Result.Ok currentTime -> text (String.fromInt currentTime)
        Err e -> text (errorToString e)
    
 

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions _ = 
    Sub.none
