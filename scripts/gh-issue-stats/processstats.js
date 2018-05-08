const repos = ['rwgps-ui', 'ridewithgps', 'rwgps-ios', 'rwgps-android']

repos.forEach(repo => {
  console.log(`\n--------------yearly stats for ${repo}--------------`)
  const {reOpens, totalIssues} = require(`./results/${repo}-activity.json`)
  console.log('total issues: ', totalIssues)
  console.log('re-opens: ', reOpens.length)
  console.log('average re-opens per 100 issues: ', (reOpens.length / totalIssues) * 100)
  console.log('\n')
})

