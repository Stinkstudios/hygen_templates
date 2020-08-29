<h1 align="center">Spotify Duo</h1>

This repository houses the codebase for the microsite promoting the Spotify Kids product and the associated app.

#### Table of contents:

<ul>
  <li>
    <h4><a href="#frontend">
      Frontend
    </a></h4>
  </li>
  <li>
    <h4><a href="#cloud-functions">
      Cloud Functions
    </a></h4>
  </li>
  <li>
    <h4><a href="developer-workflow">
      Developer workflow
    </a></h4>
  </li>
</ul>

<br />

# **Global configuration**

The main configuration for the codebase can be found in root package.json. This contains workflow config, such as lint, prettier, etc.

<br />

# **Frontend**

The frontend is built in [Next.js](https://nextjs.org) and housed under the web folder. The frontend is deployed on [Google App Engine](https://cloud.google.com/appengine). There are 3 main config files within the web folder: package.json, next.config.js, and app.yaml.

<br />

### Local development

To begin local development:

```
cd web/
npm i
npm run dev
```

<br />

### Styling

[Stylus](https://stylus-lang.com/) is used as a CSS preprocessor, with the help of the library [Rupture](https://jescalan.github.io/rupture/) to handle the media queries.

The naming convention used on this project is [ABEM](https://css-tricks.com/abem-useful-adaptation-bem/), with minor tweaks and rules:

-   Addition of the prefixes `l-` for layouts and `p-` for pages
-   Every component's wrapping element uses the prefix `m-` and all child elements will start with this prefix (mimicking nesting)

<br />

### Deployment

The website is continuously deployed to [Google App Engine](https://cloud.google.com/appengine) via [Google Cloud Build](https://cloud.google.com/cloud-build). The services are deployed on [Google Cloud Functions](https://cloud.google.com/functions) and [Google Cloud Storage](https://cloud.google.com/storage). The production environment lives on the Google Cloud project owned by Spotify. The stage/dev/test environments live on the Google Cloud project owned by Stink. Access will be granted on a request basis. Deployments are triggered by pull request merge to the branches specified below:

| Branch    | Role                                            | URL                                                             |
| --------- | ----------------------------------------------- | --------------------------------------------------------------- |
| `staging` | Copy of the production site                     | https://stage-dot-spotify-kids-stink-internal.ue.r.appspot.com/ |
| `test`    | For testing purposes, i.e. QA                   | https://test-dot-spotify-kids-stink-internal.ue.r.appspot.com/  |
| `dev`     | Representation of the current development state | https://dev-dot-spotify-kids-stink-internal.ue.r.appspot.com/   |

<br />

# **Cloud Functions**

Certain functionality must be provided via services during the experience. These services are hosted as Google Cloud Functions. Each service is developed under its own directory within the _functions_ directory in the root. **local development instructions tba**

# Developer workflow

To start developing, follow the quickstart, then branch off of **_dev_** with a branched named based on the following logic:

-   If you are doing global work, create a branch name with your own git handle (e.g. **_bpriddy_**)
-   If you are doing work in either web or cms, but cannot group your work into a feature, do the following: \<section\>/\<git handle\> (e.g. **_functions_/bpriddy\_**)
-   If you are doing work in either web or cms, and **can** group your work logically into a feature, do the following: \<section\>/feature/\<feature name\> (e.g. **_functions/feature/fileupload_**)

<br />

### Linting

We use the following for our default pre commit linting:

-   https://github.com/evcohen/eslint-plugin-jsx-a11y#readme
-   https://github.com/eslint/eslint/blob/master/conf/eslint-recommended.js
-   https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-max-depth.md
