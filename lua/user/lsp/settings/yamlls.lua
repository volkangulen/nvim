return {
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/lalcebo/json-schema/master/serverless/reference.json"] = "serverless.yml",
			},
		},
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
			{
				description = "Ansible requirements file",
				fileMatch = {
					"requirements.yml",
				},
				url = "https://raw.githubusercontent.com/ansible-community/ansible-lint/schemas/src/ansiblelint/f/ansible-requirements-schema.json",
			},
			{
				description = "Ansible meta file",
				fileMatch = {
					"meta/main.yml",
				},
				url = "https://raw.githubusercontent.com/ansible-community/ansible-lint/schemas/src/ansiblelint/f/ansible-meta-schema.json",
			},

			{
				description = "Ansible vars file",
				fileMatch = {
					"vars/*.yml",
					"defaults/*.yml",
					"host_vars/*.yml",
					"group_vars/*.yml ",
				},
				url = "https://raw.githubusercontent.com/ansible-community/ansible-lint/schemas/src/ansiblelint/f/ansible-vars-schema.json",
			},

			{
				description = "Ansible tasks file",
				fileMatch = {
					"tasks/*.yml",
					"handlers/*.yml",
				},
				url = "https://raw.githubusercontent.com/ansible-community/ansible-lint/schemas/src/ansiblelint/f/ansible-tasks-schema.json",
			},

			{
				description = "Ansible lint file",
				fileMatch = {
					"playbooks/*.yml",
				},
				url = "https://raw.githubusercontent.com/ansible-community/ansible-lint/schemas/src/ansiblelint/f/ansible-playbook-schema.json",
			},
		},

		customTags = {
			"!vault",
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
