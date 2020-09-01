---
sh: "cd <%= cwd %>/web/src/helpers && cp -r <%= cwd %>/_templates/use/spotify/spotify ./ && cd <%= cwd %>/web/src/pages mkdir auth-callback && cd auth-callback && cp -r <%= cwd %>/_templates/use/spotify/auth-callback/. ./"
---
bootstrap
