helios() {
  ARGS="$(jq --arg r $1 --arg g $2 --arg b $3 '. + {r: $r, g: $g, b: $b}' <<< '{ "r": 0, "g" : 0, "b": 0, "lights": [41, "..", 50]}')"
  http POST http://newrelic-helios.herokuapp.com effect=StaticColor args:="$ARGS"
}
