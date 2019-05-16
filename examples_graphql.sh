#get the token from github
tokenVal="NEED_TO_PUT_THE_TOKEN_HERE"
# find the issue ids on your repo just 
curl -H "Authorization: token $tokenVal" -X POST -d  " { \"query\": \"query FindIssueID { repository(owner:"grepit", name:"graphql") { issue(number:1) { id } } }\"  } " https://api.github.com/graphql 

# this is a mutation very similar to update/post
curl -X POST \
  https://api.github.com/graphql \
  -H "authorization: token "$tokenVal \
  -H 'cache-control: no-cache' \
  -H 'postman-token: 42780d91-b939-d6d1-2fc5-454cc0d3213f' \
  -d '{"query":"\n\nmutation AddReactionToIssue {\n  addReaction(input:{subjectId:\"MDU6SXNzdWU0NDM3MTExNDc=\",content:HOORAY}) {\n    reaction {\n      content\n    }\n    subject {\n      id\n    }\n  }\n}","variables":{},"operationName":"AddReactionToIssue"}'


#output
#{"data":{"repository":{"issue":{"id":"MDU6SXNzdWU0NDM3MTExNDc="}}}}
#{"data":{"addReaction":{"reaction":{"content":"HOORAY"},"subject":{"id":"MDU6SXNzdWU0NDM3MTExNDc="}}}}
