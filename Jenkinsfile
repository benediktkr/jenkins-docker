pipeline {
    agent any
    triggers {
        cron('H 17 * * *')
    }
    options {
        timestamps()
        ansiColor("xterm")
    }
    stages {
        stage('build') {
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
