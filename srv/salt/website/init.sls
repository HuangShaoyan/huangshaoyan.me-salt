include:
  - nginx

/etc/nginx/conf.d/huangshaoyan.me.crt:
  file.managed:
    - source: salt://website/files/huangshaoyan.me.crt

/etc/nginx/conf.d/huangshaoyan.me.key:
  file.managed:
    - source: salt://website/files/huangshaoyan.me.key

/etc/nginx/conf.d/huangshaoyan.me.conf:
  file.managed:
    - source: salt://website/files/huangshaoyan.me.conf

extend:
  nginx:
    service:
      - watch:
        - file: /etc/nginx/conf.d/huangshaoyan.me.crt
        - file: /etc/nginx/conf.d/huangshaoyan.me.key
        - file: /etc/nginx/conf.d/huangshaoyan.me.conf
