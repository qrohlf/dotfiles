// Finicky config file. See https://github.com/johnste/finicky/wiki/Configuration
// for a list of supported options & syntax

const STRAVA_BROWSER = {
  name: "Google Chrome",
  // Profile 2 is personal profile, Profile 3 is work profile, Profile 1 is ???
  profile: "Profile 3",
}

const DEBUG_MODE = true

module.exports = {
  // use Safari as a personal browser
  defaultBrowser: "Safari",
  options: {
    logRequests: DEBUG_MODE,
  },
  handlers: [
    // {
    //   // debug logger
    //   match: ({ opener }) => {
    //     finicky.log('OPENER', opener)
    //     return false
    //   },
    //   browser: STRAVA_BROWSER
    // },
    // open zoom links straight in zoom
    {
      match: [
        finicky.matchDomains(/.*\.zoom.us$/)
      ],
      browser: {
        name: "zoom.us"
      }
    },
    {
      // Open any link clicked in Slack in work browser
      match: ({ opener }) =>
        opener.bundleId === "com.tinyspeck.slackmacgap",
      browser: STRAVA_BROWSER
    },
    {
      match: [
        // open AWS login prompts in work browser
        finicky.matchDomains(/.*\.amazonaws.com$/),
        // open any url containing the string "strava" in work browser
        "*strava*",
        // open all github urls in work browser
        "https://github.com/*",
        // open all localhost urls in work browser
        "localhost*"
      ],
      browser: STRAVA_BROWSER,
    },
  ],
};
