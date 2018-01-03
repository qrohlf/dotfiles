const Github = require('github')

const token = process.env.GH_TOKEN
const username = process.env.GH_USER

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

const ghClient = new Github()

ghClient.authenticate({
  type: 'token',
  token: token
})

const createOrUpdateLabel = ({repo, label, color}) => {
  ghClient.issues.createLabel({
    owner: 'ridewithgps',
    repo: repo,
    name: label,
    color: color
  }).catch(e => {
    ghClient.issues.updateLabel({
      owner: 'ridewithgps',
      repo: repo,
      oldname: label,
      name: label,
      color: color
    })
  })
}

const createLabels = (repo) => {
  Object.keys(labels).forEach(label => {
    const color = labels[label]
    createOrUpdateLabel({
      repo,
      label,
      color
    })
  })
}

repos.forEach(r => createLabels(r))

