---
to: "<%= locals.pageName ? `src/components/_pages/${pageName}/${name}/${name}.stories.jsx` : `src/components/${name}/${name}.stories.jsx` %>"
unless_exists: true
---

import React from 'react'
import { storiesOf } from '@storybook/react'
import Component from './<%= name %>'

storiesOf('<%= name %>', module).add('Default', () => <Component />)
