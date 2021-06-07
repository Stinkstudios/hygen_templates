---
to: 'src/pages/_app.jsx'
inject: true
before: 'return \('
---

    useLayoutEffect(() => {maybeRedirectOrChangeLanguage(router)})
