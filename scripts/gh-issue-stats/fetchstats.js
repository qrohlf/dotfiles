const Github = require('@octokit/rest')
const fs = require('fs')

const token = process.env.GH_TOKEN
// const username = process.env.GH_USER

const repos = ['rwgps-ui', 'ridewithgps', 'rwgps-ios', 'rwgps-android']

const labels = {
  'priority:low': 'e0f3f8',
  'priority:medium': '91bfdb',
  'priority:high': 'fee090',
  'priority:critical': 'fc8d59'
}

// setup promise handling
process.on('unhandledRejection', reason => {
  // todo error logs
  console.error(reason)
  process.exit(1)
})

const github = new Github()

github.authenticate({
  type: 'token',
  token: token
})

// last year
const DATE_THRESHOLD = new Date('2017-05-08T12:00:00Z')

// last month
// const DATE_THRESHOLD = new Date('2018-04-08T12:00:00Z')

async function paginate (method, options, threshold) {
  let response = await method({per_page: 100, ...options})
  let {data} = response
  while (github.hasNextPage(response)) {
    response = await github.getNextPage(response)
    process.stdout.write('.')
    data = data.concat(response.data)
    if (threshold) {
      const lastDate = new Date(data[data.length - 1].created_at)
      if (lastDate < threshold) { break }
    }
  }
  process.stdout.write('\n')
  return data
}

const activityFilter = (activity) => (
  activity.event === 'reopened' &&
  (new Date(activity.created_at) > DATE_THRESHOLD)
)

const getReopens = async (repo) => {
  console.log(`👉 fetching activity for ${repo}`)
  const activity = await paginate(
    github.issues.getEventsForRepo,
    {owner: 'ridewithgps', repo},
    DATE_THRESHOLD
  )

  console.log(`👉 fetching issues for ${repo}`)
  const issues = await paginate(
    github.issues.getForRepo,
    {owner: 'ridewithgps', repo, since: DATE_THRESHOLD}
  )

  const reOpens = activity.filter(activityFilter)
  const totalIssues = issues.length
  const result = {reOpens, totalIssues}
  const file = `results/${repo}-activity.json`
  fs.writeFileSync(file, JSON.stringify(result, null, '  '))
  console.log(`wrote results to ${file}`)
}

async function main () {
  for (let r of repos) {
    await getReopens(r)
  }
}

main()
  .then(() => process.exit(0))
  .catch(e => {
    console.error(e)
    process.exit(1)
  })
