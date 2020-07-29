package main

import (
	"fmt"
	"github.com/seanponeil/nordvpn"
)

func main() {
	status := nordvpn.ConnectionStatus()
	fmt.Println(status)
}

// status() {
// echo "$($HOME/go/bin/nordvpn-status)"
// }

// city() {
//  echo "$($HOME/go/bin/nordvpn-status --city)"
// }

// if [ "$(status)" = "Connected" ]; then
//     echo "%{A1:nordvpn d:} $(city)%{A}"
// else
//     echo "%{A1:nordvpn c:}%{A}"
// fi
