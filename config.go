package main

import (
	"embed"
	"io"
	"io/fs"
	"log"
	"os"
	"path/filepath"
)

//go:embed nvim/*
var configs embed.FS
var dryrun = false

func main() {

	if len(os.Args) > 1 {
		flag := os.Args[1]
		if flag == "--dryrun" {
			dryrun = true
		}
	}

	var path = "nvim"
	homeDir, _ := os.UserHomeDir()
	var basePath = filepath.Join(homeDir, ".config")

	if dryrun {
		log.Println("Mkdir", basePath, path)
	} else {
		err := os.Mkdir(basePath, 0755)
		if err != nil {
			log.Println(err)
		}
		err = os.Mkdir(filepath.Join(basePath, path), 0755)
		if err != nil {
			log.Println(err)
		}
	}
	writeFiles(basePath, path)

}

func writeFiles(basePath string, path string) {
	subEntries, _ := fs.ReadDir(configs, path)
	for _, entry := range subEntries {
		finalPath := filepath.Join(basePath, path, entry.Name())

		if entry.IsDir() {
			path := filepath.Join(path, entry.Name())
			if dryrun {
				log.Println("Creating dir: ", finalPath)
			} else {
				err := os.Mkdir(finalPath, 0755)
				if err != nil {
					log.Println(err)
				}
			}
			writeFiles(basePath, path)
		} else {

			if entry.Name() == "nvim.tar.gz" {
				// write to /home/user
				homeDir, _ := os.UserHomeDir()
				if dryrun {
					log.Println("Copying to", homeDir)
					continue
				} else {
					finalPath = filepath.Join(homeDir, entry.Name())
				}
			}

			file, _ := configs.Open(filepath.Join(path, entry.Name()))
			defer file.Close()

			content, _ := io.ReadAll(file)
			if dryrun {
				log.Println("Write", finalPath)
			} else {
				err := os.WriteFile(finalPath, content, 0755)
				if err != nil {
					log.Println(err)
				}
			}
		}

	}

}
