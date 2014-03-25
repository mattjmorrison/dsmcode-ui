Post = DS.Model.extend
  title: DS.attr 'string'
  group: DS.belongsTo 'group'

`export default Post;`
