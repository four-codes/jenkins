@Library('github.com/releaseworks/jenkinslib')

pipeline {
    agent any

    stages {
        stage ('demo') {
withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'aws-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY']]) {
        AWS("--region=eu-west-1 s3 ls")
    }
    }
}
}
