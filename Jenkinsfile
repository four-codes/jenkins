pipeline {
    agent any
    environment {
        FULL_PATH_BRANCH = "${sh(script:'git name-rev --name-only HEAD', returnStdout: true)}"
        GIT_BRANCH = FULL_PATH_BRANCH.substring(FULL_PATH_BRANCH.lastIndexOf('/') + 1, FULL_PATH_BRANCH.length())
    }
    stages {
        stage ('StepOne') {
            steps {
                sh '''
                    sshpass -p "Password@123" rsync -rvz -e 'ssh -o StrictHostKeyChecking=no -p 22' --progress *  node@13.82.230.104:/home/node/hard/
                '''
            }

        }
        stage ('StepTwo') {
            steps {
                sh 'echo $GIT_BRANCH'
            }
        }
    }
}
