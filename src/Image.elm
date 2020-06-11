module Image exposing
    ( Image
    , buildings
    , house
    , pieChart
    , rentalContract
    , technology
    , toBackground
    , toElement
    , tradeGrowth
    )

import Element exposing (Attribute, Element)
import Element.Background as Background


type Image
    = Image { src : String, description : String }


toElement : List (Attribute msg) -> Image -> Element msg
toElement attributes (Image { src, description }) =
    Element.image attributes
        { src = src
        , description = description
        }


toBackground : Image -> Attribute msg
toBackground (Image { src }) =
    Background.image src


house : Image
house =
    createImage "House.jpg" "Landing Photo"


pieChart : Image
pieChart =
    createImage "PieChart.svg" "Equity Photo"


rentalContract : Image
rentalContract =
    createImage "RentalContract.svg" "Rental Photo"


tradeGrowth : Image
tradeGrowth =
    createImage "TradeGrowth.svg" "Trade Photo"


buildings : Image
buildings =
    createImage "Buildings.jpg" "Building Photo"


technology : Image
technology =
    createImage "Technology.jpg" "Technology Photo"


createImage : String -> String -> Image
createImage filename description =
    Image <| { src = "/image/" ++ filename, description = description }
