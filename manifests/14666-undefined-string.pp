file{ "/tmp/undefined_issue.poc":
    ensure  => present,
    content =>inline_template('the answer is: <%= scope.lookupvar("mysql_server_id") %>') 
}
