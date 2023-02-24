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


.PHONY: backup-discourse
backup-discourse:
	docker run --rm -v ${PWD}/data/backups/discourse:/backups --volumes-from discourse busybox \
  	cp -a /bitnami/discourse /backups/latest

.PHONY: restore-discourse
restore-discourse:
	docker run -d --name discourse \
		--volume ${PWD}/data/backups/discourse/latest:/bitnami/discourse \
  	bitnami/discourse:latest


.PHONY: backup-postgresql
backup-postgresql:
	docker run --rm -v ${PWD}/data/backups/postgresql:/backups --volumes-from postgresql busybox \
  	cp -a /bitnami/postgresql /backups/latest

.PHONY: restore-postgresql
restore-postgresql:
	docker run -d --name postgresql \
  	--volume ${PWD}/data/backups/postgresql/latest:/bitnami/postgresql \
  	bitnami/postgresql:latest
