 [![](https://collaborating.tuhh.de/e-10/hoou/pontifex-hugo/-/jobs/artifacts/dev/raw/nodes.svg?job=dynamic_badge)]()
 [![](https://collaborating.tuhh.de/e-10/hoou/pontifex-hugo/-/jobs/artifacts/dev/raw/edges.svg?job=dynamic_badge)]()
 [![](https://collaborating.tuhh.de/e-10/hoou/pontifex-hugo/-/jobs/artifacts/dev/raw/podcasts.svg?job=dynamic_badge)]()

# Pontifex-Hugo

# Getting Started

> If you want to kickstart your own project with Pontifex and HUGO

## Kickstart your own application on GitHub

* Import project
* Set variables
* Trigger action
* Done

## Modifying the content

### Graph Database

All connections are stored in the [JSON]() file `graph.json`.
This file encodes all nodes and edges and links the relevant metadata.
It has the following structure

#### Nodes

Example entry:
```json
    "305": {
      "id": "305",
      "label": "Epsilon-Delta\nDefinition",
      "meta": "RA28",
      "content": "A different notion of continuity using open intervals. If the input to a continuous function varies less than delta, then the output values should vary less than epsilon.",
      "notes": "305-snippet.html",
      "video": "https://www.youtube.com/embed/4xhyqdjmxHU?start=11",
      "webwork": "https://jupyterhub.mat.tu-harburg.de/webwork2/html2xml?&answersSubmitted=0&sourceFilePath=Library/Berkeley/StewCalcET7e/2.4/2-4-03.pg&problemSeed=123567890&displayMode=MathJax&courseID=pontifex&userID=pontifexuser&course_password=ki(JH7j3m4)k_46)&outputformat=simple",
      "podcast": "<iframe src=\"https://anchor.fm/profmoppi/embed/episodes/Continuity-Part-1-with-Fabian-Gabel-e1kvb1u\" height=\"102px\" width=\"100%\" frameborder=\"0\" scrolling=\"no\"></iframe><p>Courtesy of Marcus Waurick. <i>Well-defined & Wonderful podcast</i>, <a href=\"https://www.marcus-waurick.de/teaching\">marcus-waurick.de</a>.</p>"
    },
```

* `id` should be a unique three digit number. The first digit specifies the chapter (0-6). The second and third digits run from `00` to `99`. The `id` should also be the key of the node.
* `label` is the text used as title of the node.
* `meta` contains further information, for the content. In the above example it specifies the name of the video (not processed by any routines)
* `content` explains the topic, text shows in the introduction below the title
* `notes` name of the html lecture notes
* `video` link to youtube
* `webwork` link to webwork exercise or other webpage that will be embedded via an iframe
* `podcast` plain html iframe code to go in the podcast section inside the dummy

#### Edges

### Node Content

Based on `dummy_for_hugo`

#### TeX Snippets

#### Markdown Template

#### Further resources

Are embedded using either HUGO shortcodes or in the python preprocessing step.

##### Lecture Notes in TeX Format

* Node content
* `packages.tex`

##### YouTube Videos

* via shortcode
* specify link in json
* based on export snippet on YouTube

##### Podcast Episodes

###### I Frames from Hoster

* go to AnchorFM and copy snippet

##### Discussion Forum

* Vssue
* Etherpads

##### WeBWorK or other Electronic Exercises

* Via IFrame
* WeBWorK Template



This repo contains the essential Python and Bash scripts to build the pontifex project using HUGO.

# Developer Info

## Python Preprocessing

*.py files in bin
| Preprocessor | Description |
| - | - |
| `build_json.py` | Build JSON file for each node containing only neighbours of distance 1 |
| `build_md.py` | Build MD file for each node substituting placeholdes by node-specific values |

## Cytoscape JS

pontifex-graph.js

and 

pontifex-overview.js

## Pandoc

Translation of TeX to html with MathJax support is acchieved with pandoc.

## Dummies and Shortcodes

dummy_for_hugo.md specifies the overall structure of each page

## Branding 

All files that apply some sort of branding reside in the **private** repository

https://collaborating.tuhh.de/hoou-an-der-tuhh-projekte/pontifex/pontifex-brand

Content is copied to their respective locations in the `.gitlab-ci.yml`-stage: `brand`.

As `pontifex-brand` is private, the repo `pontifex-hugo` needs to have an *access token* in the pipeline variables in order to clone `pontifex-brand`. The presently used token was generated within `pontifex-brand`/Settings/Access Tokens with `read repository` scope and added to `pontifex-hugo` as the pipeline variable `PROJECT_TOKEN`.

## Development environment using Docker

Download or clone `pontifex-hugo` first:

```bash
git clone git@collaborating.tuhh.de:e-10/hoou/pontifex-hugo.git
```

# Building the Docker image locally and building the HUGO project

Dowload or clone `pontifex-hugo`
```bash
git clone git@collaborating.tuhh.de:e-10/hoou/pontifex-hugo.git
```

Within `pontifex-hugo` run 
```bash
docker build . -t pontifex-hugo
```

Now, run 
```bash
docker run -it --rm -v `pwd`:/app -w /app pontifex-hugo ./bin/build_pontifex.sh
```
to build the project.

This process should also be carried out every time, an update of `pontifex-hugo/{bin/,Dockerfile}` is carried out.

# Building the HUGO project with an external Docker image

Within a git-clone of [`pontifex-hugo`](https://collaborating.tuhh.de/e-10/hoou/pontifex-hugo), run
```bash
docker run -it --rm -v `pwd`:/app -w /app collaborating.tuhh.de:5005/e-10/hoou/pontifex-hugo ./bin/build_pontifex.sh
```

This will use the root image from the [Container Registry](https://collaborating.tuhh.de/e-10/hoou/pontifex-hugo/container_registry/).

You may need to
```
docker login collaborating.tuhh.de:5005
```
and authenticate first. Note that, the first time you `docker run` the above command, it may take longer as the image needs to be downloaded first.

---
# HUGO Doks 


<p align="center">
  <a href="https://getdoks.org/">
    <img alt="Doks" src="https://doks.netlify.app/doks.svg" width="60">
  </a>
</p>

<h1 align="center">
  Doks
</h1>

<h3 align="center">
  Modern Documentation Theme
</h3>

<p align="center">
  Doks is a Hugo theme for building secure, fast, and SEO-ready documentation websites, which you can easily update and customize.
</p>

<p align="center">
  <a href="https://github.com/h-enk/doks/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/h-enk/doks?style=flat-square" alt="GitHub">
  </a>
  <a href="https://github.com/h-enk/doks/releases">
    <img src="https://img.shields.io/github/v/release/h-enk/doks?include_prereleases&style=flat-square"alt="GitHub release (latest SemVer including pre-releases)">
  </a>
  <a href="https://www.npmjs.com/package/@hyas/doks">
    <img src="https://img.shields.io/npm/v/@hyas/doks?style=flat-square" alt="npm (scoped)">
  </a>
  <a href="https://github.com/h-enk/doks/actions?query=workflow%3A%22Hyas+CI%22">
    <img src="https://img.shields.io/github/workflow/status/h-enk/doks/Hyas%20CI/master?style=flat-square" alt="GitHub Workflow Status (branch)">
  </a>
  <a href="https://app.netlify.com/sites/doks/deploys">
    <img src="https://img.shields.io/netlify/8a1009d5-88ac-413e-96ef-3f928674a083?style=flat-square" alt="Netlify">
  </a>
</p>

![Doks — Modern Documentation Theme](https://raw.githubusercontent.com/h-enk/doks/master/images/tn.png)

## Demo

- [doks.netlify.app](https://doks.netlify.app/)

## Why Doks?

Nine main reasons why you should use Doks:

1. __Security aware__. Get B+ scores on [Mozilla Observatory](https://observatory.mozilla.org/analyze/doks.netlify.app) out of the box. Easily change the default Security Headers to suit your needs.

2. __Fast by default__. Get 104 scores on [Google Lighthouse](https://googlechrome.github.io/lighthouse/viewer/?gist=7731347bb8ce999eff7428a8e763b637) by default. Doks removes unused css, prefetches links, and lazy loads images.

3. __SEO-ready__. Use sensible defaults for structured data, open graph, and Twitter cards. Or easily change the SEO settings to your liking.

4. __Development tools__. Code with confidence. Check styles, scripts, and markdown for errors and fix automatically or manually.

5. __Bootstrap framework__. Build robust, flexible, and intuitive websites with Bootstrap 5. Easily customize your Doks site with the source Sass files.

6. __Netlify-ready__. Deploy to Netlify with sensible defaults. Easily use Netlify Functions, Netlify Redirects, and Netlify Headers.

7. __Full text search__. Search your Doks site with FlexSearch. Easily customize index settings and search options to your liking.

8. __Page layouts__. Build pages with a landing page, blog, or documentation layout. Add custom sections and components to suit your needs.

9. __Dark mode__. Switch to a low-light UI with the click of a button. Change colors with variables to match your branding.

### Other features

- __Multilingual and i18n__ support
- __Versioning__ documentation support
- __KaTeX__ math typesetting
- __Mermaid__ diagrams and visualization
- __highlight.js__ syntax highlighting

## Requirements

- [Git](https://git-scm.com/) — latest source release
- [Node.js](https://nodejs.org/) — latest LTS version or newer

<details>
<summary>Why Node.js?</summary>

Doks uses npm (included with Node.js) to centralize dependency management, making it [easy to update](https://getdoks.org/docs/help/how-to-update/) resources, build tooling, plugins, and build scripts.

</details>

## Get started

Start a new Doks project in three steps:

### 1. Create a new site

Doks is available as a child theme and a starter theme.

#### Child theme

- Intended for novice to intermediate users
- Intended for minor customizations
- [Easily update npm packages](https://getdoks.org/docs/help/how-to-update/) — __including__ [Doks](https://www.npmjs.com/package/@hyas/doks)

```bash
git clone https://github.com/h-enk/doks-child-theme.git my-doks-site && cd my-doks-site
```

#### Starter theme

- Intended for intermediate to advanced users
- Intended for major customizations
- [Easily update npm packages](https://getdoks.org/docs/help/how-to-update/)

```bash
git clone https://github.com/h-enk/doks.git my-doks-site && cd my-doks-site
```

<details>
<summary>Help me choose</summary>

Not sure which one is for you? Pick the child theme.

</details>

### 2. Install dependencies

```bash
npm install
```

### 3. Start development server

```bash
npm run start
```

## Other commands

Doks comes with [commands](https://getdoks.org/docs/prologue/commands/) for common tasks.

## Documentation

- [Netlify](https://docs.netlify.com/)
- [Hugo](https://gohugo.io/documentation/)
- [Doks](https://getdoks.org/)

## Communities

- [Netlify Community](https://community.netlify.com/)
- [Hugo Forums](https://discourse.gohugo.io/)
- [Doks Discussions](https://github.com/h-enk/doks/discussions)

## Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

[![OC sponsor 0](https://opencollective.com/doks/tiers/sponsor/0/avatar.svg)](https://opencollective.com/doks/tiers/sponsor/0/website)
[![OC sponsor 1](https://opencollective.com/doks/tiers/sponsor/1/avatar.svg)](https://opencollective.com/doks/tiers/sponsor/1/website)

## Backers

Support this project by becoming a backer. Your avatar will show up here.

[![Backers](https://opencollective.com/doks/tiers/backer.svg)](https://opencollective.com/doks)
