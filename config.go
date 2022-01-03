package main

import (
	"embed"
	"fmt"
	"io"
	"io/fs"
	"log"
	"os"
	"path/filepath"
)

//go:embed nvim/*
//go:embed iterm2/*
var configs embed.FS

func main() {

	var path = "nvim"
	var basePath = "/tmp/testconfig"

	err := os.Mkdir(filepath.Join(basePath, path), 0755)
	if err != nil {
		log.Println(err)
	}
	writeFiles(basePath, path)

}

func writeFiles(basePath string, path string) {
	subEntries, _ := fs.ReadDir(configs, path)
	for _, entry := range subEntries {
		finalPath := filepath.Join(basePath, path, entry.Name())

		if entry.IsDir() {
			log.Println("Creating dir: ", finalPath)
			path := filepath.Join(path, entry.Name())
			err := os.Mkdir(finalPath, 0755)
			if err != nil {
				log.Println(err)
			}
			writeFiles(basePath, path)
		} else {

			file, _ := configs.Open(filepath.Join(path, entry.Name()))

			log.Println(finalPath)
			content, _ := io.ReadAll(file)
			err := os.WriteFile(finalPath, content, 0755)
			if err != nil {
				fmt.Println(err)
			}
		}

	}

}
