module ElmLogo exposing (element, html, svg)

{-| This library provides SVG Elm logos to use with various libraries,
such as [Svg][svg], [Html][html] or [Style Elements][style-elements].

All functions accept integer as first argument to set width of logo.

[svg]: http://package.elm-lang.org/packages/elm-lang/svg/latest
[html]: http://package.elm-lang.org/packages/elm-lang/html/latest
[style-elements]: http://package.elm-lang.org/packages/mdgriffith/stylish-elephants/latest


# Functions

@docs svg, html, element

-}

import Element as E exposing (Element)
import Html exposing (Html)
import Svg exposing (Svg)
import Svg.Attributes as SvgA


{-| Elm logo which can be embedded into [SVG][svg]

[svg]: http://package.elm-lang.org/packages/elm-lang/svg/latest

-}
svg : Int -> Svg msg
svg width =
    Svg.node "svg" (attrs width) group


{-| Elm logo which can be embedded into [HTML][html]

[html]: http://package.elm-lang.org/packages/elm-lang/html/latest

-}
html : Int -> Html msg
html width =
    Svg.svg (attrs width) group


{-| Elm logo which can be embedded into [Style Element][style-elements]

[style-elements]: http://package.elm-lang.org/packages/mdgriffith/stylish-elephants/latest

-}
element : Int -> Element msg
element =
    html >> E.html



-- PRIVATE


{-| Logo size
-}
size : Float
size =
    100


{-| Half distance between shapes
-}
distance : Float
distance =
    sqrt 2


{-| Shift in X and Y axises
-}
shift : Float
shift =
    (2 * distance) / sqrt 2


{-| Converts list of points into string
-}
points : List ( Float, Float ) -> String
points list =
    list
        |> List.map (\( fst, snd ) -> toString fst ++ "," ++ toString snd)
        |> String.join " "


{-| Common attributes
-}
attrs : Int -> List (Svg.Attribute msg)
attrs width =
    [ SvgA.width <| toString width
    , SvgA.viewBox <| "0 0 " ++ toString size ++ " " ++ toString size
    ]


{-| Group of polygons
-}
group : List (Svg msg)
group =
    [ Svg.polygon
        [ SvgA.fill "#5A6378"
        , SvgA.points <|
            points
                [ ( 0, shift )
                , ( size / 2 - shift, size / 2 )
                , ( 0, size - shift )
                ]
        ]
        []
    , Svg.polygon
        [ SvgA.fill "#7FD13B"
        , SvgA.points <|
            points
                [ ( shift, 0 )
                , ( size / 4 + shift - distance, size / 4 - distance )
                , ( size * 3 / 4 - shift - distance, size / 4 - distance )
                , ( size / 2 - shift, 0 )
                ]
        ]
        []
    , Svg.polygon
        [ SvgA.fill "#F0AD00"
        , SvgA.points <|
            points
                [ ( size / 4 + shift + distance, size / 4 + distance )
                , ( size * 3 / 4 - shift - distance, size / 4 + distance )
                , ( size / 2, size / 2 - shift )
                ]
        ]
        []
    , Svg.polygon
        [ SvgA.fill "#60B5CC"
        , SvgA.points <|
            points
                [ ( size / 2 + shift, 0 )
                , ( size, 0 )
                , ( size, size / 2 - shift )
                ]
        ]
        []
    , Svg.polygon
        [ SvgA.fill "#F0AD00"
        , SvgA.points <|
            points
                [ ( size, size / 2 + shift )
                , ( size * 3 / 4 + shift, size * 3 / 4 )
                , ( size, size - shift )
                ]
        ]
        []
    , Svg.polygon
        [ SvgA.fill "#60B5CC"
        , SvgA.points <|
            points
                [ ( shift, size )
                , ( size / 2, size / 2 + shift )
                , ( size - shift, size )
                ]
        ]
        []
    , Svg.polygon
        [ SvgA.fill "#7FD13B"
        , SvgA.points <|
            points
                [ ( size / 2 + shift, size / 2 )
                , ( size * 3 / 4, size / 4 + shift )
                , ( size - shift, size / 2 )
                , ( size * 3 / 4, size * 3 / 4 - shift )
                ]
        ]
        []
    ]
