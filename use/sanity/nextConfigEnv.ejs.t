---
inject: true
to: 'next.config.js'
after: \/\*\* CREATE ENV FROM CONFIG FILE \*\/
skip_if: projectFileJSON\.sanity\.project_id
---
/* SANITY */
env.SANITY_STUDIO_API_PROJECT_ID = projectFileJSON.sanity.project_id
env.SANITY_STUDIO_API_DATASET = projectFileJSON.sanity.default_dataset