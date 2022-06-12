package main

import (
	"embed"
	"flag"
	"io/fs"
	"log"
	"net/http"
)

//go:embed output/*
var static embed.FS

func main() {
	var (
		port = flag.String("port", "0.0.0.0:8080", "serve port")
	)
	flag.Parse()
	public, err := fs.Sub(static, "output")
	if err != nil {
		panic(err)
	}
	http.Handle("/", http.FileServer(http.FS(public)))
	log.Printf("Serving site at: %s - Tap CTRL-C to stop", *port)
	log.Fatal(http.ListenAndServe(*port, nil))
}
