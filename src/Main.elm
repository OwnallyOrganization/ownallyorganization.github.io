module Main exposing (main)

import Browser
import Browser.Events
import Element exposing (Color, Element, Length)
import Element.Background as Background
import Element.Font as Font
import Html exposing (Html)
import Image



-- MAIN


main : Program Window Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type alias Model =
    { window : Window }


type alias Window =
    { width : Int
    , height : Int
    }



-- INIT


init : Window -> ( Model, Cmd Msg )
init window =
    ( { window = window }, Cmd.none )



-- MSG


type Msg
    = ChangeWindow Int Int



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeWindow width height ->
            ( { model | window = Window width height }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Browser.Events.onResize ChangeWindow



-- VIEW


view : Model -> Html Msg
view model =
    Element.layout [] <| viewElement model.window


viewElement : Window -> Element Msg
viewElement window =
    let
        viewColumn : Length -> Element Msg
        viewColumn length =
            Element.column
                [ Element.width length ]
                [ viewHeader window
                , viewBanner window
                , viewFeatures window
                , viewPeople window
                , viewOffice window
                ]
    in
    if window.width < 320 then
        viewColumn <| Element.px 320

    else
        viewColumn Element.fill


viewHeader : Window -> Element Msg
viewHeader window =
    Element.none


viewBanner : Window -> Element Msg
viewBanner window =
    Element.none


viewFeatures : Window -> Element Msg
viewFeatures window =
    Element.none


viewPeople : Window -> Element Msg
viewPeople window =
    Element.none


viewOffice : Window -> Element Msg
viewOffice window =
    Element.none
