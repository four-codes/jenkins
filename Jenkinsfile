pipeline {
    agent any
    parameters {
        choice(
            choices: ['Select', 'dev' , 'test', 'prod'],
            description: 'Mention the target environment',
            name: 'REQUESTED_ACTION')
    }
    stages {
        stage ('Development') {
            when {
                expression { params.REQUESTED_ACTION == 'Select' }
            }
            steps {
                echo "PLEASE PASS TARGET NAME"
            }
        }
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
                expression { params.REQUESTED_ACTION == 'prod' }
            }
            steps {
                echo "Hello, prod env!"
            }
        }
    }
}