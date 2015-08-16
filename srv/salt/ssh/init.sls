/etc/ssh/sshd_config:
  file.managed:
    - source: salt://ssh/files/sshd_config

ssh:
  service.running:
    - watch:
      - file: /etc/ssh/sshd_config
