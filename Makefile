VAULT=ansible-vault
EDIT=$(VAULT) edit
VIEW=$(VAULT) view
WITH_PASS=--vault-password-file vault_password

VARS=group_vars

.PHONY: edit-vars
edit-vars:
	EDITOR='code --wait' $(EDIT) $(VARS)/tag_env_production.yml $(WITH_PASS)

.PHONY: view-vars
view-vars:
	$(VIEW) $(VARS)/tag_env_production.yml $(WITH_PASS)