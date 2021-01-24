# Local Development HTTPS

Generate the directory where we'll store our public certificate and private key:

`mkdir -p priv/cert`

Using [mkcert](https://github.com/FiloSottile/mkcert) generate a wildcard certificate:

`mkcert -cert-file priv/cert/selfsigned.pem --key-file priv/cert/selfsigned_key.pem localhost`

This will let us access the Turret app at [https://localhost:4000](https://localhost:4000).
