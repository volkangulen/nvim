return {
	settings = {
		schemas = {
			{
				description = "Aws configuration file",
				fileMatch = {
					"serverless.yml",
					"serverless.yaml",
				},
				-- url = "https://raw.githubusercontent.com/awslabs/goformation/v5.2.11/schema/sam.schema.json",
				url = "https://raw.githubusercontent.com/lalcebo/json-schema/master/serverless/reference.json",
			},
		},
		yaml = {
			customTags = {
				"!Equals sequence",
				"!FindInMap sequence",
				"!GetAtt",
				"!GetAZs",
				"!ImportValue",
				"!Join sequence",
				"!Ref",
				"!Select sequence",
				"!Split sequence",
				"!Sub",
			},
		},
	},
	setup = {
		commands = {
			Format = {
				function()
					vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
				end,
			},
		},
	},
}
