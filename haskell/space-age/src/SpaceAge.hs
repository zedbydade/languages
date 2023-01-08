module SpaceAge (Planet(..), ageOn) where
year_in_earth_seconds = 31557600

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn Earth seconds = seconds / year_in_earth_seconds
ageOn Mercury seconds = (seconds) / (get_year_seconds 0.2408467)
ageOn Venus seconds = (seconds) / (get_year_seconds 0.61519726)
ageOn Mars seconds = (seconds) / (get_year_seconds 1.8808158)
ageOn Jupiter seconds = (seconds) / (get_year_seconds 11.862615)
ageOn Saturn seconds = (seconds) / (get_year_seconds 29.447498)
ageOn Uranus seconds = (seconds) / (get_year_seconds 84.016846)
ageOn Neptune seconds = (seconds) / (get_year_seconds 164.79132)

get_year_seconds :: Float -> Float

get_year_seconds number = number * year_in_earth_seconds

