VAULT=ansible-vault
EDIT=$(VAULT) edit
WITH_PASS=--vault-password-file vault_password

VARS=group_vars

.PHONY: edit-vars
edit-vars:
	EDITOR='code --wait' $(EDIT) $(VARS)/tag_env_discourse.yml $(WITH_PASS)