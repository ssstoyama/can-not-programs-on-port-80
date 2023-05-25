package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
)

// PORT ポート番号
const PORT = 80

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, _ *http.Request) {
		io.WriteString(w, "<h1>Hello World!</h1>")
	})

	log.Printf("Server started listening on port %d", PORT)
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", PORT), nil))
}
