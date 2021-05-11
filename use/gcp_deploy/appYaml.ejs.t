---
to: "web/app.yaml"
unless_exists: true
---
runtime: nodejs12
instance_class: F4

service: default
handlers:
    - url: /$
      secure: always
      static_files: out/index.html
      upload: out/index.html
    - url: /([\/\w][^.#]+)\/?$
      static_files: out/\1/index.html
      upload: out/([\/\w][^.#]+)$.html
      secure: always
      require_matching_file: true
    - url: /(.+)
      secure: always
      static_files: out/\1
      upload: out/(.*)
      require_matching_file: true
    # - url: /share/([0-9a-zA-Z\-\_]+)$
    #   script: auto
    #   secure: always
    - url: /(.+)
      static_files: out/404.html
      upload: out/404.html
      secure: always
