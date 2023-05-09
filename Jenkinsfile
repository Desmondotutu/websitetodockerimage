pipeline {
    agent any
    tools {
        sonarScanner 'SonarScanner'
        dependencyCheck 'Dependency-Check'
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Desmondotutu/websitetodockerimage.git'
            }
        }
        stage('Dependency Test') {
            steps {
                sh "${tool('Dependency-Check')}/bin/dependency-check.sh --scan . --format HTML --project 'WebsiteToDockerImage' --out dependency-check-report.html"
            }
        }
        stage('Security Scan') {
            steps {
                withSonarQubeEnv('SonarServer') {
                    sh "${tool('SonarScanner')}/bin/sonar-scanner"
                }
            }
        }
    }
}

