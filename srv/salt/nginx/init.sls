nginx_repo:
  pkgrepo.managed:
    - name: deb http://nginx.org/packages/ubuntu/ trusty nginx
    - file: /etc/apt/sources.list.d/nginx.list
    - key_url: http://nginx.org/keys/nginx_signing.key
    - require_in:
      - pkg: nginx

nginx:
  pkg:
    - installed
  service:
    - running
    - reload: True
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/conf.d/no-default.conf
      - file: /etc/nginx/conf.d/example_ssl.conf
      - file: /etc/nginx/conf.d/default.conf
      - file: /etc/nginx/conf.d/dhparam2048.pem

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/files/nginx.conf

/etc/nginx/conf.d/common.crt:
  file.managed:
    - source: salt://nginx/files/common.crt

/etc/nginx/conf.d/common.key:
  file.managed:
    - source: salt://nginx/files/common.key

/etc/nginx/conf.d/dhparam2048.pem:
  file.managed:
    - source: salt://nginx/files/dhparam2048.pem

/etc/nginx/conf.d/no-default.conf:
  file.managed:
    - source: salt://nginx/files/no-default.conf
    - require:
      - file: /etc/nginx/conf.d/common.crt
      - file: /etc/nginx/conf.d/common.key

/etc/nginx/conf.d/example_ssl.conf:
  file.absent

/etc/nginx/conf.d/default.conf:
  file.absent
