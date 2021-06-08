---
to: 'src/pages/_app.jsx'
inject: true
after: 'const App = ({'
---

    useLayoutEffect(() => {maybeRedirectOrChangeLanguage(router)})
