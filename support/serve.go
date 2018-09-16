package main

import "net/http"

func main() {
	root := http.Dir("./build")
	handler := http.FileServer(root)
	http.ListenAndServe(":8080", handler)
}
