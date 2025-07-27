---@brief
---
--- https://github.com/swiftlang/sourcekit-lsp
---
--- Language server for Swift and C/C++/Objective-C.

return {
	cmd = { "sourcekit-lsp" },
	filetypes = { "swift", "objc", "objcpp" },
	root_markers = {
		"Package.swift",
	},
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
		textDocument = {
			diagnostic = {
				dynamicRegistration = true,
				relatedDocumentSupport = true,
			},
		},
	},
}
