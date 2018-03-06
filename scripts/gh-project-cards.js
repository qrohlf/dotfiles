// annoying thing to bulk-add issues to a github project
const Github = require('github')

// setup promise handling
process.on('unhandledRejection', reason => {
  // todo error logs
  console.error(reason)
  process.exit(1)
})

// setup github API
const github = new Github()
const token = process.env.GH_TOKEN
github.authenticate({
  type: 'token',
  token: token
})

// Get your issue ids in order:
// in JS console on milestone or search:
// var ids = Array.prototype.slice.call(document.querySelectorAll('.opened-by')).map(n => n.innerHTML.match(/\d+/)[0])
// copy(JSON.stringify(ids.map(n => parseInt(n, 10))))
const issues = [4593,3956,4525,4442,4491,4506,4295,4292,4293,4514,4572,4564,4530,4544,4555,4140,4428,4554,4513,4560,4552,4492,4537,4538,4531,4536,4511,4510,4011,4499,4502,4102,4520,4503,4461,4392,4155,4472,4465,4452,4443,4239,4416,4050,4256,4272,4241,4315,3561,3837,4336,4252,4370,4369,4358,4052,4338,4225,4322,3469,3375,3869,3838,4114,4323,3152,4118,4278,4124,4128]

// find your project id:
// github.projects.getOrgProjects({org: 'ridewithgps'}).then(p => {
//   debugger
// })

// confirm you have the correct project id:
// const projectId = 1337802
// github.projects.getProject({id: projectId}).then(p => {
//   debugger
// })

// find your column id:
// github.projects.getProjectColumns({project_id: projectId}).then((p) => {
//   const g = github
//   debugger
// }).catch(console.error)

// actually do the thing
const backlogColId = 2310489

// GH doesn't let you specify ordering when adding cards to a project col, and
// floats new cards to the top, so we loop through synchronously in
// reverse-order
const issuePromises = issues.reverse()
  .map(i => github.issues.get({owner: 'ridewithgps', repo: 'ridewithgps', number: i}))

Promise.all(issuePromises)
  .then(iss => iss.map(({data}) => data.id))
  .then(ids => {
    var currentIssue = 0
    const processNextIssue = () => {
      github.projects.createProjectCard({
        column_id: backlogColId,
        content_type: 'Issue',
        content_id: ids[currentIssue]
      }).then(() => {
        console.log(`processed ${currentIssue}`)
        currentIssue += 1
        if (currentIssue < ids.length) {
          processNextIssue()
        }
      })
    }
    processNextIssue()
  })
