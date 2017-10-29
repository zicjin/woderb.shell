# https://imququ.com/post/letsencrypt-certificate.html
mkdir ~/ssl && cd ~/ssl
openssl genrsa 4096 > account.key
openssl genrsa 4096 > domain.key
openssl req -new -sha256 -key domain.key -subj "/" -reqexts SAN -config \
<(cat /etc/ssl/openssl.cnf <(printf "[SAN]\nsubjectAltName=DNS:woderb.com,DNS:www.woderb.com,DNS:ssl.woderb.com")) > domain.csr

mkdir ~/ssl/challenges
sh docker_nginx.sh
wget https://raw.githubusercontent.com/diafygi/acme-tiny/master/acme_tiny.py
python acme_tiny.py --account-key ./account.key --csr ./domain.csr --acme-dir /root/ssl/challenges/ > ./signed.crt

wget -O - https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem > intermediate.pem
cat signed.crt intermediate.pem > chained.pem
wget -O - https://letsencrypt.org/certs/isrgrootx1.pem > root.pem
cat intermediate.pem root.pem > full_chained.pem

# nginx.conf
# ssl_certificate     ~/ssl/chained.pem;
# ssl_certificate_key ~/ssl/domain.key;
# ssl_trusted_certificate    ~/ssl/full_chained.pem;

# vi .profile
# EDITOR=vi; export EDITOR
# source .profile
# crontab -e
# 0 0 1 * * /root/woderb.shell/renew_ssl.sh >/dev/null 2>&1