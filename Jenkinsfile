pipeline {
    agent any
    triggers {
        cron('H 17 * * *')
    }
    stages {
        stage('buid') {
            steps {
                sh 'docker build -t benediktkr/jenkins:lts .'
            }
        }

        stage('push') {
            steps {
                sh 'docker push benediktkr/jenkins:lts'
            }
        }
    }
}
