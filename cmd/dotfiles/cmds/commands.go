package cmds

import "github.com/spf13/cobra"

var (
	extractCmd string
)

func New() *cobra.Command {

	rootCommand := &cobra.Command{
		Use: "dotfiles",
	}

	// extract
	extractCommand := &cobra.Command{
		Use: "extract [config]",
	}
	extractCommand.Flags().StringVarP(&extractCmd, "extract", "e", "", "extract config")

	rootCommand.AddCommand(extractCommand)

	return rootCommand

}
