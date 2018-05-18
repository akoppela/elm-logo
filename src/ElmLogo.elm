module ElmLogo exposing (svg, html, element)

{-| This library provides SVG Elm logos to use with various libraries,
such as [Svg][svg], [Html][html] or [Elm UI][elm-ui].

All functions accept integer as first argument to set width of logo.

[svg]: https://package.elm-lang.org/packages/elm/svg/latest/
[html]: https://package.elm-lang.org/packages/elm/html/latest/
[elm-ui]: https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/


# Functions

@docs svg, html, element

-}

import Element exposing (Element)
import Html exposing (Html)
import Svg exposing (Svg)
import Svg.Attributes as SvgAttrs


{-| Elm logo which can be embedded into [SVG][svg]

[svg]: https://package.elm-lang.org/packages/elm/svg/latest/

-}
svg : Int -> Svg msg
svg width =
    Svg.node "svg" (attrs width) group


{-| Elm logo which can be embedded into [HTML][html]

[html]: https://package.elm-lang.org/packages/elm/html/latest/

-}
html : Int -> Html msg
html width =
    Svg.svg (attrs width) group


{-| Elm logo which can be embedded into [Elm UI][elm-ui] view

[elm-ui]: https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/

-}
element : Int -> Element msg
element =
    html >> Element.html



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
        |> List.map (\( fst, snd ) -> String.fromFloat fst ++ "," ++ String.fromFloat snd)
        |> String.join " "


{-| Common attributes
-}
attrs : Int -> List (Svg.Attribute msg)
attrs width =
    [ SvgAttrs.width <| String.fromInt width
    , SvgAttrs.viewBox <| "0 0 " ++ String.fromFloat size ++ " " ++ String.fromFloat size
    ]


{-| Group of polygons
-}
group : List (Svg msg)
group =
    [ Svg.polygon
        [ SvgAttrs.fill "#5A6378"
        , SvgAttrs.points <|
            points
                [ ( 0, shift )
                , ( size / 2 - shift, size / 2 )
                , ( 0, size - shift )
                ]
        ]
        []
    , Svg.polygon
        [ SvgAttrs.fill "#7FD13B"
        , SvgAttrs.points <|
            points
                [ ( shift, 0 )
                , ( size / 4 + shift - distance, size / 4 - distance )
                , ( size * 3 / 4 - shift - distance, size / 4 - distance )
                , ( size / 2 - shift, 0 )
                ]
        ]
        []
    , Svg.polygon
        [ SvgAttrs.fill "#F0AD00"
        , SvgAttrs.points <|
            points
                [ ( size / 4 + shift + distance, size / 4 + distance )
                , ( size * 3 / 4 - shift - distance, size / 4 + distance )
                , ( size / 2, size / 2 - shift )
                ]
        ]
        []
    , Svg.polygon
        [ SvgAttrs.fill "#60B5CC"
        , SvgAttrs.points <|
            points
                [ ( size / 2 + shift, 0 )
                , ( size, 0 )
                , ( size, size / 2 - shift )
                ]
        ]
        []
    , Svg.polygon
        [ SvgAttrs.fill "#F0AD00"
        , SvgAttrs.points <|
            points
                [ ( size, size / 2 + shift )
                , ( size * 3 / 4 + shift, size * 3 / 4 )
                , ( size, size - shift )
                ]
        ]
        []
    , Svg.polygon
        [ SvgAttrs.fill "#60B5CC"
        , SvgAttrs.points <|
            points
                [ ( shift, size )
                , ( size / 2, size / 2 + shift )
                , ( size - shift, size )
                ]
        ]
        []
    , Svg.polygon
        [ SvgAttrs.fill "#7FD13B"
        , SvgAttrs.points <|
            points
                [ ( size / 2 + shift, size / 2 )
                , ( size * 3 / 4, size / 4 + shift )
                , ( size - shift, size / 2 )
                , ( size * 3 / 4, size * 3 / 4 - shift )
                ]
        ]
        []
    ]
