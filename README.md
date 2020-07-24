[Root Ventures](root.vc) has a custom video conferencing app built on the [Daily](daily.co) API. You can use this on your own if you like. Fork the repo and modify to your heart's content.

[![Develop on Okteto](https://okteto.com/develop-okteto.svg)](https://cloud.okteto.com/deploy?repository=https://github.com/rberrelleza/meet)

## Getting Started

### Setup (Recommended steps using Okteto)
1. Create an account on [Daily.co](https://daily.co) and pick a subdomain name.
1. Create rooms in the [Daily.co Dashboard](https://dashboard.daily.co), each beginning with the prefix `meet-`. For example, if you want to make rooms for Avidan, Chrissy, Kane, and Lee, you would create rooms called `meet-avidan`, `meet-chrissy`, `meet-kane`, and `meet-lee`. Make sure the rooms are public.
1. Go to [Okteto Cloud](https://cloud.okteto.com) > Secrets and add `REACT_APP_DAILY_SUBDOMAIN=[YOUR_DAILY_SUBDOMAIN]`.
1. Deploy the app (recommended: use the Okteto button above, and create an account there).
1. Visit `https://meet-[YOUR_GITHUB_ID].cloud.okteto.com/[YOUR_ROOM_NAME]`

### Usage
You must create rooms manually in the [Daily.co Dashboard](https://dashboard.daily.co) before going to the above URL. All room names must begin with `meet-` such as `meet-lee`. This room would be accessible at `https://meet-[YOUR_GITHUB_ID].cloud.okteto.com/lee`. You can share this URL with anyone.

Each of your meeting rooms are located at their own path name (minus the `meet-` at the beginning): `https://meet-[YOUR_GITHUB_ID].cloud.okteto.com/[YOUR_ROOM_NAME]`. The `meet-` prefix functions as a namespace in case you want to use your new Daily.co account for other purposes.

## Deployment Options

Deployment requires an [Okteto](https://cloud.okteto.com.com) account.

### Develop on Okteto Button

[![Develop on Okteto](https://okteto.com/develop-okteto.svg)](https://cloud.okteto.com/deploy)

### From Command Line

```
export REACT_APP_DAILY_SUBDOMAIN=[YOUR_DAILY_SUBDOMAIN]
okteto push
```

## Environment Variables

You can configure the following environment variables in the [Okteto Cloud UI](https://cloud.okteto.com) under Secrets

`REACT_APP_DAILY_SUBDOMAIN` = Subdomain on [daily.co](daily.co) for your account. (e.g. `rootvc`)
`REACT_APP_ASSET_PATH` = Path to your custom assets. For our own implementation, we use S3 and put the URL to the bucket here.
`REACT_APP_COMPANY_NAME` = Name of your company, which will appear in the title, alt tags for your logos, and various other places.
`REACT_APP_COMPANY_URL` = URL for your company, which is the target of the anchor tag around your logo.

### Room-Specific Environment Variables
To change the appearance of a room called "wine":
`REACT_APP_ROOM_WINE_TITLE` = text to display in the upper left corner of the screen
`REACT_APP_ROOM_WINE_BACKGROUND` = a filename for a custom loading spinner background that shows before the iframe loads
`REACT_APP_ROOM_WINE_HEADER` = a filename for a custom header image in the S3 bucket

Learn about Okteto secrets: https://okteto.com/docs/cloud/secrets/index.html

## Development

To deploy your development environment, you can run: 

`okteto up`

This will deploy a remote development environment with all the tools you need to build `meet`.

From the remote terminal, you can run:

### `npm install`

To install dependencies.

Meet uses [scarf-js](https://github.com/scarf-sh/scarf.js) to collect anonymized installation analytics. These analytics help support the maintainers of this package. However, if you'd like to opt out, you can do so by setting `scarfSettings.enabled = false` in your project's package.json, or by setting the environment variable `SCARF_ANALYTICS=false` before you install. See the scarf-js readme for more information.

### `npm start`

Runs the app in the development mode.<br />
Open https://meet-[YOUR_GITHUB_ID].cloud.okteto.com to view it in the browser.

The page will reload if you make edits.<br />
You will also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.<br />
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.<br />
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.<br />
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

## Personalization

### Brand Styles

Edit `src/brand.css` to add your custom color scheme.

### Brand Marks
Default brand marks are located below:

 - `public/favicon.ico`
 - `public/logo192.png`
 - `public/logo512.png`
 - `public/logo-header.png`
 - `public/logo.png`

To use your own brand marks, you can replace these files in your own fork or clone. Or you can change `REACT_APP_ASSET_PATH` to a URL for a directory (e.g. AWS S3, or your own asset server) that contains each of these files by name. See the files for recommended dimensions.

## References

Daily.co API Docs: https://docs.daily.co/reference
Okteto Docs: https://okteto.com/docs

This app was created with create-react-app. You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started). (It has not been ejected. If you don't know what that means, either read the docs or don't worry about it.)

To learn React, check out the [React documentation](https://reactjs.org/).
