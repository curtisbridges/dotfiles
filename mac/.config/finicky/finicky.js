export default {
  defaultBrowser: 'Safari',
  handlers: [
    {
      match: /github\.skillsoft\.com/,
      browser: {
        name: 'Google Chrome',
        openUrl: (url) => [
          '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
          '--profile-directory=Profile 2', // replace with your profile name
          url,
        ],
      },
    },
    {
      match: /skillsoftdev\.atlassian\.net/,
      browser: {
        name: 'Google Chrome',
        openUrl: (url) => [
          '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
          '--profile-directory=Profile 2', // replace with your profile name
          url,
        ],
      },
    },
    {
      match: /squads-dev\.com/,
      browser: {
        name: 'Google Chrome',
        openUrl: (url) => [
          '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
          '--profile-directory=Profile 2', // replace with your profile name
          url,
        ],
      },
    },
  ],
}
