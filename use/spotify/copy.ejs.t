---
sh: "cd <%= cwd %>/src/helpers && cp -r <%= cwd %>/_templates/use/spotify/spotify ./ && cd <%= cwd %>/src/pages && mkdir auth-callback && cd auth-callback && cp -r <%= cwd %>/_templates/use/spotify/auth-callback ./"
---
bootstrap
