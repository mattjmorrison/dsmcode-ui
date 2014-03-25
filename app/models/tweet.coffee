Tweet = DS.Model.extend
  content: DS.attr 'string'
  group: DS.belongsTo 'group'

`export default Tweet;`
