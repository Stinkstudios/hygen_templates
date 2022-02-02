---
to: "<%= locals.pageName ? `src/components/_pages/${pageName}/${name}/${name}.module.scss` : `src/components/${name}/${name}.module.scss` %>"
unless_exists: true
---
.<%= name %> {

}