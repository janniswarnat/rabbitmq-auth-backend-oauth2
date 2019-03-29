#!/usr/bin/env ruby
require 'bunny'

queues = ARGV

queues.each do |q|
    split = q.split("/")
    vhost = split[0]
    queue_name = split[1]

    conn = Bunny.new(:user => "rabbit_super", :pass => "eyJhbGciOiJSUzI1NiIsImprdSI6Imh0dHBzOi8vdmRpLWRlYmlhbjA5LmZpdC5mcmF1bmhvZmVyLmRlOjgwODAvdWFhL3Rva2VuX2tleXMiLCJraWQiOiJsZWdhY3ktdG9rZW4ta2V5IiwidHlwIjoiSldUIn0.eyJqdGkiOiJiZTA4YTNkMjM1YmY0NTc5ODU0YzBlYjg1OWE0YzVhOSIsInN1YiI6IjY0MjcwYjgyLTVhY2YtNDkyNS1iYjk5LTAzZTA0NTQzMDg5ZSIsInNjb3BlIjpbInJhYmJpdG1xLnJlYWQ6Ki8qIiwicmFiYml0bXEud3JpdGU6Ki8qIiwicmFiYml0bXEuY29uZmlndXJlOiovKiJdLCJjbGllbnRfaWQiOiJyYWJiaXRfY2xpZW50IiwiY2lkIjoicmFiYml0X2NsaWVudCIsImF6cCI6InJhYmJpdF9jbGllbnQiLCJncmFudF90eXBlIjoicGFzc3dvcmQiLCJ1c2VyX2lkIjoiNjQyNzBiODItNWFjZi00OTI1LWJiOTktMDNlMDQ1NDMwODllIiwib3JpZ2luIjoidWFhIiwidXNlcl9uYW1lIjoicmFiYml0X3N1cGVyIiwiZW1haWwiOiJyYWJiaXRfc3VwZXJAZXhhbXBsZS5jb20iLCJhdXRoX3RpbWUiOjE1NTM3NjE3NzAsInJldl9zaWciOiI2NTAwNjkzMSIsImlhdCI6MTU1Mzc2MTc3MCwiZXhwIjoxNTUzODA0OTcwLCJpc3MiOiJodHRwOi8vdmRpLWRlYmlhbjA5LmZpdC5mcmF1bmhvZmVyLmRlOjgwODAvdWFhL29hdXRoL3Rva2VuIiwiemlkIjoidWFhIiwiYXVkIjpbInJhYmJpdG1xIiwicmFiYml0X2NsaWVudCJdfQ.wsYdhbcKUX45l02nMyWIiWleTvMUi3jJIWdzDlae31WojZsOhChqZCZ-Uq-_2xeHwy9ddZfNpdWbfaFUNjyT9YUyb9vRaZW-uvxBh9EYNbP7pmQS2EQMruburbSor9jqDIydYu78GXd4fH2laYgvnBjzkgL7pXY7iXvRLzH4fZmUawKFlYHmhifm0IgrkSvaWBRhKqbKmrtVqEjGVMWnRmP5iOWl5smSoz4gsSE3b3SYEqe9w58vaw5NzFHZHbDAUUNjnTeB32A7Tb65DLictao31m8mDNTMBAcO9L-JjygWWYOtX4kb6s5bNnHOx4sDXhqWlXaU2YAAPpYTZwLNCw",:vhost => vhost, :port => 5671, :ssl => false)
    conn.start
    ch = conn.create_channel
    ch.queue(queue_name)
    conn.stop
end
