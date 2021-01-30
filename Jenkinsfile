pipeline {
    agent any
    parameters {
        choice(
            choices: ['dev' , 'test', 'master'],
            description: 'Mention the target environment',
            defaultValue: 'Empty',
            name: 'REQUESTED_ACTION')
    }
    stages {
        stage ('Development') {
            when {
                expression { params.REQUESTED_ACTION == 'dev' || params.REQUESTED_ACTION != 'Empty' }
            }
            steps {
                echo "Hello, development env!"
            }
        }
        stage ('Test Environment') {
            when {
                expression { params.REQUESTED_ACTION == 'dev' || params.REQUESTED_ACTION != 'Empty' }
            }
            steps {
                echo "Hello, test env!"
            }
        }
        stage ('Prod Environment') {
            when {
                expression { params.REQUESTED_ACTION == 'dev' || params.REQUESTED_ACTION != 'Empty' }
            }
            steps {
                echo "Hello, prod env!"
            }
        }
    }
}