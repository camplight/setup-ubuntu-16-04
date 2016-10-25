module.exports = function (angel) {
  var sequence = require('organic-stem-devtools/lib/sequencial-exec')
  var format = require('string-template')
  angel.on('vps :remote setup', function (angel) {
    sequence([
      format('REMOTE=root@{remote} angel cell setup-vps ubuntu', angel.cmdData),
      format('REMOTE=node@{remote} angel cell setup-node-env ubuntu', angel.cmdData)
    ])
  })
  angel.on('vps :remote setup mongodb', function (angel) {
    var sequence = require('organic-stem-devtools/lib/sequencial-exec')
    sequence([
      format('REMOTE=root@{remote} angel cell setup-mongodb ubuntu', angel.cmdData)
    ])
  })
  angel.on('vps :remote setup pm2', function (angel) {
    var sequence = require('organic-stem-devtools/lib/sequencial-exec')
    sequence([
      format('REMOTE=node@{remote} angel cell setup-pm2 ubuntu', angel.cmdData)
    ])
  })
}
