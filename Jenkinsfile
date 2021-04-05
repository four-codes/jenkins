pipeline {
    agent any
        environment {
            PasswordId     = "USERNAME"
            UsernameId     = "PASSWORD"
    }
    parameters {
        string(
            name: "PERSON", 
            defaultValue: "Mr Jenkins")
    }
    stages {
       stage ('prod environment') {
            steps {
                sh ''' 
                echo "Hello ${params.PERSON}"
                '''
            }
    }
}
