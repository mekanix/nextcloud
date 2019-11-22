REGGAE_PATH = /usr/local/share/reggae
SERVICES = letsencrypt https://github.com/mekanix/jail-letsencrypt \
	   postgresql https://github.com/mekanix/jail-postgresql \
	   nextcloud https://github.com/mekanix/jail-nextcloud \
	   nginx https://github.com/mekanix/jail-nginx

post_setup:
	@echo "FLAVOR = nginx-full" >>services/nginx/project.mk
	@echo "/usr/cbsd/jails-data/letsencrypt-data/usr/local/etc/dehydrated/certs /etc/certs nullfs rw 0 0" >services/nginx/templates/fstab
	@echo "/usr/cbsd/jails-data/nextcloud-data/usr/local/www/nextcloud /usr/local/www/nextcloud nullfs rw 0 0" >>services/nginx/templates/fstab

.include <${REGGAE_PATH}/mk/project.mk>

