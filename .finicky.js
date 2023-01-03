// Finicky config file. See https://github.com/johnste/finicky/wiki/Configuration
// for a list of supported options & syntax

const STRAVA_BROWSER = {
  name: "Google Chrome",
  // Profile 2 is personal profile, Profile 3 is work profile, Profile 1 is ???
  profile: "Profile 3",
}

module.exports = {
  // use Safari as a personal browser
  defaultBrowser: "Safari",
  handlers: [
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
