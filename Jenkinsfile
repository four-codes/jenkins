pipeline {
    agent any
    parameters {
        choice(
            choices: ['dev' , 'test', 'master'],
            description: '',
            name: 'REQUESTED_ACTION')
    }

    stages {
        stage ('Development') {
            when {
                expression { params.REQUESTED_ACTION == 'dev' }
            }
            steps {
                echo "Hello, development env!"
            }
        }
        stage ('Test Environment') {
            when {
                expression { params.REQUESTED_ACTION == 'test' }
            }
            steps {
                echo "Hello, test env!"
            }
        }
        stage ('Prod Environment') {
            when {
                expression { params.REQUESTED_ACTION == 'master' }
            }
            steps {
                echo "Hello, prod env!"
            }
        }
    }
}