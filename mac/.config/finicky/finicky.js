export default {
  defaultBrowser: 'Safari',
  handlers: [
    {
      match: (url) => url.host.endsWith('localhost'),
      browser: 'Google Chrome:Skillsoft',
    },
    {
      match: (url) => url.host.endsWith('github.skillsoft.com'),
      browser: 'Google Chrome:Skillsoft',
    },
    {
      match: (url) => url.host.endsWith('skillsoftdev.atlassian.net'),
      browser: 'Google Chrome:Skillsoft',
    },
    {
      match: (url) => url.host.endsWith('squads-dev.com'),
      browser: 'Google Chrome:Skillsoft',
    },
    {
      match: (url) => url.host.endsWith('snyk.io'),
      browser: 'Google Chrome:Skillsoft',
    },
    {
      match: (url) => url.host.endsWith('myworkday.com'),
      browser: 'Google Chrome:Skillsoft',
    },
    {
      match: (url) => url.host.endsWith('cursor.com'),
      browser: 'Google Chrome:Skillsoft',
    },
    {
      match: (url) => url.host.endsWith('google.com'),
      browser: 'Google Chrome:Personal',
    },
    {
      match: (url) => url.host.endsWith('youtube.com'),
      browser: 'Google Chrome:Personal',
    },
  ],
}
