---
to: 'next.config.js'
inject: true
before: ADD IMAGE PROVIDERS AUTOMATICALLY - HYGEN ANCHOR
skip_if: imageProviders \+= 'sanity'
---
imageProviders += 'sanity'